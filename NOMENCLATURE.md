# Repository Nomenclature

This document defines the official naming conventions for all files, folders, and content in this repository.

---

## Core Principles

1. **Consistency** - Same type of content uses the same naming pattern
2. **Clarity** - Names should be immediately understandable
3. **Scannability** - Easy to find things quickly
4. **Machine-friendly** - No spaces, proper casing for tools

---

## Directory Naming Conventions

### Learning Modules (Numbered)

**Pattern**: `##-Title-Case-With-Hyphens/`

Learning modules that have a logical progression get two-digit prefixes (00-99).

```
01-Communication-Clarity/
02-Data-Storytelling/
08-AI-Skills/
```

**Rules**:
- Two-digit prefix for ordering (00, 01, 02, not 1, 2, 3)
- Title Case for all words
- Hyphens to separate words (no spaces, no underscores)
- Descriptive noun phrases

**Examples**:
- ✅ `01-Communication-Clarity/`
- ✅ `08-AI-Skills/`
- ❌ `1-communication-clarity/` (missing zero, lowercase)
- ❌ `01-Communication Clarity/` (has spaces)
- ❌ `01_communication_clarity/` (uses underscores)

### Support Directories (Lowercase)

**Pattern**: `lowercase-with-hyphens/`

Support directories for tools, resources, and utilities use lowercase with hyphens.

```
ai-prompts/
learn-code/
frameworks/
templates/
tests/
tools/
```

**Rules**:
- All lowercase
- Hyphens to separate words
- No prefixes
- Descriptive nouns

**Examples**:
- ✅ `ai-prompts/`
- ✅ `learn-code/`
- ❌ `AI-Prompts/` (wrong case)
- ❌ `ai_prompts/` (uses underscores)
- ❌ `aiPrompts/` (camelCase not allowed)

### Project-Specific Directories

**Pattern**: `Title-Case-Project-Name/`

Directories for specific projects, companies, or case studies use Title Case.

```
PushOwl/
Chrome-Extensions/
```

**Rules**:
- Title Case
- Hyphens for multi-word names
- Proper noun capitalization preserved

---

## File Naming Conventions

### Documentation Files (UPPERCASE)

**Pattern**: `UPPERCASE.md` or `UPPERCASE-WITH-HYPHENS.md`

Repository-level documentation uses uppercase.

```
README.md
CHEATSHEET.md
GLOSSARY.md
NOMENCLATURE.md
DOCUMENTATION-GUIDELINES.md
```

**Rules**:
- All caps
- `.md` extension
- Hyphens for multi-word files
- Single word when possible

**Examples**:
- ✅ `README.md`
- ✅ `CHEATSHEET.md`
- ✅ `DOCUMENTATION-GUIDELINES.md`
- ❌ `readme.md` (lowercase)
- ❌ `Cheatsheet.md` (mixed case)
- ❌ `documentation_guidelines.md` (underscores)

### Module Index Files

**Pattern**: `##-Index.md` or `00-Index.md`

Every numbered module directory must have an index file.

```
00-Index.md          ← Module overview
01-First-Topic.md
02-Second-Topic.md
```

**Rules**:
- Numbered with two digits
- Always use `00-Index.md` as the entry point
- Other files numbered in logical order

### Content Files (Title Case)

**Pattern**: `##-Title-Case-With-Hyphens.md`

Content files within modules use numbered Title Case.

```
01-Answer-First.md
02-Impact-Translation.md
03-Writing-For-Clarity.md
```

**Rules**:
- Two-digit prefix
- Title Case
- Hyphens between words
- Descriptive action phrases or noun phrases

**Examples**:
- ✅ `01-Answer-First.md`
- ✅ `02-Baseline-First.md`
- ❌ `1-answer-first.md` (missing zero, lowercase)
- ❌ `01_answer_first.md` (uses underscores)

### Configuration Files (lowercase)

**Pattern**: `lowercase-with-hyphens.extension` or `lowercase.extension`

Configuration and utility files use lowercase.

```
package.json
.gitignore
tsconfig.json
doc-validator.sh
```

**Rules**:
- All lowercase
- Use standard names for standard files
- Hyphens for multi-word scripts

---

## Special Directories

### Archive/Old Content

**Pattern**: `archive/` or `old-[name]/`

```
archive/
old-experiments/
deprecated-modules/
```

**Rules**:
- Use `archive/` when possible
- Prefix with `old-` or `deprecated-` for clarity
- Always lowercase

### Temporary/WIP

**Pattern**: `wip-[description]/` or `draft-[name]/`

```
wip-new-module/
draft-observability/
```

**Rules**:
- Clear prefix (`wip-`, `draft-`, `temp-`)
- Lowercase
- Move or rename when finalized

---

## Cross-References and Links

### Internal Links (Markdown)

Always use relative paths from current location:

```markdown
✅ [Module Index](00-Index.md)
✅ [Communication Clarity](../01-Communication-Clarity/)
✅ [Answer First](01-Communication-Clarity/01-Answer-First.md)

❌ /Users/username/learn/01-Communication-Clarity/
❌ C:\learn\01-Communication-Clarity\
```

### Anchor Links

Use lowercase with hyphens for heading anchors:

