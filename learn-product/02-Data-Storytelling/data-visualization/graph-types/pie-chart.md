# Pie Chart: The Complete Guide

**← [Back to Graphs & Dashboard Design](../intro-to-graphs.md)**

The pie chart is the most controversial chart in data visualization — beloved by executives, criticized by statisticians. Used correctly, it's powerful. Used poorly, it's misleading.

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

| Situation | Why It Works |
|-----------|--------------|
| **2-3 large segments** | Differences are obvious |
| **"About half" or "about a quarter"** | Familiar fractions are easy to see |
| **Emphasizing dominance** | One slice clearly dominates |
| **Non-technical audiences** | Universally understood |
| **Part-to-whole is the point** | "What share of total?" |

### When NOT to Use:

| Situation | Why | Alternative |
|-----------|-----|-------------|
| **5+ slices** | Too hard to compare | [Bar chart](./bar-chart.md) |
| **Similar-sized slices** | Can't tell which is larger | [Bar chart](./bar-chart.md) |
| **Comparing across pies** | Impossible to compare accurately | [Grouped bar chart](./bar-chart.md) |
| **Precise values matter** | Angles are imprecise | [Bar chart](./bar-chart.md) with labels |
| **Time series** | Pies don't show change | [Line chart](./line-chart.md) |

---

## Pie Chart Variations

| Type | Use Case | Notes |
|------|----------|-------|
| **Basic pie** | Simple part-to-whole | Best for 2-4 slices |
| **Donut chart** | Same as pie, cleaner look | Center can show total or key metric |
| **Exploded slice** | Emphasize one segment | Use sparingly — can mislead |
| **Semi-circle** | Space constraints | Less accurate but can work |

---

## Design Principles: What Makes a Beautiful Pie Chart

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

| Ordering Method | When to Use |
|-----------------|-------------|
| **Largest first** (12 o'clock, clockwise) | Default — emphasizes rank |
| **Logical order** | Categories have inherent sequence |
| **Highlight last** | Draw attention to specific slice |

### 4. Color Choices

- **Distinct colors** that are easy to tell apart
- **Semantic colors** when appropriate (green=good, red=bad)
- **Highlight color** to emphasize one slice, others in gray
- **Avoid**: rainbow gradients, 3D shading, patterns

### 5. Labeling

| Method | When to Use |
|--------|-------------|
| **Direct labels on/near slices** | Always preferred |
| **Legend** | Only if labels don't fit |
| **Percentages + absolute values** | When both matter |

**Best practice**: Label slices directly. Legends force eye movement back and forth.

---

## Common Issues and How to Fix Them

### Issue 1: Too Many Slices

**Problem**: 10+ slices create visual chaos

**Example**: Market share pie with 15 competitors — impossible to read

**Fix**:
- Show top 4-5, group rest as "Other"
- Switch to horizontal bar chart
- Use a treemap for many categories

---

### Issue 2: 3D Effects

**Problem**: 3D perspective distorts slice sizes. Front slices appear larger than back slices with the same value.

**Why it happens**: Tools like Excel default to 3D for "visual interest"

**Fix**: Remove 3D immediately. It's never appropriate for data.

---

### Issue 3: Similar-Sized Slices

**Problem**: 24% vs 26% looks identical in a pie

**Why**: Humans can't accurately compare angles that differ by less than ~10%

**Fix**: Use a bar chart when precision matters, or add data labels.

---

### Issue 4: Exploded Slices (Overused)

**Problem**: "Exploding" a slice pulls it away from center, often making the chart harder to read

**When it's okay**: Emphasizing ONE important segment
**When it's not**: Exploding multiple slices, or using it decoratively

---

### Issue 5: Comparing Multiple Pies

**Problem**: Two pie charts side by side — "Compare market share 2023 vs 2024"

**Why it fails**:
- Each pie has different total, making slices incomparable
- We can't accurately compare angles across charts

**Fix**: Use grouped bar chart or slope chart.

---

### Issue 6: Not Starting at 12 O'Clock

**Problem**: Slices starting at random positions make it hard to use the "quarter" and "half" references

**Fix**: First slice should start at 12 o'clock, moving clockwise.

---

## Labeling Best Practices

### Title Formula

**Pattern**: [What proportion] + [of What]

| Weak Title | Strong Title |
|------------|--------------|
| "Revenue by Region" | "APAC accounts for 45% of revenue" |
| "User Distribution" | "Mobile dominates with 70% of users" |

### Slice Labels

**Include**:
- Category name
- Percentage
- Absolute value (when relevant)

**Format**: "Mobile: 70% ($2.3M)"

**Position**:
- Outside the slice for small slices
- Inside for large slices (if readable)
- Use leader lines if needed

### When to Use a Legend

Only when:
- Labels genuinely don't fit
- Interactive chart (hover for details)
- Very small display (sparkline-style)

**Even then**, consider if a bar chart would be clearer.

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

| Content | Example |
|---------|---------|
| Total | "$4.5M Total Revenue" |
| Primary metric | "70% Mobile" |
| Icon | (for decorative dashboards) |
| Nothing | Keep it clean |

---

## Real-World Examples

### Good Example: Clear Dominance

A pie chart showing "Device Usage":
- 70% Mobile (blue, large)
- 25% Desktop (gray)
- 5% Tablet (light gray)
- Direct labels on each slice
- Title: "Mobile accounts for 70% of traffic"

**Why it works**: One slice clearly dominates, 3 slices total, clear story.

### Bad Example: Pie Chart Abuse

A pie chart showing "Feature Usage by Module":
- 12 slices in rainbow colors
- Slices range from 5% to 15%
- Legend at the bottom
- 3D perspective with shadow

**Why it fails**: Too many slices, similar sizes, 3D distortion, legend instead of labels.

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
- **[Pie Chart Debate](../intro-to-graphs.md#common-issues-and-how-to-fix-them)** — Why statisticians criticize them

**Related Concepts**:
- [Why Charts Matter for Product People](../intro-to-graphs.md#part-2-why-should-product-people-care-about-graphs)
- [Graphs Prevent Manipulation](../intro-to-graphs.md#graphs-prevent-manipulation)
- [Chart Type Selection Guide](../intro-to-graphs.md#part-6-graph-types-reference)
