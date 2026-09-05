---
name: add-serena
description: Add Serena (AI coding assistant with semantic code intelligence) to the current project by creating .serena/project.yml and wiring it into .mcp.json. Use when the user says "add serena", "set up serena", "configure serena", or "install serena".
allowed-tools: Read, Write, Edit, Bash, AskUserQuestion
---

# Add Serena

Set up Serena for the current project so it launches automatically when a coding agent opens this repo.
Serena is fetched on demand via `uvx` — no global install needed.

The setup creates two files:
- **`.mcp.json`** — tells Claude Code (and other MCP-aware agents) to launch Serena for this project
- **`.serena/project.yml`** — project-level Serena configuration (languages, read-only mode, etc.)

## Workflow

### 1. Detect context

Run these checks:
- `pwd` — note the project root
- `ls .mcp.json 2>/dev/null` — does an MCP config already exist?
- `ls .serena/project.yml 2>/dev/null` — is Serena already configured?
- Inspect files to detect the primary language(s): look for `package.json`, `go.mod`, `Cargo.toml`, `pyproject.toml`, `*.rb`, `*.java`, `*.cs`, etc.
- `git branch --show-current` — note the branch (Serena config should go on the default branch)

If `.serena/project.yml` already exists, report that Serena is already configured and show the current config. Offer to reconfigure it via AskUserQuestion before making any changes.

### 2. Ask the user

Use **AskUserQuestion** with these options:

```yaml
question: "How should I configure Serena for this project?"
options:
  - label: "Pin to latest stable version (recommended)"
    description: "Fetch the current Serena version and pin it — reproducible across machines"
  - label: "Always use latest (no pin)"
    description: "uvx pulls the newest Serena on every run — simpler but less reproducible"
  - label: "Cancel"
    description: "Do nothing"
```

If "Cancel", stop.

### 3. Resolve the Serena version (if pinning)

Run:
```bash
uvx --from serena-agent python -c "import importlib.metadata; print(importlib.metadata.version('serena-agent'))" 2>/dev/null \
  || uvx pip show serena-agent 2>/dev/null | grep ^Version | awk '{print $2}'
```

If the version cannot be resolved (uv not installed, network error), fall back to no-pin and note it.

### 4. Detect language(s)

Map detected files to Serena language identifiers:

| Detected file / extension | Serena language |
|---------------------------|-----------------|
| `package.json`, `*.ts`, `*.tsx` | `typescript` |
| `package.json` (no TS) | `typescript` (JS uses TS tooling in Serena) |
| `go.mod` | `go` |
| `Cargo.toml` | `rust` |
| `pyproject.toml`, `setup.py`, `*.py` | `python` |
| `*.rb`, `Gemfile` | `ruby` |
| `*.java`, `pom.xml`, `build.gradle` | `java` |
| `*.cs`, `*.csproj` | `csharp` |

If multiple languages are detected, include all of them. If none are detected, ask the user.

### 5. Write `.serena/project.yml`

Create `.serena/` if needed, then write the config:

```yaml
# Serena project configuration
# https://github.com/oraios/serena

languages:
  - <detected-language(s)>

read_only: false
```

Keep it minimal — only override what differs from Serena defaults.

### 6. Write or update `.mcp.json`

**If `.mcp.json` does not exist**, create it:

```json
{
  "mcpServers": {
    "serena": {
      "command": "uvx",
      "args": [
        "--from",
        "serena-agent==<VERSION>",
        "serena",
        "start-mcp-server",
        "--project-from-cwd",
        "--open-web-dashboard",
        "false"
      ]
    }
  }
}
```

For the no-pin variant, omit the `==<VERSION>` suffix: `"serena-agent"`.

`--open-web-dashboard false` suppresses the browser dashboard that Serena opens by default. Always include it — the web UI is rarely useful when running as an MCP server.

**If `.mcp.json` already exists**, read it and merge: add the `"serena"` key inside the existing `"mcpServers"` object without disturbing other entries. If a `"serena"` key already exists, overwrite it and note the change.

### 7. Report

Print a short summary:
- Files created/updated
- Serena version pinned (or "unpinned")
- Languages configured
- Next step: `uv` must be installed (`brew install uv`) if it isn't already

Check whether `uv` is available:
```bash
command -v uv >/dev/null 2>&1 && echo "present" || echo "missing"
```

If missing, include a note: **`uv` is not installed — run `brew install uv` before Serena will work**.

## Rules

- Never commit files — leave that to the user.
- Do not create `.serena/project.yml` or `.mcp.json` on a feature branch without warning. Check the branch; if not on the default branch, mention it and confirm before writing.
- Do not install Serena globally (`uv tool install`) — `uvx` on-demand is the intended pattern.
- Never add `--project-from-cwd` if a specific `--project` path is already present in an existing `.mcp.json` serena entry.
