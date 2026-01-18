# Scatter Plot: The Complete Guide

**← [Back to Graphs & Dashboard Design](../intro-to-graphs.md)**

The scatter plot reveals relationships between variables — it's the chart that answers "are these two things connected?"

---

## History & Origin

### Early Scientific Use (1800s)

While Playfair invented commercial visualization, the scatter plot emerged from **scientific inquiry**. John Herschel and Francis Galton pioneered its use in the 1800s to study relationships between variables — like the correlation between parents' and children's heights.

### Why It's Unique

The scatter plot is the only common chart where **both axes are quantitative variables**. Each point represents one observation with two measurements. This makes it perfect for answering: "When X goes up, does Y go up too?"

---

## When to Use a Scatter Plot

### Perfect For:

| Question Type | Example |
|--------------|---------|
| **Correlation** | Do more ad spend = more conversions? |
| **Outlier detection** | Which customers behave differently? |
| **Clustering** | Are there natural groups in our data? |
| **Distribution of two variables** | How do price and rating interact? |
| **Regression analysis** | Can we predict Y from X? |

### Not Ideal For:

- Time series (use [line chart](./line-chart.md))
- Categorical comparisons (use [bar chart](./bar-chart.md))
- Part-to-whole (use [pie chart](./pie-chart.md) or stacked [area chart](./area-chart.md))
- Single variable distribution (use [histogram](./histogram.md))
- Very small datasets (< 10 points)

---

## Scatter Plot Variations

| Type | Use Case | Example |
|------|----------|---------|
| **Basic scatter** | Two variables, one observation per point | Height vs. weight |
| **Bubble chart** | Third variable encoded as size | Revenue vs. profit, sized by market cap |
| **Scatter with trendline** | Show correlation direction | Sales vs. marketing spend |
| **Scatter with categories** | Groups by color | Performance by department |
| **Scatter matrix** | Multiple variable pairs | All pairs of metrics at once |

---

## Design Principles: What Makes a Beautiful Scatter Plot

### 1. Each Point = One Observation

Unlike other charts, each dot represents a single data point with two values. Make sure readers understand what each point represents.

**Label**: "Each dot represents one customer"

### 2. Axis Choices

| Decision | Recommendation |
|----------|----------------|
| **Which variable on X?** | The "cause" or independent variable |
| **Which on Y?** | The "effect" or dependent variable |
| **Start at zero?** | Only if meaningful; relationship matters more than absolute values |
| **Scale** | Linear usually; log if data spans orders of magnitude |

### 3. Point Size and Opacity

| Issue | Solution |
|-------|----------|
| **Few points (< 50)** | Larger dots, distinct colors |
| **Many points (100s)** | Smaller dots, some transparency |
| **Overplotting (1000s)** | High transparency, hexbins, or sampling |

**Transparency formula**: More points = more transparency

### 4. Trendlines

| When to Add | When to Skip |
|-------------|--------------|
| Pattern isn't obvious | Relationship is already clear |
| Making a prediction claim | Just exploring data |
| Showing correlation strength | Pattern is nonlinear/complex |

**Include R² value** when you add a trendline — it quantifies correlation strength.

### 5. Color for Categories

If showing groups:
- Use distinct colors (max 5-7 categories)
- Ensure colorblind-friendly palette
- Consider shape as well as color

---

## Common Issues and How to Fix Them

### Issue 1: Overplotting

**Problem**: Too many points overlap, creating a solid blob

**Why it matters**: Can't see distribution, outliers hidden

**Solutions**:
| Method | Best For |
|--------|----------|
| **Transparency** | Moderate overplotting (100-1000 points) |
| **Jittering** | Categorical variables causing stacking |
| **Hexbin/heatmap** | Large datasets (10,000+) |
| **Sampling** | Massive datasets, if representative |
| **Size reduction** | Moderate overplotting |

---

### Issue 2: Correlation ≠ Causation

**Problem**: Scatter plots SHOW correlation but don't PROVE causation

**Example**: Ice cream sales correlate with drowning deaths (both rise in summer). This doesn't mean ice cream causes drowning.

**Fix**: Never claim causation from correlation alone. Use language carefully:
- "X and Y are correlated" ✓
- "X causes Y" ✗ (unless proven through experiment)

---

### Issue 3: Missing Trendline When Needed

**Problem**: Relationship exists but isn't obvious from scattered points

**Fix**: Add a trendline with R² value. Explain what it means:
- R² = 0.9 → Strong relationship
- R² = 0.5 → Moderate relationship
- R² = 0.1 → Weak relationship

