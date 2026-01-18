# Data Visualization & Dashboard Design

A comprehensive guide for Product Managers and Designers on data visualization, graph selection, and dashboard design.

---

## Folder Structure

```
data-visualization/
├── README.md                    # This file
├── overview.md                  # Main guide (start here)
├── dashboard-personas.md        # Audience-specific dashboard design
├── navigation.md                # How to navigate this content
├── assets/                      # Universal assets folder
│   ├── images/                  # Screenshots, diagrams, examples
│   ├── examples/                # Sample dashboards, templates
│   └── templates/               # Reusable dashboard templates
└── graph-types/                 # Detailed guides for each chart type
    ├── bar-chart.md
    ├── line-chart.md
    ├── pie-chart.md
    ├── scatter-plot.md
    ├── area-chart.md
    └── histogram.md
```

---

## File Naming Conventions

All files and folders follow these rules:

1. **Lowercase with hyphens** (kebab-case)
   - ✅ `overview.md`
   - ✅ `dashboard-personas.md`
   - ❌ `01-graphs & their design.md` (old)
   - ❌ `NAVIGATION_GUIDE.md` (old)

2. **Descriptive names**
   - ✅ `graph-types/` (clearly describes content)
   - ❌ `graphs/` (too generic)
   - ✅ `overview.md` (main entry point)
   - ❌ `01-graphs & their design.md` (special chars, numbering)

3. **No special characters**
   - Use hyphens, not spaces or ampersands
   - No numbers unless part of data (e.g., "100-users" in examples)

4. **Organized assets**
   - All images go in `assets/images/`
   - All examples go in `assets/examples/`
   - All templates go in `assets/templates/`

---

## Quick Start

### For First-Time Learners

1. Start with **[overview.md](./overview.md)** — Read parts 1-3 to understand why graphs exist
2. Jump to **[Graph Types Reference](./overview.md#part-6-graph-types-reference)** — Quick table of all chart types
3. Deep dive into any graph type (e.g., [bar-chart.md](./graph-types/bar-chart.md))

### For Dashboard Designers

1. Read **[Dashboard Personas](./dashboard-personas.md)** — Understand your audience first
2. Check **[Dashboard Design Principles](./overview.md#part-7-dashboard-design-principles)** — Core rules
3. Review **[Common Dashboard Mistakes](./overview.md#part-5-common-dashboard-design-mistakes)** — Avoid these

### For Navigation Help

See **[navigation.md](./navigation.md)** for:
- Full document structure
- Cross-referencing strategy
- Quick jump tables by goal
- Navigation paths

---

## What's Inside Each File

| File | Purpose | When to Use |
|------|---------|-------------|
| **overview.md** | Main comprehensive guide | Start here, or reference design principles |
| **dashboard-personas.md** | 8 audience types with specific needs | When building a dashboard, check your audience first |
| **navigation.md** | How all docs connect | When you're lost or want to understand structure |
| **graph-types/*.md** | Deep dive on each chart | When designing/debugging a specific chart type |

---

## Cross-References

All documents are heavily cross-referenced:

- **Main document** links to all graph-type guides
- **Each graph guide** links back to main + related graphs
- **Dashboard personas** links to relevant graphs for each audience
- **Navigation guide** provides quick jump tables

Every page has "See Also" sections at the bottom.

---

## Contributing / Extending

When adding new content:

1. **Follow naming conventions** (kebab-case, lowercase, descriptive)
2. **Add cross-references** (link to related content)
3. **Update navigation.md** if structure changes
4. **Place assets** in appropriate subfolder (`assets/images/`, etc.)
5. **Add "See Also"** section at bottom of new pages

---

## Version History

- **2024-01-18**: Restructured with consistent naming conventions
  - Renamed `100-data-visualization/` → `data-visualization/`
  - Renamed `graphs/` → `graph-types/`
  - Renamed `01-graphs & their design.md` → `overview.md`
  - Renamed `NAVIGATION_GUIDE.md` → `navigation.md`
  - Created organized `assets/` subfolders
  - Updated all cross-references

---

## Questions?

- Check [navigation.md](./navigation.md) for navigation help
- Start with [overview.md](./overview.md) for comprehensive guide
- Jump to [dashboard-personas.md](./dashboard-personas.md) for audience-specific design
