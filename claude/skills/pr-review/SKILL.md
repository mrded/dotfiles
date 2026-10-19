---
name: pr-review
description: Review the current branch's changes against the main branch, give a code review, and draft a very simple PR title and a short PR description saying what problem the change solves. Use when the user says "pr review", "review my branch", "review against main", "prep a PR", "write a PR description", or invokes /pr-review.
allowed-tools: Bash, Read, Grep, Glob
---

# PR Review

Review everything on this branch that isn't on main, then produce a review and a ready-to-paste PR title + description.

## 1. Gather the diff

```bash
git fetch origin --quiet 2>/dev/null
BASE_BRANCH=$(git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null | sed 's#^origin/##')
BASE_BRANCH=${BASE_BRANCH:-main}
BASE=$(git merge-base "origin/$BASE_BRANCH" HEAD 2>/dev/null || git merge-base "$BASE_BRANCH" HEAD)

git branch --show-current
git log --oneline "$BASE"..HEAD
git status --short
git diff --stat "$BASE"
git diff "$BASE"
```

`git diff "$BASE"` (no `..HEAD`) deliberately includes staged and unstaged work, so the review matches what the PR will contain once committed. If there are uncommitted changes, say so at the top of the output.

If the diff is empty, say so and stop.

For large diffs, read `--stat` first, then the diff file by file. Open the surrounding code with Read when a hunk alone isn't enough to judge it — don't review blind.

## 2. Review the code

Read the repo's `CLAUDE.md` / `CLAUDE.local.md` first and check the change against its conventions.

Look for, in priority order:
1. **Bugs** — wrong logic, missed edge cases, broken error handling, race conditions, behaviour changes callers won't expect.
2. **Security** — injection, auth gaps, secrets, unsafe input handling.
3. **Missing or weak tests** — changed behaviour with no test, tests that don't actually assert the change.
4. **Consistency** — related files that should have changed but didn't (docs, specs, schemas, fixtures, other tests asserting the same output).
5. **Readability / simplification** — only if it clearly matters; skip nitpicks.

Only report things you've verified against the code. Each finding: `path:line` — what's wrong — why it matters — suggested fix. If nothing is wrong in a category, don't invent something.

## 3. Write the PR title and description

**Title**: plain, short (≤ 60 chars), describes the change in everyday words. No ticket prefixes or conventional-commit tags unless the repo's recent PR titles use them (check `git log --oneline -20 "$BASE_BRANCH"`).

**Description**: 2–4 sentences max. Lead with the **problem** being solved (why this PR exists), then one line on **what** changed. No file-by-file lists, no headings, no testing checklists.

## Output format

```
## Review

<findings grouped by severity: 🔴 Must fix / 🟡 Should fix / 🟢 Nit — omit empty groups>
<or "No issues found." if clean>

## PR

**Title:** <title>

**Description:**
<description>
```

Do not create the PR, commit, or push. Offer to open the PR with `gh pr create` only after showing the output.
