# Documentation Style Guidelines

This document outlines the standards and best practices for maintaining documentation in the AI Skills learning modules.

---

## Table of Contents

1. [Glossary Requirements](#glossary-requirements)
2. [Writing Style](#writing-style)
3. [Formatting Standards](#formatting-standards)
4. [Cross-Referencing](#cross-referencing)

---

## Glossary Requirements

### Module-Level Glossaries

**Rule:** Every major module folder (00-AI-Fundamentals, 01-Rules-vs-AI, etc.) MUST have a glossary that defines key terms introduced in that module.

**Requirements:**
- Create a `GLOSSARY.md` file in each major module folder
- Use the standard three-column table format: `Term | Meaning | Usage`
- Terms should be alphabetically organized
- Include cross-references to specific files within the module
- Link back to the main glossary at the root level

**Template:**
```markdown
# [Module Name] Glossary

Quick reference for key terms in this module.

## Terms

| Term | Meaning | Usage |
|------|---------|-------|
| **Term Name** | Clear, concise definition | Where and how it's used in this module |

## See Also

- Main glossary: [../../GLOSSARY.md](../../GLOSSARY.md)
- Related concepts in other modules
```

### Root-Level Glossary

**Rule:** Maintain a comprehensive glossary at the root level (`/GLOSSARY.md`) that includes ALL terms from all modules.

**Requirements:**
- Consolidate terms from all module glossaries
- Add cross-references showing which modules cover each term
- Update whenever new terms are added to module glossaries
- Keep alphabetically sorted for easy lookup
- Include a "Module Cross-Reference" section

---

## Writing Style

### Punctuation Rules

#### Em-dashes (—)

**Rule:** DO NOT use em-dashes (—) in documentation.

**Instead, use:**
- **Hyphens (-)** for compound words: "well-defined", "multi-agent"
- **Commas** for parenthetical phrases: "The model, which is trained on data, produces outputs"
- **Parentheses** for side notes: "The context window (measured in tokens) determines capacity"
- **Two sentences** when transitioning ideas: "Rules are deterministic. AI handles ambiguity."
- **Colons** for explanations: "There's one key requirement: the system must be reliable"

**Why:** Em-dashes can be harder to read, may not render consistently across platforms, and make text feel less accessible.

**Examples:**
```
❌ BAD: "The agent—after processing the input—decides the next action"
✅ GOOD: "The agent, after processing the input, decides the next action"

❌ BAD: "Three patterns exist—ReAct, Plan-Execute, and Self-Ask"
✅ GOOD: "Three patterns exist: ReAct, Plan-Execute, and Self-Ask"

❌ BAD: "Tool use—also called function calling—enables actions"
✅ GOOD: "Tool use (also called function calling) enables actions"
```

### Tone and Voice

- **Be clear and direct:** Favor simple, concrete language
- **Use active voice:** "The agent decides" not "The decision is made"
- **Stay practical:** Focus on "how" and "when" not just "what"
- **Be conversational:** Write like you're explaining to a colleague
- **Avoid jargon:** Define terms on first use

### Sentence Structure

- Keep sentences under 25 words when possible
- One main idea per sentence
- Use bullet points for lists of 3+ items
- Start with the most important information

---

## Formatting Standards

### Headers

- Use `#` for document title (once per file)
- Use `##` for major sections
- Use `###` for subsections
- Use `####` sparingly for deep nesting

### Code and Technical Terms

- Use **bold** for key terms on first mention
- Use `inline code` for:
  - Variable names: `user_id`
  - Function names: `execute_tool()`
  - File names: `config.json`
  - Code snippets
- Use code blocks for multi-line code with language tags:

````markdown
```python
def example():
    return "code"
```
````

### Tables

- Always include a header row
- Align columns consistently
- Keep cell content concise
- Use tables for comparisons, not long-form text

### Visual Elements

#### ASCII Diagrams

**General Rules:**
- Use ASCII diagrams for architecture and flows
- Keep diagrams under 65 characters wide for readability
- Include clear labels and arrows (→, ▼, ↔, etc.)
- Use boxes for grouping concepts
- Wrap diagrams in code blocks with triple backticks

**Box Drawing Characters:**

Use proper Unicode box-drawing characters. Never mix hyphens with box characters.

**Correct characters:**
```
┌  ┐  └  ┘  (corners)
│  (vertical)
─  (horizontal)
├  ┤  ┬  ┴  ┼  (connectors)
```

**Common mistakes to avoid:**
```
❌ BAD:  ┌─────-┐    (mixing hyphen with box chars)
❌ BAD:  │-----│     (using hyphens instead of box chars)
❌ BAD:  └──-──┘     (inconsistent characters)

✅ GOOD: ┌──────┐    (clean box-drawing characters)
✅ GOOD: │      │     (proper vertical bars)
✅ GOOD: └──────┘     (consistent corners)
```

**Alignment:**
- All box corners must align perfectly
- Text inside boxes should have consistent padding
- Nested boxes should have proper indentation (2 spaces per level)

**Example of proper nested diagram:**
```
┌─────────────────────────────────────┐
│ OUTER BOX                           │
├─────────────────────────────────────┤
│                                     │
│  ┌──────────────────────────────┐   │
│  │ INNER BOX                   │   │
│  │                             │   │
│  │  ┌──────────────────────┐   │   │
│  │  │ DEEPLY NESTED BOX   │   │   │
│  │  └──────────────────────┘   │   │
│  └──────────────────────────────┘   │
│                                     │
└─────────────────────────────────────┘
```

**Tables within diagrams:**
- Use simple alignment, not box characters
- Separate columns with spaces or │ bars
- Keep consistent spacing

---

## Cross-Referencing

### Linking Within Documentation

**Internal Links:**
- Use relative paths: `[see Module 01](../01-Rules-vs-AI/00-Index.md)`
- Link to specific sections: `[Agent Patterns](02-Agent-Patterns.md#react-pattern)`
- Always verify links work

**Glossary References:**
- Link to glossary for unfamiliar terms on first use
- Format: `See the [glossary](../../GLOSSARY.md) for definitions`

### File Naming

- Use kebab-case: `what-are-agents.md`
- Number index files: `00-Index.md`, `01-What-is-AI.md`
- Use descriptive names that match content
- Keep names concise (under 30 characters)

---

## Module Organization

### Required Files

Every module should have:
- `00-Index.md` - Module overview and navigation
- `GLOSSARY.md` - Module-specific terms
- Numbered content files: `01-`, `02-`, `03-`...

### Optional Files

Modules may include:
- `CHEATSHEET.md` - Quick reference
- `EXERCISES.md` - Practice problems
- `templates/` - Reusable templates
- `examples/` - Code examples

---

## Maintenance

### When Adding New Content

1. Define new terms in the module glossary
2. Update the root-level glossary
3. Add cross-references from related content
4. Update the module's index file
5. Check all links still work

### Periodic Reviews

- Monthly: Check for broken links
- Quarterly: Review glossary completeness
- Annually: Ensure examples and frameworks are current

---

## Examples

### Good Documentation Structure

```
Module 03: AI Agents/
├── 00-Index.md          # Overview, navigation
├── GLOSSARY.md          # Terms: Agent Loop, ReAct, etc.
├── 01-What-are-Agents.md
├── 02-Agent-Patterns.md
├── 03-Tool-Calling.md
└── ...
```

### Good Glossary Entry

```markdown
| **ReAct (Reasoning + Acting)** | An agent pattern that interleaves thinking, acting, and observing in a dynamic loop | Module 03 - AI Agents; most flexible pattern for handling unpredictable tasks. See [02-Agent-Patterns.md](02-Agent-Patterns.md#react) |
```

---

## Questions?

If you're unsure about style decisions:
1. Check existing documentation for precedents
2. Favor clarity over cleverness
3. When in doubt, keep it simple

---

**Last Updated:** 2026-01-19