```markdown
✅ [PM Development Path](#pm-development-path)
✅ [Core Principles](#core-principles)

❌ [PM Development Path](#PM-Development-Path)
❌ [Core Principles](#core_principles)
```

---

## Naming Patterns by Content Type

| Content Type | Pattern | Example |
|--------------|---------|---------|
| Learning Module | `##-Title-Case/` | `01-Communication-Clarity/` |
| Sub-module | `##-Title-Case/` | `00-AI-Fundamentals/` |
| Module Index | `00-Index.md` | `00-Index.md` |
| Content File | `##-Title-Case.md` | `01-Answer-First.md` |
| Repository Doc | `UPPERCASE.md` | `README.md`, `GLOSSARY.md` |
| Support Dir | `lowercase-hyphen/` | `ai-prompts/`, `templates/` |
| Project Dir | `Title-Case/` | `PushOwl/`, `Chrome-Extensions/` |
| Config File | `lowercase.ext` | `package.json`, `.gitignore` |
| Script File | `lowercase-hyphen.sh` | `doc-validator.sh` |
| Archive | `archive/` or `old-name/` | `archive/`, `old-experiments/` |

---

## File Organization Within Modules

### Standard Module Structure

```
##-Module-Name/
├── 00-Index.md                 ← Required: Module overview
├── 01-First-Topic.md           ← Content in logical order
├── 02-Second-Topic.md
├── 03-Third-Topic.md
├── GLOSSARY.md                 ← Optional: Module-specific terms
├── CHEATSHEET.md               ← Optional: Quick reference
├── examples/                   ← Optional: Example code/content
│   ├── example-1.md
│   └── example-2.md
└── exercises/                  ← Optional: Practice materials
    ├── exercise-1.md
    └── exercise-2.md
```

### Sub-directories Within Modules

Use lowercase-hyphen pattern for supporting directories:

```
02-Data-Storytelling/
├── 00-Index.md
├── 01-Data-Triangulation.md
├── 02-Baseline-First.md
├── data-visualization/          ← Supporting content
│   ├── graph-types/
│   └── chart-examples/
└── templates/                   ← Templates/resources
    └── dashboard-template.md
```

---

## Version Control Practices

### Branch Naming

**Pattern**: `category/description-with-hyphens`

```
feature/add-observability-module
fix/broken-links-in-readme
docs/update-nomenclature
refactor/rename-directories
```

**Categories**:
- `feature/` - New content or functionality
- `fix/` - Bug fixes or corrections
- `docs/` - Documentation updates
- `refactor/` - Restructuring without changing content
- `chore/` - Maintenance tasks

### Commit Messages

**Pattern**: Present tense, imperative mood, capitalized

```
✅ Add observability module to AI Skills
✅ Fix broken links in README
✅ Update nomenclature with new standards
✅ Refactor directory structure for consistency

❌ added observability module
❌ fixing broken links
❌ Updated nomenclature
```

---

## Migration Guide

When renaming existing files/directories:

1. **Create list** of items that violate nomenclature
2. **Use `git mv`** to preserve history
3. **Update references** in all linking files
4. **Test links** to ensure nothing broke
5. **Commit with clear message** explaining the rename

Example workflow:

```bash
# Rename directory
git mv "old name with spaces" new-name-with-hyphens

# Update references
grep -r "old name with spaces" . --exclude-dir=node_modules

# Commit
git commit -m "Rename directory to follow nomenclature standards"
```

---

## Exceptions

### When to Break the Rules

1. **Third-party conventions** - Keep `node_modules/`, `.git/`, etc.
2. **Standard filenames** - Keep `package.json`, `tsconfig.json`, etc.
3. **Generated files** - Build outputs may have their own conventions
4. **External projects** - Maintain original naming if it's not your code

### Grandfathered Content

Some directories may temporarily violate these rules during migration:
- Document the exception in this file
- Create a plan to migrate
- Set a timeline for compliance

---

## Enforcement

### Automated Checks

The `doc-validator.sh` tool checks:
- Em-dashes in content
- ASCII diagram formatting
- Spacing issues

Future additions:
- Directory naming validation
- File naming validation
- Link checker

### Manual Review

Before committing:
1. Check new file names against this guide
2. Verify links work
3. Ensure directory structure makes sense
4. Update this document if new patterns emerge

---

## Quick Reference

**Most Common Patterns**:

```
Learning Module:     01-Communication-Clarity/
Module File:         01-Answer-First.md
Module Index:        00-Index.md
Repository Doc:      README.md, GLOSSARY.md
Support Directory:   ai-prompts/, templates/
Project Directory:   PushOwl/, Chrome-Extensions/
Script File:         doc-validator.sh
Config File:         package.json, .gitignore
```

**Questions to Ask**:

1. Is this a learning module? → Use `##-Title-Case/`
2. Is this a support directory? → Use `lowercase-hyphen/`
3. Is this a repository-level doc? → Use `UPPERCASE.md`
4. Is this content within a module? → Use `##-Title-Case.md`
5. Is this a config or script? → Use `lowercase.extension`

---

*This nomenclature applies to all content in the repository. When in doubt, prioritize consistency and clarity.*
