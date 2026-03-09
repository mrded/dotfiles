---
name: codestyle
description: This skill should be used when writing, editing, or reviewing code, creating tests, or when the user asks about "code style", "codestyle", "formatting", "best practices", or code quality. Apply these rules to all code changes.
version: 1.0.0
---

# Code Style Guide

This skill defines the code style and quality standards to follow for all code written or modified.

## Core Principles

Apply these rules consistently across all code changes:

### Variable Declarations

- **NEVER use `let`** - Always use `const` for immutable bindings, or restructure code to avoid reassignment
- If you absolutely need mutability, consider refactoring to functional patterns first

### Type Safety

- **NEVER use type hacks like `any`** - Always use proper types
- Use `unknown` if the type is truly unknown, then narrow it with type guards
- Prefer explicit types over implicit `any`
- Use proper generics and type inference instead of type escape hatches

### Testing Guidelines

When creating tests, follow these strict rules:

1. **Keep tests simple** - Follow the AAA (Arrange, Act, Assert) pattern:
   - **Arrange**: Set up test data and conditions
   - **Act**: Execute the code being tested
   - **Assert**: Verify the expected outcome

2. **Minimal test creation** - DO NOT create extensive test suites unless explicitly requested
   - Create just a couple of smoke check tests to verify basic functionality
   - Focus on critical paths only
   - Avoid over-testing edge cases unless asked

### TypeScript Project Rules

- **DO NOT use `.js` extensions in imports** - Use extensionless imports
  ```typescript
  // ✅ Correct
  import { foo } from './module'
  import { bar } from '../utils/helper'

  // ❌ Wrong
  import { foo } from './module.js'
  import { bar } from '../utils/helper.js'
  ```

### Git Operations

- **NEVER run git write commands** - You are prohibited from executing:
  - `git commit`
  - `git push`
  - `git merge`
  - `git rebase`
  - `git cherry-pick`
  - Any other command that modifies git history or remote state

- **Read-only git access** - You may only:
  - View git history with `git log`
  - Check status with `git status`
  - View diffs with `git diff`
  - Inspect branches and refs

## Code Review Checklist

When reviewing or writing code, verify:

- [ ] No `let` declarations present
- [ ] No `any` types or type escape hatches
- [ ] Tests follow AAA pattern and are minimal
- [ ] TypeScript imports are extensionless
- [ ] No git write commands are executed
