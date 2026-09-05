# Skills

Claude Code skills stored in `~/.claude/skills/` (symlinked from here).

## Structure

Every skill is a directory named after the skill:

```
skills/
  <skill-name>/
    SKILL.md          ← required: frontmatter + instructions
    scripts/          ← optional: supporting shell scripts
```

## Rules

- **Every skill is a directory** — no loose `.md` files
- **Always `SKILL.md`** at the directory root, never named after the skill
- **Scripts in `scripts/`** — only present if the skill needs them
- **No category grouping** — flat list, skill name is the directory name
- **Frontmatter required**: `name`, `description`, optionally `version` and `allowed-tools`

## Setup (new machine)

```bash
ln -s ~/dotfiles/claude/skills ~/.claude/skills
```
