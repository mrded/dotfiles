---
name: ubiquitous-language
description: Build a shared domain language for the project by scanning the codebase for terminology and creating a UBIQUITOUS_LANGUAGE.md file with terms that both human and AI understand in common.
---

# Ubiquitous Language Builder

Creates a shared vocabulary between you and the AI by analyzing the codebase and establishing common terminology.

## Purpose

Build a comprehensive domain language glossary that:
- Documents key terms, concepts, and patterns used in the project
- Ensures consistent terminology across conversations
- Reduces ambiguity in technical discussions
- Serves as onboarding documentation for new contributors

## Process

1. **Scan the codebase** for:
   - Type definitions (classes, interfaces, types, enums)
   - Key function/method names that represent domain concepts
   - Configuration keys and constants
   - Module/package names that represent bounded contexts
   - Comments and documentation strings
   - README files and existing documentation

2. **Identify patterns**:
   - Naming conventions (e.g., "Service", "Manager", "Handler", "Provider")
   - Domain-specific prefixes/suffixes
   - Abbreviations and acronyms
   - Architectural patterns (e.g., "Repository", "Factory", "Adapter")

3. **Extract terminology** from:
   - File and directory names
   - Variable and constant names
   - Type names and interfaces
   - Function signatures
   - Comments and docstrings
   - Configuration files

4. **Categorize terms** by:
   - **Core Concepts**: Fundamental domain entities and objects
   - **Patterns & Conventions**: Architectural patterns and naming conventions
   - **Tools & Technologies**: Frameworks, libraries, and tools used
   - **Processes & Workflows**: Development processes and workflows
   - **Components & Modules**: Major system components

5. **Document each term** with:
   - **Term**: The canonical name
   - **Definition**: Clear, concise explanation
   - **Context**: Where/how it's used in the codebase
   - **Examples**: Code references or usage examples
   - **Related Terms**: Cross-references to related concepts

## Output Format

Create `UBIQUITOUS_LANGUAGE.md` in the project root with structure:

```markdown
# Ubiquitous Language

> Shared vocabulary for the [Project Name] codebase
> Last updated: YYYY-MM-DD

## Core Concepts

### Term Name
**Definition**: Clear explanation of what this means

**Context**: Where and how this is used in the codebase

**Examples**:
- `path/to/file.ts:123` - Usage example
- Related pattern or implementation

**Related**: [Other Term](#other-term)

---

## Patterns & Conventions

### Pattern Name
...

## Tools & Technologies

### Tool Name
...

## Processes & Workflows

### Process Name
...

## Components & Modules

### Component Name
...

## Abbreviations & Acronyms

- **ABC**: What ABC stands for
```

## Rules

- Focus on domain-specific terminology, not generic programming terms
- Prioritize terms that appear multiple times or are central to the architecture
- Include location references (file paths) for concrete examples
- Keep definitions concise but complete
- Update the file when new patterns or terms emerge
- Cross-reference related terms for better navigation

## Anti-Patterns to Avoid

- Don't include every variable name - focus on meaningful domain concepts
- Don't document obvious or universal programming terms (e.g., "function", "class")
- Don't create definitions for one-off occurrences
- Don't use jargon in definitions - explain clearly

## Usage

After creating the ubiquitous language file:
1. Reference it in future conversations to maintain consistency
2. Update it as the project evolves
3. Use it to onboard new team members
4. Refer to it when making architectural decisions
