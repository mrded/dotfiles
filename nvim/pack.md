# NeoVim Plugin Manager Specification

## Overview

Replace Packer.nvim with vim.pack (NeoVim 0.12+ built-in package manager).

## Design Principles

1. **Simplicity**: Minimal code, easy to maintain and extend
2. **Explicit**: One spec format, one hook type, clear behaviour
3. **User Control**: Pin versions via `tag`, or get latest by omitting it
4. **Non-Interactive**: All commands safe for CLI usage

## Architecture

### File Structure

```
nvim/
├── init.lua
└── lua/
    ├── core/
    │   ├── pack.lua          # vim.pack wrapper
    │   └── migrate.lua       # one-time machine migrations (e.g. remove legacy Packer dir)
    └── plugins/
        ├── telescope.lua     # One file per plugin
        └── *.lua
```

### Core Components

**nvim/lua/core/pack.lua**:

- Loads all plugin specs from `lua/plugins/*.lua`
- Resolves dependency graph (with circular dependency detection)
- Deduplicates plugins across the graph
- Manages install hooks and config functions
- Implements `:PackSync` and `:PackNuke`

**nvim/lua/core/migrate.lua**:

- Runs one-time migrations on first startup after each is introduced
- Each migration is gated by a marker file under `stdpath('data')/dotfiles-migrations/`
- Currently: removes the legacy Packer directory (`site/pack/packer/`) so stale plugins cannot shadow vim.pack-managed ones

## Plugin Spec Format

```lua
return {
  src = 'author/plugin-name',        -- GitHub shorthand or full URL (required)
  tag = 'v1.2.3',                   -- Optional: pin to tag, branch, or SHA
  requires = {                       -- Optional: dependencies (src and tag only, no nesting)
    { src = 'nvim-lua/plenary.nvim' },
    { src = 'nvim-telescope/telescope-fzf-native.nvim', tag = 'v0.6.0' },
  },
  install = 'brew install fd ripgrep', -- Optional: runs once on first install
  config = function()                -- Optional: runs on startup
    require('plugin-name').setup({})
  end,
}
```

### Spec Fields

| Field      | Type                 | Description                                                             |
| ---------- | -------------------- | ----------------------------------------------------------------------- |
| `src`      | `string`             | GitHub `'author/repo'` or full URL (required)                           |
| `tag`      | `string`             | Pin to tag, branch, or SHA (optional; omit for latest)                  |
| `requires` | `table`              | Array of dependency specs — `src` and `tag` only, no nesting (optional) |
| `install`  | `string \| function` | Runs on every clone of the plugin — first install and updates (optional) |
| `config`   | `function`           | Runs on startup for installed plugins (optional)                        |

### Dependencies

Inline dependency specs support only `src` and `tag`. If a dependency needs hooks, configuration, or its own dependencies, it must have its own file in `lua/plugins/`.

```lua
requires = {
  { src = 'nvim-lua/plenary.nvim' },
  { src = 'nvim-telescope/telescope-fzf-native.nvim', tag = 'v0.6.0' },
}
```

| Field | Type     | Description                                   |
| ----- | -------- | --------------------------------------------- |
| `src` | `string` | GitHub `'author/repo'` or full URL (required) |
| `tag` | `string` | Pin to tag, branch, or SHA (optional)         |

Inline specs are minimal hints to the dependency resolver. The canonical definition for any shared plugin lives in its own `lua/plugins/<name>.lua` file. If the same plugin appears in multiple places, deduplication merges them — preferring the spec with a `tag` (typically the canonical file). This means pinning a version in one place propagates everywhere automatically.

## Hooks

### Install Hook (`install`)

Runs on every clone of the plugin — both fresh installs and updates (see Update Behavior).

- String: executed as a shell command in the plugin directory
- Function: executed via `pcall()`
- On failure: the plugin directory is removed so `:PackSync` retries from scratch on the next run, avoiding a permanently broken install

```lua
install = 'make'                      -- shell command, runs in plugin dir
install = 'brew install fd ripgrep'   -- shell command, runs in plugin dir
install = function()                  -- or a function
  require('some-module').post_install()
end
```

### Config (`config`)

Runs on every NeoVim startup for installed plugins.

```lua
config = function()
  require('telescope').setup({})
end
```

## Commands

### `:PackSync`

**Purpose**: Bring installed plugins in sync with specs

**Behavior**:

