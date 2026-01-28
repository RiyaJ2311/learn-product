# Pie Chart: The Complete Guide

**← [Back to Graphs &amp; Dashboard Design](../intro-to-graphs.md)**

The pie chart is the most controversial chart in data visualization, beloved by executives, criticized by statisticians. Used correctly, it's powerful. Used poorly, it's misleading.

---

## History & Origin

### Playfair's Circle (1801)

William Playfair invented the pie chart in 1801 to show the proportions of the Turkish Empire's land holdings. He called it a "divided circle."

His goal: to show **part-to-whole relationships** at a glance. When you see a half-circle, you instantly know "50%."

### Why It's Controversial

The controversy comes from human perception. We're excellent at comparing lengths (bars) but poor at comparing angles and areas (pie slices). This makes pie charts prone to misinterpretation.

**The rule**: Pie charts work when simplicity matters more than precision.

---

## When to Use a Pie Chart

### Perfect For:

| Situation                                   | Why It Works                       |
| ------------------------------------------- | ---------------------------------- |
| **2-3 large segments**                | Differences are obvious            |
| **"About half" or "about a quarter"** | Familiar fractions are easy to see |
| **Emphasizing dominance**             | One slice clearly dominates        |
| **Non-technical audiences**           | Universally understood             |
| **Part-to-whole is the point**        | "What share of total?"             |

### When NOT to Use:

| Situation                       | Why                              | Alternative                          |
| ------------------------------- | -------------------------------- | ------------------------------------ |
| **5+ slices**             | Too hard to compare              | [Bar chart](./bar-chart.md)             |
| **Similar-sized slices**  | Can't tell which is larger       | [Bar chart](./bar-chart.md)             |
| **Comparing across pies** | Impossible to compare accurately | [Grouped bar chart](./bar-chart.md)     |
| **Precise values matter** | Angles are imprecise             | [Bar chart](./bar-chart.md) with labels |
| **Time series**           | Pies don't show change           | [Line chart](./line-chart.md)           |

---

## Pie Chart Variations

![Pie Chart Variations](../images/pie-chart-variations.png)

| Type                     | Use Case                  | Notes                               |
| ------------------------ | ------------------------- | ----------------------------------- |
| **Basic pie**      | Simple part-to-whole      | Best for 2-4 slices                 |
| **Donut chart**    | Same as pie, cleaner look | Center can show total or key metric |
| **Exploded slice** | Emphasize one segment     | Use sparingly — can mislead        |
| **Semi-circle**    | Space constraints         | Less accurate but can work          |

---

## Design Principles

### 1. Maximum 5 Slices (Ideally 2-3)

More slices = harder to compare = chart fails.

**If you have more than 5 categories**:

- Group small ones into "Other"
- Ask if a bar chart would work better
- Consider if you really need all categories

### 2. Slices Must Sum to 100%

This sounds obvious, but common mistakes:

- Showing "top 5 categories" that don't represent the whole
- Overlapping categories that double-count
- Survey data where respondents selected multiple options

**If slices don't sum to a meaningful whole, don't use a pie.**

### 3. Order Your Slices

