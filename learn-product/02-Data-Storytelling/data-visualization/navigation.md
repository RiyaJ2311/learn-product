# Navigation Guide: How Documents Are Cross-Referenced

This document explains how to navigate through the data visualization and dashboard design learning materials.

---

## Document Structure

```
overview.md (Main Hub)
├── Part 1: History of Graphs
├── Part 2: Why Graphs Matter for PMs
├── Part 3: What is a Dashboard
├── Part 4: Analytics Tools
├── Part 5: Common Dashboard Design Mistakes
├── Part 6: Graph Types Reference (Linked to all subpages)
├── Part 7: Dashboard Design Principles
├── Part 8: Data Storytelling Framework
└── Part 9: Dashboard Personas (Linked to dashboard-personas.md)

📊 dashboard-personas.md (Audience Guide)
├── 8 Common Personas (Executives, PMs, Analysts, etc.)
├── Each persona's needs, questions, charts, and design vibe
├── Decision tree for choosing dashboard type
└── Revenue dashboard examples for different personas

graphs/ (Detailed Guides)
├── bar-chart.md
├── line-chart.md
├── pie-chart.md
├── scatter-plot.md
├── area-chart.md
└── histogram.md
```

---

## Cross-Referencing Strategy

### From Main Document
The main document links to each graph type guide:
- Quick Reference Table (Part 6) → Click any chart type to jump to its detailed guide
- Problem descriptions (Part 5) → Links to relevant chart type guides
- Text mentions → Inline links to related charts when concepts are discussed

### Within Graph Type Guides
Each guide has:
- **Back link** at the top to return to main document
- **Inline links** in "When to Use" and "Not Ideal For" sections pointing to alternative chart types
- **See Also section** at the bottom with:
  - Related chart types (with explanations for when to use each)
  - Links to relevant dashboard design principles
  - Conceptual connections to other parts of the guide

### Navigation Paths

#### Path 1: Comparison Shopping
1. Start at [overview.md](./overview.md#part-6-graph-types-reference)
2. Check the Quick Reference Table
3. Click on two chart types you want to compare
4. Each guide's "See Also" section shows alternatives
5. Use "When NOT to use" sections to understand trade-offs

#### Path 2: Problem-Solving
1. Start at [Common Dashboard Design Mistakes](./overview.md#part-5-common-dashboard-design-mistakes)
2. Find your problem (e.g., "Using the Wrong Chart Types")
3. Click linked chart types mentioned in the solution
4. Learn best practices in the detailed guides
5. Return to main doc via back links

#### Path 3: Deep Dive into One Chart
1. Click on any chart type from the main document
2. Read History, When to Use, Design Principles
3. Study Common Issues and how to fix them
4. Follow "See Also" links to learn how this chart relates to others
5. Use cross-references to understanding dashboard design concepts

#### Path 4: Building Your First Dashboard
1. Start at [Part 3: What is a Dashboard?](./overview.md#part-3-what-is-a-dashboard)
2. Read [Part 7: Dashboard Design Principles](./overview.md#part-7-dashboard-design-principles)
3. For each metric you need to show, click the relevant chart type guide
4. Study the "Labeling Best Practices" section
5. Check the "Common Issues" section to avoid mistakes
6. Return to main doc for overall dashboard layout guidance

---

## Key Links to Know

### Quick Jumps by Goal

**Chart Selection:**
| I want to... | Link |
|-------|------|
| Show comparisons | [Bar Chart](./graph-types/bar-chart.md) |
| Show trends over time | [Line Chart](./graph-types/line-chart.md) |
| Show part of a whole | [Pie Chart](./graph-types/pie-chart.md) |
| Find relationships | [Scatter Plot](./graph-types/scatter-plot.md) |
| Show composition over time | [Area Chart](./graph-types/area-chart.md) |
| Show distribution | [Histogram](./graph-types/histogram.md) |

**Dashboard Design:**
| I need to... | Link |
|-------|------|
| Understand design principles | [Main Document](./overview.md#part-7-dashboard-design-principles) |
| Understand data storytelling | [Main Document](./overview.md#part-8-data-storytelling-framework) |
| Design for my audience | [Dashboard Personas Guide](./dashboard-personas.md) |

**By Audience:**
| I'm designing for... | Link |
|-------|------|
| Executives | [Dashboard Personas: Executives](./dashboard-personas.md#1-founders--executives-strategic-dashboards) |
| Product Teams | [Dashboard Personas: Product Managers](./dashboard-personas.md#3-product-managers--designers-product-analytics) |
| Marketing/Growth | [Dashboard Personas: Marketing](./dashboard-personas.md#4-marketing-and-growth-teams-marketing-analytics) |
| Sales/Success | [Dashboard Personas: Sales](./dashboard-personas.md#5-sales--success-teams-gtm-dashboards) |
| Operations/Support | [Dashboard Personas: Ops](./dashboard-personas.md#6-ops-support-reliability-operational-dashboards) |
| Analysts | [Dashboard Personas: Analysts](./dashboard-personas.md#7-analysts--bi-business-intelligence-dashboards) |
| Customers | [Dashboard Personas: Customers](./dashboard-personas.md#8-customers-external-dashboards-self-serve-analytics) |

### Charts by Category

**Time-based Charts:**
- [Line Chart](./graph-types/line-chart.md) — Best for trends
- [Area Chart](./graph-types/area-chart.md) — For emphasizing volume

**Comparison Charts:**
- [Bar Chart](./graph-types/bar-chart.md) — Ranking and categories
- [Scatter Plot](./graph-types/scatter-plot.md) — Relationships between variables

**Composition Charts:**
- [Pie Chart](./graph-types/pie-chart.md) — Simple part-to-whole
- [Stacked Area](./graph-types/area-chart.md#stacked-area-showing-composition) — Composition over time

**Distribution Charts:**
- [Histogram](./graph-types/histogram.md) — Understand data shape

---

## Linking Conventions

### Navigation Links
- **← Back to Main** — Go back to primary document
- **See Also section** — Related concepts and alternatives
- **Related Concepts** — Connection to broader dashboard design topics

### Content Links
- **Inline text links** (colored text) — Jump to specific section
- **Table links** — Chart types in tables are clickable

### Anchors & Sections
Each major section is linkable. Common ones:
- `#part-1` through `#part-8` in main document
- `#design-principles`, `#common-issues`, `#labeling-best-practices` in each chart guide

---

## Tips for Navigating

1. **Use breadcrumbs**: Each subpage has "← Back" link at the top
2. **Check "See Also"**: These sections guide you to related content
3. **Follow the "When NOT to use"**: These tell you which alternative to read next
4. **Use Cmd+F / Ctrl+F**: Search within documents for specific concepts
5. **Read inline links**: When a concept mentions another chart type, click to compare

---

## Feedback Loop

As you read, you'll notice:
- Graph type guides link to the main document's design principles
- Design principles reference specific chart types
- Common mistakes link to solutions in relevant chart guides
- All pages link back to the main hub

This creates a web of knowledge where you can enter at any point and navigate to understand your specific question.

