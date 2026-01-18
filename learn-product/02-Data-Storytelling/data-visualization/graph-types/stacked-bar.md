# Stacked Bar Chart: The Complete Guide

**← [Back to Graphs & Dashboard Design](../intro-to-graphs.md)**

Stacked bar charts answer "What's the total, and how is it composed?" — showing both the whole and its parts in one visualization.

---

## History & Origin

### Layered Visualization (Early 1900s)

Stacked charts emerged when analysts needed to show composition without losing sight of totals. Early uses appeared in population demographics and economic reports showing total spending broken down by category.

The innovation: **Stack segments on top of each other** so the bar height shows total, while colors show composition.

---

## When to Use a Stacked Bar

### Perfect For:

| Question Type | Example |
|--------------|---------|
| **What is total and how is it made up?** | Total revenue by channel composition |
| **Which category has biggest total?** | Which region has most users (by type)? |
| **Showing absolute contribution** | How much does each source contribute? |

### Questions It Answers

- What's the grand total?
- Which component is largest?
- How does composition differ across categories?
- Which category dominates each stack?

### Not Ideal For:

- Comparing middle segments (hard to judge without common baseline)
- When only composition matters, not total (use [100% stacked](#100-stacked-bar))
- Precise value reading (harder than [grouped bars](./grouped-bar.md))
- More than 5 segments (becomes rainbow chaos)

---

## Stacked Bar vs 100% Stacked Bar

### Stacked Bar (Absolute Values)

Shows **actual totals** with composition:

```
Channel A: [Organic $60K][Paid $40K] = $100K total
Channel B: [Organic $30K][Paid $20K] = $50K total
```

**Use when**: Total matters as much as composition

### 100% Stacked Bar (Proportions)

Shows **composition as percentages**:

```
Channel A: [Organic 60%][Paid 40%] = 100%
Channel B: [Organic 60%][Paid 40%] = 100%
```

**Use when**: You care about mix, not absolute totals

---

## Design Principles: What Makes a Beautiful Stacked Bar

### 1. Keep Segments Small (2-5 Max)

| Number of Segments | Readability |
|-------------------|-------------|
| 2-3 segments | Perfect |
| 4-5 segments | Acceptable |
| 6+ segments | Too many — group smaller ones as "Other" |

### 2. Order Segments Meaningfully

**Common orderings:**
- **Largest to smallest** (most common first)
- **Logical flow** (funnel steps, time sequence)
- **Semantic grouping** (related items together)

**Be consistent** — same order across all bars.

### 3. Show Total Label on Top

For regular stacked bars, add total value:

```
[Organic $60K][Paid $40K]  ← $100K total
```

This helps readers understand magnitude at a glance.

### 4. Use Sequential or Diverging Colors

**Sequential** (for ordered data):
- Light blue → Medium blue → Dark blue

**Categorical** (for distinct segments):
- Blue, Orange, Green (distinct hues)

**Avoid**: Rainbow gradients with no meaning

### 5. Bottom Segment is Most Important

The bottom segment has a **common baseline** (zero), making it easy to compare across bars. Put your most important segment here.

---

## Common Issues and How to Fix Them

### Issue 1: Comparing Middle Segments

**Problem**: Trying to compare "Paid" segment across channels when it's in the middle of stack

**Why it's bad**: Middle segments don't share a baseline, making comparison difficult

**Fix**:
- Move most important segment to bottom
- Use [grouped bar](./grouped-bar.md) if direct comparison is the goal
- Add data labels for precision

---

### Issue 2: Too Many Segments

**Problem**: 8 segments in different colors = rainbow bar

**Why it's bad**: Can't distinguish colors, can't see patterns

**Fix**:
- Group small segments as "Other"
- Show top 4-5, aggregate rest
- Use filtering or drill-down for details

---

### Issue 3: Using Stacked When Total Doesn't Matter

**Problem**: Showing device mix (Mobile vs Desktop) with stacked bars when totals vary wildly

**Example**:
```
US:    [Mobile 100K][Desktop 50K] = 150K
India: [Mobile 5K][Desktop 1K] = 6K
```

You can't compare mobile % because bar heights differ.

**Fix**: Use [100% stacked bar](#100-stacked-bar) to show composition clearly.

---

### Issue 4: No Total Label

**Problem**: Stacked bar without total shown — users have to add up segments mentally

**Fix**: Always label total at top of bar or in data label.

---

### Issue 5: Inconsistent Segment Order

**Problem**: Organic is bottom in one bar, top in another

**Why it's bad**: Destroys pattern recognition

**Fix**: Lock segment order across all bars.

---

## 100% Stacked Bar

### When to Use

**Perfect for comparing composition when totals differ:**

| Use Case | Example |
|----------|---------|
| Market share changes | Product mix across regions |
| Proportion comparison | Device distribution by country |
| Mix evolution | Traffic source mix over time |

### Design Rules

1. **Always label as percent**
2. **Keep segments small** (2-5)
3. **Use when composition > total**
4. **Note that it hides absolute totals** (mention elsewhere)

### Example: Good Use

**Device Mix by Country**

```
US:    [Mobile 67%][Desktop 33%]
India: [Mobile 85%][Desktop 15%]
UK:    [Mobile 72%][Desktop 28%]
```

**Why it works**: Easy to see India is most mobile-heavy, even though US has more absolute users.

### Common Mistake

Using 100% stacked when people care about totals:

- "Revenue by plan" — People want to know which plan makes most money (total), not just mix
- Fix: Use regular stacked bar, or show totals separately

---

## Labeling Best Practices

### Title Formula

**Stacked Bar**: [Metric] by [Category] (Total + Breakdown by [Segments])

| Weak Title | Strong Title |
|------------|--------------|
| "Revenue" | "Total Revenue by Channel (Organic + Paid)" |
| "Users" | "Monthly Active Users by Region (Free + Paid + Enterprise)" |

**100% Stacked**: [Metric] Mix by [Category]

| Weak Title | Strong Title |
|------------|--------------|
| "Traffic" | "Traffic Source Mix by Landing Page" |

### Axis Labels

**Y-axis (Stacked)**:
- Include units: "Revenue (₹K)"
- Show totals at key increments

**Y-axis (100% Stacked)**:
- "Percentage" or "%"
- 0%, 25%, 50%, 75%, 100%

### Segment Labels

**For 2-3 segments**: Label each segment
**For 4-5 segments**: Legend + optional labels on largest
**Never**: Unlabeled rainbow bars

---

## Placement on Dashboards

### By Dashboard Type

| Dashboard Type | Usage |
|----------------|-------|
| **[Executive](../dashboard-personas.md#1-founders--executives-strategic-dashboards)** | Limited — totals + simple composition |
| **[Product](../dashboard-personas.md#3-product-managers--designers-product-analytics)** | Heavy — user mix, feature adoption composition |
| **[Marketing](../dashboard-personas.md#4-marketing-and-growth-teams-marketing-analytics)** | Heavy — channel mix, campaign composition |
| **[Sales](../dashboard-personas.md#5-sales--success-teams-gtm-dashboards)** | Moderate — pipeline composition |

### Layout

**Drivers Zone** — Show what's driving totals:
```
┌────────────────────────────┐
│ KPI: Total Revenue $4.2M   │
├────────────────────────────┤
│ Revenue by Channel (Stack) │
│ [Chart showing composition]│
└────────────────────────────┘
```

---

## Real-World Examples

### Good Example: Clear Composition

**Total Revenue by Region (Q4 2024)**

```
US:    [$2M enterprise][$1M mid-market][$0.5M SMB] = $3.5M
EU:    [$1M enterprise][$1.2M mid-market][$0.8M SMB] = $3M
APAC:  [$0.5M enterprise][$0.8M mid-market][$0.4M SMB] = $1.7M
```

**Why it works:**
- Clear totals
- 3 segments (manageable)
- Enterprise at bottom (most important, easy to compare)
- Total labeled on each bar

### Bad Example: Rainbow Stack

**Users**

```
[8 different colored segments with no labels]
```

**Why it fails:**
- Too many segments
- No segment labels
- No totals shown
- Can't tell what each color means

---

## Quick Checklist

**For Regular Stacked Bars:**
- [ ] Segments limited to 2-5
- [ ] Most important segment at bottom
- [ ] Consistent segment order across bars
- [ ] Total labeled on each bar or axis
- [ ] Colors distinct and meaningful
- [ ] Y-axis starts at zero
- [ ] Clear legend or direct labels

**For 100% Stacked Bars:**
- [ ] Y-axis shows 0% to 100%
- [ ] Labeled as percentages
- [ ] Note about hidden totals (mention elsewhere)
- [ ] Segments consistent across bars
- [ ] Used when composition matters more than total

---

## Summary

Stacked bars work when:
- You need **total AND composition** in one view
- Bottom segment is what you care most about
- 2-5 segments maximum

Use 100% stacked when:
- **Composition matters**, totals don't
- Comparing proportions across varying totals
- Still 2-5 segments

Fail when:
- Trying to compare middle segments precisely
- Too many segments (6+)
- Used for precise value reading

**Golden rule**: If you can't easily compare what you care about, wrong chart.

---

## See Also

**Related Charts:**
- [Grouped Bar](./grouped-bar.md) — For direct segment comparison
- [Bar Chart](./bar-chart.md) — Simple comparison without composition
- [Area Chart](./area-chart.md) — Stacked composition over time
- [Pie Chart](./pie-chart.md) — Part-to-whole for single category

**Dashboard Context:**
- [Product Dashboards](../dashboard-personas.md#3-product-managers--designers-product-analytics) — User composition
- [Marketing Dashboards](../dashboard-personas.md#4-marketing-and-growth-teams-marketing-analytics) — Channel mix
- [Chart Selection Guide](../intro-to-graphs.md#part-6-graph-types-reference)

**Related Concepts:**
- [Color Discipline](../intro-to-graphs.md#3-color-discipline) — Sequential and categorical colors
- [Visual Hierarchy](../intro-to-graphs.md#2-visual-hierarchy) — Most important at bottom
