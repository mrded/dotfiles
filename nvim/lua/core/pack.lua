local M         = {}

local pack_dir  = vim.fn.stdpath("data") .. "/site/pack/core/opt"
local pack_root = vim.fn.stdpath("data") .. "/site/pack/core"

-- Return a set of directory entry names, or {} if the path does not exist
local function dir_set(path)
  local names = {}
  if vim.fn.isdirectory(path) == 1 then
    for _, name in ipairs(vim.fn.readdir(path)) do
      names[name] = true
    end
  end
  return names
end

-- Build a vim.pack-compatible spec from a plugin spec { src, tag, ... }
local function to_vim_spec(spec)
  if not spec or not spec.src then return nil end

  local url  = spec.src:match("^https?://") and spec.src or "https://github.com/" .. spec.src
  local name = spec.name or url:match("([^/]+)$")

  return { src = url, name = name, version = spec.tag, data = {} }
end

-- Detect cycles in a dependency graph using DFS
-- Returns a cycle description string, or nil if none found
local function detect_cycle(graph)
  local WHITE, GRAY, BLACK = 0, 1, 2
  local colors = {}
  local path = {}

  for name in pairs(graph) do colors[name] = WHITE end

  local function dfs(name)
    colors[name] = GRAY
    table.insert(path, name)
    for _, dep in ipairs(graph[name] or {}) do
      if colors[dep] == nil then colors[dep] = WHITE end
      if colors[dep] == GRAY then
        local cycle = {}
        for i, n in ipairs(path) do
          if n == dep then
            for j = i, #path do table.insert(cycle, path[j]) end
            table.insert(cycle, dep)
            break
          end
        end
        return table.concat(cycle, " → ")
      elseif colors[dep] == WHITE then
        local result = dfs(dep)
        if result then return result end
      end
    end
    table.remove(path)
    colors[name] = BLACK
    return nil
  end

  for name in pairs(graph) do
    if colors[name] == WHITE then
      local result = dfs(name)
      if result then return result end
    end
  end
  return nil
end