---

### Issue 4: Wrong Trendline Type

**Problem**: Fitting a linear trendline to clearly nonlinear data

**Example**: Growth curves, logarithmic relationships

**Fix**: Match trendline to data pattern:
- Linear for straight-line relationships
- Polynomial for curves
- Logarithmic for diminishing returns
- Or no trendline if relationship is complex

---

### Issue 5: Axis Scale Manipulation

**Problem**: Changing axis scales to exaggerate or hide correlation

**Example**: Stretching Y-axis makes weak correlation look strong

**Fix**: Use consistent scales. Consider showing the same scatter at different aspect ratios to show it's not manipulated.

---

### Issue 6: Too Many Categories

**Problem**: 10 colors = visual chaos

**Fix**:
- Limit to 5-7 colors maximum
- Group minor categories as "Other"
- Use small multiples (one scatter per category)
- Add interactivity to filter

---

## Labeling Best Practices

### Title Formula

**Pattern**: [Relationship] between [X] and [Y]

| Weak Title | Strong Title |
|------------|--------------|
| "Price vs. Quantity" | "Higher prices correlate with lower quantity sold" |
| "Marketing and Sales" | "Marketing spend shows weak relationship with sales (R²=0.3)" |

### Axis Labels

- Always label both axes
- Include units: "Revenue ($K)" not just "Revenue"
- Explain transformations: "Revenue (log scale)"

### Point Labels

For small datasets (< 20 points), consider labeling individual points:
- Company names
- Product names
- Customer IDs

For larger datasets, label only outliers or interesting points.

### Annotations

Call out:
- Outliers ("Unusual: Customer X")
- Clusters ("Enterprise segment")
- Thresholds ("Target performance zone")
- Trendline equation and R²

---

## Bubble Charts: Adding a Third Dimension

### When to Use

When you have three quantitative variables:
- X-axis: First variable
- Y-axis: Second variable
- Bubble size: Third variable

**Example**: Countries plotted by GDP (X) vs. Life Expectancy (Y), sized by Population

### Design Rules

| Rule | Why |
|------|-----|
| **Size = area, not radius** | Humans perceive area, not radius |
| **Include size legend** | Show what sizes mean |
| **Limit bubbles** | Overlapping bubbles are hard to read |
| **Consider transparency** | Overlapping bubbles need it |

### Common Mistake

Using radius instead of area for encoding — makes large values look disproportionately huge.

---

## Real-World Examples

### Good Example: Clear Correlation

A scatter plot showing "Ad Spend vs. Conversion Rate":
- Each dot = one campaign
- Clear positive correlation visible
- Trendline with R² = 0.72
- Outliers labeled ("Campaign X: influencer-driven")
- Title: "Ad spend correlates with conversions (R²=0.72)"

### Bad Example: Chartjunk Scatter

A scatter plot with:
- 3D perspective
- Gridlines everywhere
- 15 category colors
- No axis labels
- Points too large, overlapping
- No trendline despite obvious pattern

---

## Quick Checklist

Before publishing a scatter plot:

- [ ] Each axis labeled with units
- [ ] Point size appropriate (no overplotting)
- [ ] Trendline if relationship isn't obvious
- [ ] R² value if trendline is included
- [ ] Maximum 5-7 color categories
- [ ] Outliers explained or labeled
- [ ] Title states the relationship (or lack thereof)
- [ ] Causation not claimed unless proven
- [ ] No 3D effects

---

## Summary

The scatter plot is the relationship detective:
- It shows whether two things move together
- It reveals outliers and clusters
- It does NOT prove causation

Use it when you're asking "are these connected?" Keep it simple, handle overplotting, and be honest about what correlation means.

---

## See Also

- **[Bar Chart](./bar-chart.md)** — For comparing categories instead of correlation
- **[Histogram](./histogram.md)** — For understanding the distribution of individual variables
- **[Line Chart](./line-chart.md)** — For tracking individual variables over time
- **[Bubble Chart Variation](../intro-to-graphs.md#bubble-charts-adding-a-third-dimension)** — In this guide, learn how to add a third variable

**Related Concepts**:
- [Correlation vs. Causation](../intro-to-graphs.md#issue-2-correlation--causation)
- [Data Storytelling and Insights](../intro-to-graphs.md#part-8-data-storytelling-framework)
- [Finding Patterns in Data](../intro-to-graphs.md#part-2-why-should-product-people-care-about-graphs)