1. Load all specs from `lua/plugins/*.lua` — abort on any error
2. Resolve dependency graph; error on circular dependencies
3. Remove plugins not present in any spec
4. For each unpinned installed plugin: `git fetch`, compare `HEAD` to `FETCH_HEAD` — delete and re-clone only if there is a new commit; skip if fetch fails (no network)
5. Install all missing plugins (absent + just-deleted) via `vim.pack.add()`
6. Run `install` hook for every cloned plugin; remove plugin on failure

```bash
nvim +PackSync          # day-to-day: install, update, remove
```

### `:PackNuke`

**Purpose**: Remove all installed plugins (clean slate)

**Behavior**:

1. Delete `~/.local/share/nvim/site/pack/core/`
2. No confirmation

```bash
nvim +PackNuke              # wipe everything
nvim +PackNuke +PackSync    # reinstall from scratch
```

## Workflows

### Fresh Installation

```bash
ln -s ~/dotfiles/nvim ~/.config/nvim
nvim +PackSync
```

### Adding a Plugin

1. Create `nvim/lua/plugins/plugin-name.lua`
2. Run `:PackSync`

### Removing a Plugin

1. Delete `nvim/lua/plugins/plugin-name.lua`
2. Run `:PackSync` — plugin is automatically uninstalled

### Pinning a Version

Set `tag` in the spec — `:PackSync` will not update pinned plugins:

```lua
return {
  src = 'nvim-telescope/telescope.nvim',
  tag = 'v0.2.1',
}
```

### Getting Latest

Omit `tag` — `:PackSync` will pull the latest changes on every run.

### Changing a Version

1. Edit `tag` in the spec (or remove it to track latest)
2. Run `:PackNuke` then `:PackSync`, or remove the single plugin directory manually and run `:PackSync`

## Implementation Details

### Spec Loading

```lua
local specs, configs, hooks, failed = collect_specs()
```

- Glob `lua/plugins/*.lua`, `dofile()` each with `pcall()`
- Track failures — abort sync if any file fails to load
- Recursively process `requires` to build the full plugin set
- Deduplicate by plugin name (prefer pinned specs over unpinned)

### Dependency Resolution

**Graph construction**: build an adjacency list from all `requires` fields.

**Circular dependency detection**: DFS with a visited/in-stack set. Error on cycle:

```
Circular dependency detected: telescope.nvim → plenary.nvim → telescope.nvim
```

**Deduplication**: if the same plugin appears multiple times (via different dependency paths), install it once. Prefer the spec with a `tag` if one has it and another doesn't. This makes the canonical `lua/plugins/<name>.lua` file (which typically carries the pinned version) the winner over minimal inline hints in `requires`.

**Topological sort**: determines a safe install order so dependencies install before dependants.

### Async Install and Hook Execution

`vim.pack.add()` is async — hooks must not run before clones finish. Poll the filesystem until all expected plugin directories exist, then run hooks:

```lua
local function wait_and_run_hooks(new_plugins, hooks)
  local all_ready = true
  for _, name in ipairs(new_plugins) do
    if vim.fn.isdirectory(pack_dir .. '/' .. name) == 0 then
      all_ready = false
      break
    end
  end

  if all_ready then
    run_hooks(new_plugins, hooks)
  else
    vim.defer_fn(function() wait_and_run_hooks(new_plugins, hooks) end, 100)
  end
end
```

If an `install` hook fails, the plugin directory is removed via `vim.pack.del()` so that the next `:PackSync` treats it as missing and retries from scratch.

### Update Behavior

- Plugins **with** `tag`: pinned — `:PackSync` leaves them untouched
- Plugins **without** `tag`: deleted and re-cloned on every `:PackSync`

For each unpinned plugin, `:PackSync` runs `git fetch` then compares `HEAD` to `FETCH_HEAD`. If they differ the plugin directory is deleted and re-cloned; if the fetch fails (no network) the plugin is left untouched. Re-cloning rather than pulling ensures the `install` hook reruns after every source update (e.g. `telescope-fzf-native.nvim` needs `make` after new sources land). This reuses the existing install flow with no extra code paths.

## Non-Supported Features

### Local Plugins

Not supported. vim.pack expects git repositories. Use a git remote pointing to a local path if needed.

### Lockfile

Not managed. Version pinning is explicit via `tag` in the spec. vim.pack maintains its own internal state.

### Lazy Loading

All plugins load on startup.

## Testing

### Startup

```bash
nvim --headless -c "lua require('core/pack')" -c "quit"
```

### Fresh Install

```bash
nvim +PackNuke +PackSync
```

### Commands Registered

```bash
nvim --headless \
  -c "echo exists(':PackSync')" \
  -c "echo exists(':PackNuke')" \
  -c "quit"
```