-- Collect all plugin specs from lua/plugins/*.lua
local function collect_specs()
  local plugin_files  = vim.fn.globpath(
    vim.fn.stdpath("config") .. "/lua/plugins",
    "*.lua",
    false,
    true
  )

  local specs_map     = {}
  local configs       = {}
  local install_hooks = {}
  local deps_graph    = {} -- name → [dep_names]

  local function add_spec(spec)
    local vim_spec = to_vim_spec(spec)
    if not vim_spec then return end

    local name = vim_spec.name

    -- Deduplicate: prefer pinned specs over unpinned
    local existing = specs_map[name]
    if not existing or (vim_spec.version and not existing.version) then
      specs_map[name] = vim_spec
    end

    if spec.config then configs[name] = spec.config end
    if spec.install then install_hooks[name] = spec.install end

    -- requires: array of { src, tag } — no nesting, no hooks
    if spec.requires then
      deps_graph[name] = deps_graph[name] or {}
      for _, dep in ipairs(spec.requires) do
        local dep_vim = to_vim_spec(dep)
        if dep_vim then
          table.insert(deps_graph[name], dep_vim.name)
        end
        add_spec(dep)
      end
    end
  end

  local failed = {}
  for _, file in ipairs(plugin_files) do
    local ok, spec = pcall(dofile, file)
    if ok then
      if spec then add_spec(spec) end
    else
      local filename = vim.fn.fnamemodify(file, ":t")
      table.insert(failed, filename)
      vim.notify("Error loading " .. filename .. ":\n" .. tostring(spec), vim.log.levels.ERROR)
    end
  end

  if #failed > 0 then
    return nil, nil, nil, failed
  end

  local cycle = detect_cycle(deps_graph)
  if cycle then
    vim.notify("Circular dependency detected: " .. cycle, vim.log.levels.ERROR)
    return nil, nil, nil, { "circular dependency: " .. cycle }
  end

  local specs = {}
  for _, vim_spec in pairs(specs_map) do
    table.insert(specs, vim_spec)
  end

  return specs, configs, install_hooks, nil
end

-- Run install hooks for newly installed plugins.
--
-- On failure the plugin directory is removed via vim.pack.del() so that the
-- next :PackSync treats it as missing and retries the full install from scratch.
-- This avoids a permanently broken plugin sitting on disk with no way to recover
-- short of manual intervention.
local function run_hooks(install_hooks, plugin_names_filter)
  local installed = vim.pack.get()

  local filter_set
  if plugin_names_filter then
    filter_set = {}
    for _, name in ipairs(plugin_names_filter) do filter_set[name] = true end
  end

  for _, plugin in ipairs(installed) do
    local name = plugin.spec.name
    if (not filter_set or filter_set[name]) and install_hooks[name] then
      local hook = install_hooks[name]
      if type(hook) == "string" then
        print("Running install hook for " .. name)
        vim.fn.system("cd " .. vim.fn.shellescape(plugin.path) .. " && " .. hook)
        if vim.v.shell_error ~= 0 then
          vim.notify("Install hook failed for " .. name .. ", removing plugin", vim.log.levels.ERROR)
          vim.pack.del({ name }, { force = true })
        end
      elseif type(hook) == "function" then
        vim.schedule(function()
          print("Running install hook for " .. name)
          local ok, err = pcall(hook)
          if not ok then
            vim.notify("Install hook error for " .. name .. ": " .. err, vim.log.levels.ERROR)
            vim.notify("Removing " .. name .. " so :PackSync retries", vim.log.levels.ERROR)
            vim.pack.del({ name }, { force = true })
          end
        end)
      end
    end
  end
end

-- Load plugin configurations
function M.load_configs(configs, installed_names)
  installed_names = installed_names or dir_set(pack_dir)

  for name, config in pairs(configs) do
    if installed_names[name] and type(config) == "function" then
      local ok, err = pcall(config)
      if not ok then
        vim.notify("Error in " .. name .. " config: " .. err, vim.log.levels.ERROR)
      end
    end
  end
end

-- Sync all plugins
function M.sync()
  local specs, _, install_hooks, failed = collect_specs()

  if not specs then
    vim.notify(
      "Sync aborted: " .. #(failed or {}) .. " plugin spec(s) failed to load.\n" ..
      "Fix the errors and try again.",
      vim.log.levels.ERROR
    )
    return
  end

  -- Prune undeclared plugins
  local declared = {}
  for _, spec in ipairs(specs) do declared[spec.name] = true end

  local to_remove = {}
  for name in pairs(dir_set(pack_dir)) do
    if not declared[name] then table.insert(to_remove, name) end
  end

  if #to_remove > 0 then
    print("Removing " .. #to_remove .. " undeclared plugin(s)...")
    for _, name in ipairs(to_remove) do print("  - " .. name) end
    vim.pack.del(to_remove, { force = true })
  end

  -- Update unpinned plugins by fetching, checking for new commits, then deleting and
  -- re-cloning only when an update exists. Re-cloning rather than pulling ensures the
  -- install hook reruns (e.g. telescope-fzf-native needs `make` after every source update).
  -- If the fetch fails (no network, etc.) the plugin is left as-is.
  local installed = dir_set(pack_dir)
  for _, spec in ipairs(specs) do
    if installed[spec.name] and not spec.version then
      local path = vim.fn.shellescape(pack_dir .. "/" .. spec.name)
      vim.fn.system("git -C " .. path .. " fetch --quiet 2>/dev/null")
      if vim.v.shell_error == 0 then
        local head       = vim.trim(vim.fn.system("git -C " .. path .. " rev-parse HEAD"))
        local fetch_head = vim.trim(vim.fn.system("git -C " .. path .. " rev-parse FETCH_HEAD"))
        if head ~= fetch_head then
          vim.fn.delete(pack_dir .. "/" .. spec.name, "rf")
          installed[spec.name] = nil
        end
      end
    end
  end

  -- Install all missing plugins (genuinely absent + just-deleted unpinned ones)
  local missing_specs = {}
  for _, spec in ipairs(specs) do
    if not installed[spec.name] then table.insert(missing_specs, spec) end
  end

  if #missing_specs > 0 then
    vim.pack.add(missing_specs, { load = true, confirm = false })

    -- Wait for clones to complete, then run install hooks
    local new_names = vim.tbl_map(function(s) return s.name end, missing_specs)
    local function wait_and_run_hooks()
      for _, name in ipairs(new_names) do
        if vim.fn.isdirectory(pack_dir .. "/" .. name) == 0 then
          vim.defer_fn(wait_and_run_hooks, 100)
          return
        end
      end
      run_hooks(install_hooks, new_names)
    end
    vim.schedule(wait_and_run_hooks)
  end

  print("\nSync complete! Restart NeoVim to load new plugins.")
end

-- Remove all installed plugins (clean slate, no confirmation)
function M.nuke()
  print("Removing all plugins...")
  vim.fn.delete(pack_root, "rf")
  print("Done. Run :PackSync to reinstall.")
end

-- Create user commands
vim.api.nvim_create_user_command("PackSync", M.sync, {})
vim.api.nvim_create_user_command("PackNuke", M.nuke, {})

-- Skip plugin loading when invoked for a Pack command (nvim +PackSync, nvim +PackNuke, etc.)
-- so that pack commands run without plugin startup noise and errors.
for _, arg in ipairs(vim.v.argv) do
  if type(arg) == "string" and arg:match("^%+Pack") then
    return M
  end
end

-- Auto-load configs on startup (without installing missing plugins)
local specs, configs, _, failed = collect_specs()

if not specs then
  vim.notify(
    "Warning: " .. #(failed or {}) .. " plugin spec(s) failed to load.\n" ..
    "Plugin configs not loaded. Fix errors and restart.",
    vim.log.levels.WARN
  )
  return M
end

local installed_names = dir_set(pack_dir)
for name in pairs(installed_names) do pcall(vim.cmd.packadd, name) end

M.load_configs(configs, installed_names)

local missing = {}
for _, spec in ipairs(specs) do
  if not installed_names[spec.name] then table.insert(missing, spec.name) end
end
if #missing > 0 then
  vim.defer_fn(function()
    vim.notify("Missing " .. #missing .. " plugin(s). Run :PackSync to install", vim.log.levels.WARN)
  end, 100)
end

return M