| Ordering Method                                 | When to Use                       |
| ----------------------------------------------- | --------------------------------- |
| **Largest first** (12 o'clock, clockwise) | Default — emphasizes rank        |
| **Logical order**                         | Categories have inherent sequence |
| **Highlight last**                        | Draw attention to specific slice  |

### 4. Color Choices

- **Distinct colors** that are easy to tell apart
- **Semantic colors** when appropriate (green=good, red=bad)
- **Highlight color** to emphasize one slice, others in gray
- **Avoid**: rainbow gradients, 3D shading, patterns

### 5. Labeling

| Method                                  | When to Use              |
| --------------------------------------- | ------------------------ |
| **Direct labels on/near slices**  | Always preferred         |
| **Legend**                        | Only if labels don't fit |
| **Percentages + absolute values** | When both matter         |

**Best practice**: Label slices directly. Legends force eye movement back and forth.

---

## Common Issues and How to Fix Them

| Issue                                | Problem                                                                                                                                                                        | Fix                                                                                                         |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------- |
| **Too Many Slices**            | 10+ slices create visual chaos. Example: Market share pie with 15 competitors — impossible to read                                                                            | Show top 4-5, group rest as "Other" · Switch to horizontal bar chart · Use a treemap for many categories  |
| **3D Effects**                 | 3D perspective distorts slice sizes. Front slices appear larger than back slices with the same value. Tools like Excel default to 3D for "visual interest"                     | Remove 3D immediately. It's never appropriate for data                                                      |
| **Similar-Sized Slices**       | 24% vs 26% looks identical in a pie. Humans can't accurately compare angles that differ by less than ~10%                                                                      | Use a bar chart when precision matters, or add data labels                                                  |
| **Exploded Slices (Overused)** | "Exploding" a slice pulls it away from center, often making the chart harder to read                                                                                           | Okay for emphasizing ONE important segment. Not okay for exploding multiple slices or using it decoratively |
| **Comparing Multiple Pies**    | Two pie charts side by side — "Compare market share 2023 vs 2024". Each pie has different total, making slices incomparable. We can't accurately compare angles across charts | Use grouped bar chart or slope chart                                                                        |
| **Not Starting at 12 O'Clock** | Slices starting at random positions make it hard to use the "quarter" and "half" references                                                                                    | First slice should start at 12 o'clock, moving clockwise                                                    |

---

## Labeling Best Practices

### Title Formula

**Pattern**: [What proportion] + [of What]

| Weak Title          | Strong Title                         |
| ------------------- | ------------------------------------ |
| "Revenue by Region" | "APAC accounts for 45% of revenue"   |
| "User Distribution" | "Mobile dominates with 70% of users" |

### Slice Labels

| Element            | Recommendation                                                                                            |
| ------------------ | --------------------------------------------------------------------------------------------------------- |
| **Include**  | Category name · Percentage · Absolute value (when relevant)                                             |
| **Format**   | "Mobile: 70% ($2.3M)"                                                                                     |
| **Position** | Outside the slice for small slices · Inside for large slices (if readable) · Use leader lines if needed |

### When to Use a Legend

Only when labels genuinely don't fit, interactive chart (hover for details), or very small display (sparkline-style). **Even then**, consider if a bar chart would be clearer.

---

## The Donut Chart Alternative

### Advantages Over Pie

- Center space can display total or key metric
- Slightly cleaner, more modern look
- Easier to add multiple rings (though use sparingly)

### When to Use

- Same rules as pie chart apply
- Particularly good when you want to show the total prominently
- Dashboard widgets where space is tight

### Center Content

| Content        | Example                     |
| -------------- | --------------------------- |
| Total          | "$4.5M Total Revenue"       |
| Primary metric | "70% Mobile"                |
| Icon           | (for decorative dashboards) |
| Nothing        | Keep it clean               |

---

## Quick Checklist

Before publishing a pie chart:

- [ ] Maximum 5 slices (ideally 2-3)
- [ ] Slices sum to 100% of a meaningful whole
- [ ] No 3D effects
- [ ] Ordered logically (usually largest first)
- [ ] Slices labeled directly (not just legend)
- [ ] Colors are distinct and purposeful
- [ ] Title states the insight
- [ ] Starting at 12 o'clock

**Final question**: Would a bar chart be clearer? If yes, use the bar chart.

---

## Summary

The pie chart is a specialist tool:

- Perfect for showing simple part-to-whole with 2-3 segments
- Terrible for precise comparisons or many categories
- Always ask: "Is this really a pie chart situation?"

When in doubt, choose a bar chart. When you need to show dominance ("Mobile is most of our traffic"), the pie chart shines.

---

## See Also

- **[Bar Chart](./bar-chart.md)** — Better choice for most part-to-whole comparisons, especially with 5+ categories
- **[Stacked Area Chart](./area-chart.md)** — For showing composition over time
- **[Line Chart](./line-chart.md)** — For tracking part-to-whole changes across time periods
- **[Donut Chart vs Pie](./pie-chart.md#the-donut-chart-alternative)** — Modern alternative to pie charts

**Related Concepts**:

- [Why Charts Matter for Product People](../intro-to-graphs.md#part-2-why-should-product-people-care-about-graphs)
- [Choosing the Right Chart](../intro-to-graphs.md#part-6-graph-types-reference)
- [Dashboard Design Principles](../intro-to-graphs.md#part-7-dashboard-design-principles)
