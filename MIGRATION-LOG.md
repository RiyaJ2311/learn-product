# Migration Log

This document tracks all structural changes and renames performed to bring the repository into compliance with [NOMENCLATURE.md](NOMENCLATURE.md).

---

## 2026-01-28: Initial Nomenclature Establishment

### Phase 1: Top-Level Directory Renames

| Old Name | New Name | Type | Reason |
|----------|----------|------|--------|
| `00-feedback from 2025` | `00-Feedback-From-2025` | Module | Spaces not allowed, needs Title-Case |
| `articles in progress` | `wip-articles` | WIP content | Spaces not allowed, needs wip- prefix |

### Phase 2: File Renames Within Modules

| Old Path | New Path | Reason |
|----------|----------|--------|
| `00-Feedback-From-2025/themes-summary.md` | `00-Feedback-From-2025/03-Themes-Summary.md` | Module files need numbered prefix |
| `00-Feedback-From-2025/LEARNING-PATHS.md` | `00-Feedback-From-2025/04-Learning-Paths.md` | Module files need numbered prefix |
| `02-Data-Storytelling/data-visualization/intro-to-graphs.md` | `02-Data-Storytelling/data-visualization/graph-types/00-intro-to-graphs.md` | Better organization + numbered prefix |

### Phase 3: Project Subdirectory Renames

| Old Path | New Path | Reason |
|----------|----------|--------|
| `PushOwl/Audit` | `PushOwl/audit` | Subdirectories use lowercase-hyphen pattern |

### Phase 4: Link Updates

**Files Modified to Fix Broken Links:**
1. `00-Feedback-From-2025/00-Index.md`
   - Updated feedback themes link
   - Added learning paths link
   - Updated module references to include Module 7 & 8

2. `04-Product-Strategy/06-PLG-Sales-Hybrid.md`
   - Fixed "Back to Start" link from `00-Start-Here` to `00-Feedback-From-2025`

---

## Current State: All Compliant

All directories and files now follow the nomenclature defined in [NOMENCLATURE.md](NOMENCLATURE.md):

### Learning Modules (##-Title-Case)
✅ `00-Feedback-From-2025/`
✅ `01-Communication-Clarity/`
✅ `02-Data-Storytelling/`
✅ `03-Ownership-Execution/`
✅ `04-Product-Strategy/`
✅ `05-Leadership-Trust/`
✅ `07-Thinking-Patterns/`
✅ `08-AI-Skills/`

### Support Directories (lowercase-hyphen)
✅ `ai-prompts/`
✅ `frameworks/`
✅ `learn-code/`
✅ `templates/`
✅ `tests/`
✅ `wip-articles/`

### Project Directories (Title-Case)
✅ `PushOwl/`
  └── ✅ `audit/` (subdirectory follows lowercase pattern)

### Repository Documentation (UPPERCASE)
✅ `README.md`
✅ `CHEATSHEET.md`
✅ `NOMENCLATURE.md`
✅ `DOCUMENTATION-GUIDELINES.md` (in 08-AI-Skills)
✅ `GLOSSARY.md` (in 08-AI-Skills)

---

## Validation

All naming checked against nomenclature standards:
- ✅ No spaces in file or directory names
- ✅ Learning modules use ##-Title-Case-With-Hyphens
- ✅ Module files use ##-Title-Case.md with proper numbering
- ✅ Support directories use lowercase-with-hyphens
- ✅ Repository docs use UPPERCASE.md or UPPERCASE-WITH-HYPHENS.md
- ✅ All internal links updated to reflect new paths

---

## Git History Preservation

All renames performed with `git mv` to preserve file history and enable proper tracking of changes across renames.

**Commits:**
1. `150a947` - Initial nomenclature establishment (top-level directories)
2. `[pending]` - Deep naming cleanup (files, subdirectories, link fixes)

---

## Future Migrations

When adding new content:
1. Check [NOMENCLATURE.md](NOMENCLATURE.md) for naming pattern
2. Use proper prefixes and casing
3. Update this log if creating new patterns
4. Use `git mv` for any renames to preserve history

---

*This log documents the evolution of repository structure and ensures all changes are tracked and reversible.*
