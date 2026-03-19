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

### Object Operations

- **NEVER use `Object.assign()`** - Use object spread syntax instead
  - Object spread is more concise and easier to read
  - Prefer immutable patterns over mutation
  ```typescript
  // ✅ Correct - object spread
  const updated = { ...original, newProp: 'value' };
  const merged = { ...obj1, ...obj2 };

  // ❌ Wrong - Object.assign()
  const updated = Object.assign({}, original, { newProp: 'value' });
  const merged = Object.assign({}, obj1, obj2);
  ```

### String Operations

- **NEVER concatenate strings with `+`** - Use template literals instead
  - Template literals are more readable and less error-prone
  - They handle multiline strings naturally
  ```typescript
  // ✅ Correct - template literals
  const message = `Hello, ${name}!`;
  const path = `${baseUrl}/api/${endpoint}`;
  const multiline = `
    Line 1
    Line 2
  `;

  // ❌ Wrong - string concatenation
  const message = 'Hello, ' + name + '!';
  const path = baseUrl + '/api/' + endpoint;
  const multiline = 'Line 1\n' + 'Line 2';
  ```

### Type Safety

- **NEVER use type hacks like `any`** - Always use proper types
- Use `unknown` if the type is truly unknown, then narrow it with type guards
- Prefer explicit types over implicit `any`
- Use proper generics and type inference instead of type escape hatches

- **Types are always defined with a first capital letter** - Use PascalCase for all type names
  ```typescript
  // ✅ Correct
  type UserProfile = { name: string; age: number };
  interface ApiResponse { data: unknown; }
  class ServiceManager { }

  // ❌ Wrong
  type userProfile = { name: string; age: number };
  interface apiResponse { data: unknown; }
  class serviceManager { }
  ```

### Error Handling

- **Avoid massive try/catch blocks** - Don't wrap large sections of code in try/catch
  - Keep try/catch blocks small and focused on specific operations that may throw
  - Handle errors at the appropriate level, not at a distance
  - Consider early returns or validation instead of defensive try/catch blocks
  ```typescript
  // ✅ Correct - focused try/catch
  const data = await validateInput(input);
  let result;
  try {
    result = await riskyOperation(data);
  } catch (error) {
    return handleOperationError(error);
  }
  return processResult(result);

  // ❌ Wrong - massive try/catch
  try {
    const data = await validateInput(input);
    const result = await riskyOperation(data);
    const processed = processResult(result);
    const formatted = formatOutput(processed);
    return formatted;
  } catch (error) {
    return handleError(error);
  }
  ```

### Control Flow

- **Avoid nested conditions** - Prefer early returns and guard clauses
  - Use early returns to reduce nesting
  - Extract complex conditions into well-named variables or functions
  - Maximum nesting depth should be 2 levels
  ```typescript
  // ✅ Correct - early returns, flat structure
  function processUser(user: User) {
    if (!user) return null;
    if (!user.isActive) return null;
    if (!user.hasPermission) return null;

    return performAction(user);
  }

  // ❌ Wrong - nested conditions
  function processUser(user: User) {
    if (user) {
      if (user.isActive) {
        if (user.hasPermission) {
          return performAction(user);
        }
      }
    }
    return null;
  }
  ```

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

- **NEVER use dynamic `import()`** - Always use static imports at the top of the file
  - Dynamic imports add complexity and make dependencies unclear
  - They make code harder to understand and maintain
  - Use static imports for all dependencies
  ```typescript
  // ✅ Correct - static imports at top
  import fs from "fs";
  import path from "path";
  import prettier from "prettier";
  import { parseProjectManifest, resolveRef } from "./schema/project";
  import { parseServiceManifest } from "./schema/service";
  import { generateApiFile } from "./generators/api";

  export async function generate(opts: { project: string }): Promise<void> {
    // Use the imported modules directly
    const content = fs.readFileSync(opts.project);
    // ...
  }

  // ❌ Wrong - dynamic imports inside function
  export async function generate(opts: { project: string }): Promise<void> {
    const fs = await import("fs");
    const path = await import("path");
    const prettier = await import("prettier");
    const { parseProjectManifest, resolveRef } = await import("./schema/project");
    const { parseServiceManifest } = await import("./schema/service");
    const { generateApiFile } = await import("./generators/api");
    // ...
  }
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
- [ ] No `Object.assign()` - use object spread syntax
- [ ] No string concatenation with `+` - use template literals
- [ ] All type names use PascalCase (first letter capitalized)
- [ ] No massive try/catch blocks - errors handled at appropriate level
- [ ] No deeply nested conditions - use early returns
- [ ] Tests follow AAA pattern and are minimal
- [ ] TypeScript imports are extensionless (no `.js`)
- [ ] No inline `import()` - use static imports
- [ ] No git write commands are executed
