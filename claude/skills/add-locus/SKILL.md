---
name: add-locus
description: Add Locus (LSP-based code intelligence MCP server) to the current project by running its init command and wiring it into .mcp.json. Use when the user says "add locus", "set up locus", "configure locus", or "install locus".
allowed-tools: Read, Write, Edit, Bash, AskUserQuestion
---

# Add Locus

Set up [Locus](https://github.com/paladini/locus-mcp) for the current project. Locus is an MCP server that gives coding agents IDE-like code intelligence (go-to-definition, references, hover types, diagnostics) via language servers.

The setup:
1. Runs `npx @paladini/locus-mcp init` to scaffold `locus.toml` / `locus.json`
2. Writes the Locus MCP entry into `.mcp.json`

**Requirements**: Node.js 22+ and language servers on PATH for your project's languages.

## Workflow

### 1. Detect context

Run:
- `pwd` — capture the absolute project path (needed for `cwd` in the MCP config)
- `node --version 2>/dev/null` — verify Node.js is available and >= 22
- `ls .mcp.json 2>/dev/null` — does an MCP config already exist?
- `ls locus.toml locus.json 2>/dev/null` — is Locus already initialised?
- `git branch --show-current` — note the branch

If `locus.toml` or `locus.json` already exists, report that Locus is already initialised and show the file. Offer to re-run `init` or just wire `.mcp.json` via AskUserQuestion before proceeding.

If Node.js is not available or below v22, report the problem and stop.

### 2. Detect language(s) and check language servers

Inspect the project for language markers:

| Detected file | Language | Required language server |
|--------------|----------|--------------------------|
| `package.json`, `*.ts`, `*.tsx` | TypeScript/JS | `typescript-language-server` + `typescript` (npm global) |
| `go.mod` | Go | `gopls` (via `go install golang.org/x/tools/gopls@latest`) |
| `Cargo.toml` | Rust | `rust-analyzer` (via `rustup component add rust-analyzer`) |
| `pyproject.toml`, `setup.py`, `*.py` | Python | `pylsp` or `pyright` |

For each detected language, check whether its language server is on PATH:
```bash
command -v typescript-language-server 2>/dev/null && echo "present" || echo "missing"
command -v gopls 2>/dev/null && echo "present" || echo "missing"
command -v rust-analyzer 2>/dev/null && echo "present" || echo "missing"
```

Collect any missing servers to report in step 6.

### 3. Ask the user

Use **AskUserQuestion**:

```yaml
question: "Set up Locus for this project?"
options:
  - label: "Yes — run init and update .mcp.json"
    description: "Scaffolds locus.toml and wires Locus into .mcp.json"
  - label: "Cancel"
    description: "Do nothing"
```

If "Cancel", stop.

### 4. Run Locus init

```bash
npx @paladini/locus-mcp init
```

This scaffolds `locus.toml` (or `locus.json`) in the project root. Show its output to the user. If it fails, report the error and stop.

Then verify the language server setup:
```bash
npx @paladini/locus-mcp check
```

Show the output — it confirms which language servers are ready.

### 5. Write or update `.mcp.json`

Use the absolute path captured in step 1 as `cwd`.

**If `.mcp.json` does not exist**, create it:

```json
{
  "mcpServers": {
    "locus": {
      "command": "npx",
      "args": ["-y", "@paladini/locus-mcp", "serve"],
      "cwd": "<absolute-project-path>"
    }
  }
}
```

**If `.mcp.json` already exists**, read it and merge the `"locus"` key into the existing `"mcpServers"` object without disturbing other entries. If a `"locus"` key already exists, overwrite it and note the change.

### 6. Warn about cwd portability

`cwd` is an absolute path baked at setup time. If `.mcp.json` is committed to the repo, other developers will get the wrong path. After writing the file, always warn:

> **Note**: `.mcp.json` contains an absolute `cwd` path (`<path>`). If you commit this file, other developers must update the `cwd` value to match their local checkout. Consider adding `.mcp.json` to `.gitignore` and having each developer run `/add-locus` in their own checkout.

### 7. Report

Print a short summary:
- Files created/updated
- Language servers detected / missing
- The `cwd` portability warning (always)
- For any missing language server, show the install command

Example missing server note:
> `typescript-language-server` not found — install with: `npm install -g typescript-language-server typescript`

## Rules

- Never commit files — leave that to the user.
- Do not write files on a feature branch without warning. If not on the default branch, mention it and confirm before writing.
- Do not skip `npx @paladini/locus-mcp init` — the `locus.toml`/`locus.json` it creates is required for Locus to function.
- Always include the `cwd` portability warning, even if the user seems aware of it.
