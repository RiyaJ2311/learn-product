# Heatmap: The Complete Guide

**← [Back to Graphs & Dashboard Design](../intro-to-graphs.md)**

A heatmap reveals patterns and intensity through color — showing when, where, and how much activity occurs across two dimensions.

---

## When to Use a Heatmap

**Perfect for:**
- Time-based patterns (day × hour activity)
- Feature correlation (which features are used together)
- Geographic intensity (regional engagement)
- User behavior patterns (cohort × time period)

**Questions it answers:**
- "What days and hours are most active?"
- "Which features are used together?"
- "Where is engagement concentrated?"
- "Are there seasonal patterns?"

**Not ideal for:**
- Exact values (use [table](./table.md) instead)
- Single dimension trends (use [line chart](./line-chart.md))
- Categorical comparisons (use [bar chart](./bar-chart.md))

---

## Design Principles

### 1. Color Should Show Intensity

Use a **sequential color scale** (light to dark):
- ✅ Light blue → Dark blue (low to high)
- ✅ White → Red (zero to max)
- ❌ Rainbow colors (confusing intensity)

**Example scale:**
```
0 activity → 50 → 100 → 500 → 1000+
   ⬜        🟦    🔵     🟦      ⬛
  White    Light   Med    Dark   Black
```

### 2. Label Both Axes Clearly

| Axis | Shows | Example |
|------|-------|---------|
| **X-axis** | First dimension | Days of week |
| **Y-axis** | Second dimension | Hours of day |
| **Color** | Intensity/count | Number of sessions |

### 3. Include a Legend

Show what colors mean:
```
Sessions per hour
  0    25    50    75   100+
  ⬜   🟦    🔵    🟦    ⬛
```

### 4. Limit Grid Size

| Grid Size | Readability |
|-----------|-------------|
| 7×24 (day × hour) | Perfect |
| 12×30 (month × day) | Good |
| 50×50 | Too dense — hard to read |

---

## Common Issues and How to Fix Them

| Issue | Problem | Fix |
|-------|---------|-----|
| **Too Many Colors** | Using 10+ color gradations or rainbow spectrum | Use 3-5 color stops maximum: Light (low) · Medium (moderate) · Dark (high) |
| **No Legend** | Colors shown but user doesn't know what they mean | Always include color scale legend with values |
| **Missing Zero State** | Unclear if white/light means "zero" or "low" | Explicitly label zero in legend and use distinct color (white/gray) |
| **Wrong Color Direction** | Dark color for low values, light for high | Use perceptually intuitive mapping: Darker = More intense/higher value · Lighter = Less intense/lower value |

---

## Heatmap Variations

### Time-Based Heatmap

**Use case**: "When are users most active?"

```
        Mon  Tue  Wed  Thu  Fri  Sat  Sun
12am    ⬜   ⬜   ⬜   ⬜   ⬜   🟦   🟦
6am     ⬜   ⬜   ⬜   ⬜   ⬜   🔵   🔵
12pm    🔵   🔵   🔵   🔵   🔵   🟦   🟦
6pm     🟦   🟦   🟦   🟦   ⬛   🔵   🔵
```

**Insight**: Peak activity Friday 6pm, weekends different pattern

### Feature Correlation Heatmap

**Use case**: "Which features are used together?"

```
           Search  Filter  Export  Save
Search       ⬛      🔵      🟦     🟦
Filter       🔵      ⬛      🔵     🔵
Export       🟦      🔵      ⬛     ⬜
Save         🟦      🔵      ⬜     ⬛
```

**Insight**: Search + Filter often used together, Export rarely with Save

### Geographic Heatmap

**Use case**: "Where is engagement highest?"

Shows intensity by region/location on a map overlay.

---

## Labeling Best Practices

### Title Formula

**Pattern**: [Metric] by [X-axis] and [Y-axis] ([Time Period])

Examples:
- "User Sessions by Day and Hour (Last 30 Days)"
- "Feature Co-Usage Heatmap (This Quarter)"
- "Support Tickets by Region and Category (2025)"

### Axis Labels

- **X-axis**: Clear dimension labels (Mon, Tue, Wed...)
- **Y-axis**: Clear dimension labels (12am, 1am, 2am...)
- **Legend**: Value range with units

### Cell Values (Optional)

For small grids (under 10×10), can show actual numbers in cells:
```
      Mon    Tue
9am   245    312
10am  567    623
```

---

## Placement

**By Dashboard Type:**
- **Executive**: Rarely — too detailed for high-level view
- **Product**: Frequently — engagement patterns, feature usage
- **Growth**: Usage — time-based conversion patterns
- **Operations**: Critical — support ticket patterns, capacity planning

**Position**: Analysis zone (middle section, below KPIs)

---

## Quick Checklist

- [ ] Sequential color scale (light to dark)
- [ ] Clear axis labels on both dimensions
- [ ] Color legend with value ranges
- [ ] Grid size is readable (ideally under 30×30)
- [ ] Zero state clearly represented
- [ ] Title explains what heatmap shows
- [ ] Dark = high intensity, light = low intensity
- [ ] Time period clearly stated

---

## See Also

- [Line Chart](./line-chart.md) — For trends over single time dimension
- [Scatter Plot](./scatter-plot.md) — For correlation with exact values
- [Table](./table.md) — For exact values instead of visual intensity
- [Product Dashboards](../dashboard-personas.md#3-product-managers--designers-product-analytics) — Heavy heatmap usage
- [Cohort Chart](./cohort-retention.md) — Special type of time-based heatmap
