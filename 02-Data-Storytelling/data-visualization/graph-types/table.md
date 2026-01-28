# Table: The Complete Guide

**← [Back to Graphs & Dashboard Design](../intro-to-graphs.md)**

Tables are the workhorses of detailed analysis — when users need exact values, drill-downs, and the ability to search, sort, and export.

---

## When to Use a Table

**Perfect for:**
- Showing exact values (not just trends)
- Providing drill-down details
- Enabling search and filtering
- Export functionality
- Comparing many dimensions

**Questions it answers:**
- "Show me exact numbers"
- "Which items are driving this?"
- "Let me find a specific entry"

**Not ideal for:**
- High-level trends (use [line chart](./line-chart.md))
- Quick comparisons (use [bar chart](./bar-chart.md))
- Spotting patterns (use visualizations)

---

## Design Principles

### 1. Important Columns First

Place key metrics in first 2-3 columns:
- ✅ Campaign Name | Spend | ROAS | Clicks
- ❌ ID | Created | Updated | Campaign | Spend

### 2. Allow Sorting

Enable click-to-sort on key columns, especially:
- Metrics (revenue, count, rate)
- Dates
- Names (alphabetical)

**Default sort**: By most important metric, descending

### 3. Add Search and Pagination

- Search: For finding specific items
- Pagination: Show 25-50 rows, then "Load more"
- Total count: "Showing 50 of 1,247"

### 4. Use Conditional Formatting

| Technique | When to Use |
|-----------|-------------|
| **Color scale** | Revenue (green high, red low) |
| **Icons** | Status (✓ ✗ ⚠) |
| **Bold** | Top performers |
| **Strikethrough** | Inactive items |

### 5. Limit Columns

- **3-7 columns**: Ideal
- **8-10 columns**: Maximum before horizontal scroll
- **11+ columns**: Consider hiding less important ones

---

## Common Issues

### Issue 1: Table at Top

**Problem**: Table dominates dashboard before charts

**Fix**: Tables go in **details zone** (below visualizations)

### Issue 2: Too Many Columns

**Problem**: 15 columns = horizontal scroll nightmare

**Fix**:
- Show 5-7 key columns by default
- Add "Show more columns" toggle
- Or provide column selector

### Issue 3: No Export

**Problem**: Users screenshot tables to share

**Fix**: Add CSV/Excel export button

---

## Labeling Best Practices

### Column Headers

| Bad | Good |
|-----|------|
| "rev" | "Revenue (₹)" |
| "cnt" | "Count" |
| "pct" | "Conversion %" |

### Table Caption/Title

**Pattern**: [What] (Top N / Filtered by X)

Examples:
- "Top 20 Campaigns by ROAS (Last 30 Days)"
- "High-Risk Accounts (Churn Probability > 70%)"

---

## Placement

**By Dashboard Type:**
- **Executive**: Rarely — maybe top 5 summary
- **Product/Marketing**: Frequently — detailed metrics
- **Analysts**: Heavy — exploratory analysis
- **Operations**: Critical — action items list

**Position**: Details zone (lower third of dashboard)

---

## Quick Checklist

- [ ] Important columns first
- [ ] Sortable key columns
- [ ] Search enabled for long lists
- [ ] Pagination (25-50 rows)
- [ ] Conditional formatting for quick scanning
- [ ] Export button
- [ ] Maximum 7-10 columns visible
- [ ] Clear column headers with units
- [ ] Below visualizations, not above

---

## See Also

- [Bar Chart](./bar-chart.md) — Visual alternative for comparisons
- [KPI Card](./kpi-card.md) — For highlighting key numbers from table
- [Product Dashboards](../dashboard-personas.md#3-product-managers--designers-product-analytics) — Heavy table usage
- [Analyst Dashboards](../dashboard-personas.md#7-analysts--bi-business-intelligence-dashboards) — Detailed tables
