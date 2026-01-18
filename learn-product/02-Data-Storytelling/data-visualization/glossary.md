# Data Visualization Glossary

**← [Back to Graphs & Dashboard Design](intro-to-graphs.md)**

A reference guide for common data visualization terms, concepts, and techniques.

---

## A

### Annotation
Text, arrows, or markers added to a chart to highlight important events, thresholds, or insights.

**Usage**: All chart types
**Example**: Marking "Product launch" on a [line chart](graph-types/line-chart.md) to explain a spike in traffic

### Aspect Ratio
The width-to-height ratio of a chart. Affects how steep or flat trends appear.

**Usage**: Primarily [line charts](graph-types/line-chart.md)
**Best practice**: Average slope should be ~45° for accurate perception of change

### Axis
The reference lines (X and Y) that define the scale and dimensions of a chart.

**X-axis**: Horizontal axis, typically shows categories or time
**Y-axis**: Vertical axis, typically shows measured values
**Usage**: [Bar charts](graph-types/bar-chart.md), [line charts](graph-types/line-chart.md), [scatter plots](graph-types/scatter-plot.md), [histograms](graph-types/histogram.md)

### Axis Truncation
Starting the Y-axis at a value other than zero, which can exaggerate differences.

**When acceptable**: [Line charts](graph-types/line-chart.md) showing fluctuations in established metrics
**When misleading**: [Bar charts](graph-types/bar-chart.md) and [area charts](graph-types/area-chart.md) where length/area represents magnitude
**Best practice**: If truncating, clearly annotate why

---

## B

### Baseline
The reference line (usually zero) from which values are measured.

**Usage**: [Bar charts](graph-types/bar-chart.md), [area charts](graph-types/area-chart.md), stacked charts
**Why it matters**: In stacked charts, only the bottom segment has a common baseline, making it easiest to compare

### Bin
A range or bucket that groups continuous data into discrete intervals.

**Usage**: [Histograms](graph-types/histogram.md)
**Example**: Grouping response times into bins: 0-1s, 1-2s, 2-3s
**Key decision**: Bin width determines whether patterns are revealed or hidden
**Guidelines**: Start with √n bins or Sturges' rule: 1 + 3.322 × log(n)

### Bimodal Distribution
A distribution with two distinct peaks, suggesting two separate groups in the data.

**Usage**: [Histograms](graph-types/histogram.md)
**Implication**: Indicates hidden segmentation — analyze groups separately
**Example**: Session duration showing peaks at 30 seconds (bouncers) and 15 minutes (engaged users)

### Box Plot (Box-and-Whisker Plot)
A standardized way of displaying distribution based on five-number summary: minimum, Q1, median (Q2), Q3, maximum.

**Usage**: Comparing distributions across multiple groups
**Components**:
- Box: Shows IQR (Q1 to Q3) — contains middle 50% of data
- Line in box: Median (Q2)
- Whiskers: Extend to min/max or 1.5 × IQR from box edges
- Points beyond whiskers: Outliers
**When to use**: Comparing 5+ distributions quickly; showing spread and outliers
**Alternative**: [Histograms](graph-types/histogram.md) for detailed shape, violin plots for distribution + density

### Bubble Chart
A [scatter plot](graph-types/scatter-plot.md) where point size represents a third variable.

**Usage**: Showing three quantitative variables
**Example**: Countries by GDP (X) vs Life Expectancy (Y), sized by Population
**Best practice**: Size by area, not radius

---

## C

### Categorical Data
Data divided into distinct groups or categories (non-numeric).

**Usage**: [Bar charts](graph-types/bar-chart.md), [pie charts](graph-types/pie-chart.md)
**Example**: Product types, regions, departments
**Contrast**: Continuous data (numeric values on a spectrum)

### Causation
When one variable directly causes a change in another.

**Usage**: [Scatter plots](graph-types/scatter-plot.md)
**Critical distinction**: Correlation ≠ Causation
**Example**: Ice cream sales correlate with drowning deaths (both rise in summer), but ice cream doesn't cause drowning

### Cohort
A group of users or entities that share a common characteristic or start date.

**Usage**: [Cohort retention charts](graph-types/cohort-retention.md), [heatmaps](graph-types/heatmap.md)
**Example**: All users who signed up in January 2024

### Confidence Interval
A range of values that likely contains the true population parameter with a certain level of confidence.

**Usage**: Statistical analysis, A/B testing, survey results
**Common levels**: 95% confidence interval (most common), 90%, 99%
**Interpretation**: "We are 95% confident the true conversion rate is between 23% and 27%"
**Visual**: Often shown as error bars on charts
**Why it matters**: Quantifies uncertainty in estimates; small samples = wider intervals

### Continuous Data
Numeric data that can take any value within a range.

**Usage**: [Histograms](graph-types/histogram.md), [scatter plots](graph-types/scatter-plot.md), [line charts](graph-types/line-chart.md)
**Example**: Response time, revenue, temperature
**Contrast**: Categorical data (distinct groups)

### Correlation
A statistical relationship where two variables move together.

**Usage**: [Scatter plots](graph-types/scatter-plot.md)
**Measured by**: R² value (0 to 1)
**Types**: Positive (both increase), Negative (one increases as other decreases), None (no relationship)

---

## D

### Data Label
Numbers displayed directly on chart elements (bars, points, slices).

**Usage**: All chart types
**When to use**: Small datasets where exact values matter
**When to skip**: Large datasets where patterns matter more than precision

### Delta (Δ)
The change or difference between two values, often shown as percentage or absolute change.

**Usage**: [KPI cards](graph-types/kpi-card.md)
**Format**: "+12% WoW" (week-over-week)
**Best practice**: Always include direction (+/-) and comparison period

### Density
The relative frequency per unit, used to compare distributions with different sample sizes.

**Usage**: [Histograms](graph-types/histogram.md) when comparing groups, density plots
**Y-axis**: Shows density (probability density) instead of count
**Why use it**: Allows fair comparison of distributions with different totals
**Example**: Comparing session duration for 1,000 free users vs 100 paid users
**Visual**: Area under curve = 1 (or 100%)

### Distribution
The pattern of how values are spread across a range.

**Usage**: [Histograms](graph-types/histogram.md)
**Common shapes**: Normal (bell curve), Right-skewed, Left-skewed, Bimodal, Uniform
**Why it matters**: Shape determines whether average is meaningful

### Dual Y-Axis
Two different scales on left and right sides of a chart.

**Usage**: Often misused in [line charts](graph-types/line-chart.md) and [bar charts](graph-types/bar-chart.md)
**Why problematic**: Can make any two variables appear correlated by choosing scales
**Better alternative**: Use two separate charts or normalize to percentages

---

## E

### Exploded Slice
A [pie chart](graph-types/pie-chart.md) slice pulled away from the center for emphasis.

**When acceptable**: Emphasizing ONE important segment
**When not**: Exploding multiple slices or using decoratively

---

## F

### Frequency
The number of times a value or range of values occurs in a dataset.

**Usage**: [Histograms](graph-types/histogram.md), bar charts with counts
**Example**: In response time histogram, frequency shows how many requests fall in each time bin
**Y-axis label**: Often "Count", "Frequency", or "Number of observations"
**Relative frequency**: Frequency expressed as proportion or percentage of total
**Cumulative frequency**: Running total of frequencies up to a given point

---

## G

### Gridlines
Horizontal or vertical reference lines that help read values from a chart.

**Usage**: Most chart types
**Best practice**: Use 3-5 gridlines; remove if precision isn't the goal

### Grouped Bar Chart
Bars placed side-by-side to compare sub-categories.

**Usage**: When direct comparison across categories matters
**Example**: Revenue by region, with bars for each product line grouped together
**Contrast**: Stacked bars (bars on top of each other)

---

## H

### Hexbin
A technique for handling overplotting in [scatter plots](graph-types/scatter-plot.md) by grouping points into hexagonal bins.

**Usage**: Large datasets (10,000+ points)
**Benefit**: Shows density when individual points would create a blob

---

## I

### Interpolation
Estimating missing values between known data points.

**Usage**: [Line charts](graph-types/line-chart.md) with gaps
**Caution**: Only interpolate if valid for the data; be transparent about it
**Never**: Silently interpolate if gaps might hide important events

---

## J

### Jittering
Slightly randomizing point positions to avoid overlap in [scatter plots](graph-types/scatter-plot.md).

**Usage**: When categorical variables cause points to stack
**Benefit**: Reveals individual points that would otherwise be hidden

---

## K

### KPI (Key Performance Indicator)
A critical metric that indicates business health or progress toward goals.

**Usage**: [KPI cards](graph-types/kpi-card.md), dashboards
**Example**: Monthly Recurring Revenue, Conversion Rate, Churn
**Best practice**: Limit to 3-5 KPIs per dashboard

---

## L

### Legend
A key that explains what colors, shapes, or patterns represent in a chart.

**Usage**: All chart types with multiple series
**Best practice**: Label data directly instead of using legends when possible
**Placement**: Close to the data, not at the bottom

### Log Scale
A scale where each step represents a multiplication (not addition).

**Usage**: [Scatter plots](graph-types/scatter-plot.md), [histograms](graph-types/histogram.md) with highly skewed data
**Example**: 1, 10, 100, 1000 instead of 1, 2, 3, 4
**When to use**: Data spans orders of magnitude

---

## M

### Mean
The average of all values (sum divided by count).

**Usage**: [Histograms](graph-types/histogram.md), statistics
**Formula**: Sum of all values ÷ Number of values
**Limitation**: Sensitive to outliers; can be misleading with skewed distributions
**Alternative**: Median for skewed data
**Example**: [2, 3, 4, 100] has mean = 27.25 (pulled up by outlier 100)

### Median
The middle value when data is sorted (50th percentile).

**Usage**: [Histograms](graph-types/histogram.md), skewed distributions
**Benefit**: Not affected by outliers
**When to use**: Right-skewed or left-skewed distributions
**Example**: [2, 3, 4, 100] has median = 3.5 (not affected by outlier)

### Mode
The most frequently occurring value in a dataset.

**Usage**: [Histograms](graph-types/histogram.md), categorical data
**Example**: In [1, 2, 2, 2, 3, 4], mode = 2 (appears most often)
**Unimodal**: One peak (one mode)
**Bimodal**: Two peaks (two distinct modes) — suggests two separate groups
**Multimodal**: Multiple peaks — suggests multiple distinct groups
**When useful**: Understanding what value is most typical or common

### Moving Average (Rolling Average)
A calculation that smooths time series data by averaging values over a sliding window.

**Usage**: [Line charts](graph-types/line-chart.md) to smooth noisy data and show trends
**Common windows**: 7-day, 30-day, 90-day
**Example**: 7-day moving average of daily signups smooths weekend dips
**Types**:
- **Simple Moving Average (SMA)**: Equal weight to all values in window
- **Exponential Moving Average (EMA)**: More weight to recent values
**When to use**: Daily data with high variance; highlighting underlying trend

---

## N

### Normal Distribution
A symmetric, bell-shaped distribution where values cluster around the mean.

**Usage**: [Histograms](graph-types/histogram.md)
**Example**: Human heights, measurement errors
**Implication**: Average is representative of typical values

---

## O

### Outlier
A data point that differs significantly from other observations.

**Usage**: [Scatter plots](graph-types/scatter-plot.md), [histograms](graph-types/histogram.md), [box plots](graph-types/histogram.md#alternatives-for-multiple-groups)
**Handling**: Investigate, annotate, or handle separately
**Don't**: Silently remove without explanation

### Overplotting
When too many data points overlap, hiding the true distribution.

**Usage**: [Scatter plots](graph-types/scatter-plot.md)
**Solutions**: Transparency, jittering, hexbins, sampling, size reduction

---

## P

### Percentile
The value below which a given percentage of observations fall.

**Usage**: [Histograms](graph-types/histogram.md), [KPI cards](graph-types/kpi-card.md)
**Example**: 95th percentile response time = 95% of requests are faster than this
**Common**: 25th (Q1), 50th (median), 75th (Q3), 95th, 99th
**Related**: Quartiles divide data into quarters (Q1 = 25th percentile, Q2 = median, Q3 = 75th percentile)

---

## Q

### Quartile
Values that divide a dataset into four equal parts.

**Usage**: [Histograms](graph-types/histogram.md), box plots
**Q1 (First Quartile)**: 25th percentile — 25% of values fall below this
**Q2 (Second Quartile)**: 50th percentile (median) — middle value
**Q3 (Third Quartile)**: 75th percentile — 75% of values fall below this
**IQR (Interquartile Range)**: Q3 - Q1, shows spread of middle 50% of data
**Use case**: Understanding spread and identifying outliers

---

## R

### R² (R-squared)
A measure of how well a trendline fits the data (0 to 1).

**Usage**: [Scatter plots](graph-types/scatter-plot.md) with trendlines
**Interpretation**:
- R² = 0.9: Strong relationship (90% of variance explained)
- R² = 0.5: Moderate relationship
- R² = 0.1: Weak relationship

### Range
The difference between the maximum and minimum values in a dataset.

**Usage**: [Histograms](graph-types/histogram.md), understanding data spread
**Formula**: Maximum value - Minimum value
**Example**: Dataset [10, 25, 30, 45] has range = 45 - 10 = 35
**Limitation**: Sensitive to outliers
**Alternative**: IQR (Interquartile Range) for more robust measure

### Reference Line
A line marking a target, average, or threshold.

**Usage**: All chart types
**Examples**: Target revenue, industry average, SLA threshold
**Visual**: Typically dashed or dotted line in contrasting color

---

## S

### Seasonality
Regular, predictable patterns that repeat at fixed intervals in time series data.

**Usage**: [Line charts](graph-types/line-chart.md), time series analysis
**Common patterns**:
- Daily: Peak during business hours, low overnight
- Weekly: Lower on weekends
- Monthly: End-of-month spikes
- Yearly: Holiday shopping season, summer dips
**Example**: E-commerce sales spike every November (Black Friday/Cyber Monday)
**Why it matters**: Helps distinguish normal patterns from actual changes
**Analysis**: Compare to same period last year, not previous month

### Sequential Color Scale
A color scheme that goes from light to dark to show intensity.

**Usage**: [Heatmaps](graph-types/heatmap.md), [stacked areas](graph-types/area-chart.md)
**Example**: White → Light Blue → Dark Blue
**Contrast**: Diverging (two colors from center), Categorical (distinct hues)

### Skewed Distribution
A distribution where values cluster on one side with a long tail on the other.

**Usage**: [Histograms](graph-types/histogram.md)
**Types**:
- **Right-skewed (Positive skew)**: Long tail to the right, most values are low with few high values
  - Examples: Income, response times, page load times, house prices
  - Mean > Median (pulled right by outliers)
- **Left-skewed (Negative skew)**: Long tail to the left, most values are high with few low values
  - Examples: Age at retirement, test scores (when most students do well), product ratings (4-5 stars)
  - Mean < Median (pulled left by outliers)
**Implication**: Average is misleading; use median instead
**Visual identifier**: In histogram, if the tail points right = right-skewed; if tail points left = left-skewed

### Small Multiples
Multiple small charts showing the same type of data across different categories.

**Usage**: Alternative to cluttered multi-series charts
**Example**: One [line chart](graph-types/line-chart.md) per product line, all with same scale
**Benefit**: Easy comparison without overlapping lines

### Sparkline
A tiny, simplified [line chart](graph-types/line-chart.md) shown inline with text or in a table.

**Usage**: Showing trends in compact spaces
**Characteristics**: No axes, no labels, minimal design
**Example**: Stock price trend next to ticker symbol

### Stacked Bar/Area
Chart where segments are placed on top of each other to show both total and composition.

**Usage**: [Stacked bar charts](graph-types/stacked-bar.md), [area charts](graph-types/area-chart.md)
**Limitation**: Middle segments lack common baseline, hard to compare
**Best practice**: Put most important segment at bottom

### Standard Deviation (σ)
A measure of how spread out values are from the mean. Shows average distance of data points from the mean.

**Usage**: [Histograms](graph-types/histogram.md), statistics, understanding variability
**Formula**: Square root of variance
**Interpretation**:
- Low standard deviation: Values cluster tightly around mean (consistent data)
- High standard deviation: Values spread widely (high variability)
**Example**: Response times with σ = 50ms (low variability) vs σ = 500ms (high variability)
**Rule**: In normal distribution, ~68% of values fall within 1 standard deviation of mean
**When to report**: When showing consistency or reliability of metrics

---

## T

### Trend
The general direction or pattern in time series data over a longer period.

**Usage**: [Line charts](graph-types/line-chart.md), time series analysis
**Types**:
- **Upward trend**: Values generally increasing over time
- **Downward trend**: Values generally decreasing over time
- **Flat/No trend**: No consistent direction
**Distinguishing from noise**: Use moving averages to smooth short-term fluctuations
**Vs Seasonality**: Trend is long-term direction; seasonality is cyclical pattern

### Trendline
A line fitted to data points showing the overall direction or pattern.

**Usage**: [Scatter plots](graph-types/scatter-plot.md), [line charts](graph-types/line-chart.md)
**Types**:
- **Linear**: Straight line (constant rate of change)
- **Polynomial**: Curved line (accelerating/decelerating change)
- **Logarithmic**: Flattening curve (diminishing returns)
- **Exponential**: Steepening curve (compound growth)
**Best practice**: Include R² value to show strength of relationship
**When to add**: When relationship exists but isn't obvious from scattered points

---

## U

### Uniform Distribution
A distribution where all values occur with roughly equal frequency.

**Usage**: [Histograms](graph-types/histogram.md)
**Visual**: Flat histogram with bars of similar height
**Example**: Random number generators, dice rolls
**Implication**: No dominant pattern; may indicate missing segmentation or truly random data

### Unimodal Distribution
A distribution with a single peak or mode.

**Usage**: [Histograms](graph-types/histogram.md)
**Example**: Normal distribution, most common pattern
**Contrast**: Bimodal (two peaks), Multimodal (multiple peaks)

---

## V

### Variance (σ²)
A measure of how spread out values are from the mean, calculated as the average of squared differences.

**Usage**: [Histograms](graph-types/histogram.md), statistics
**Formula**: Average of (each value - mean)²
**Relationship**: Standard deviation = √Variance
**Interpretation**:
- Low variance: Values tightly clustered around mean
- High variance: Values widely spread
**Example**: Dataset [10, 12, 11] has lower variance than [5, 15, 10] (same mean, different spread)
**Note**: In squared units, so standard deviation is often more intuitive to interpret

---

## Z

### Z-Score
The number of standard deviations a value is from the mean.

**Usage**: Statistics, identifying outliers
**Formula**: (Value - Mean) / Standard Deviation
**Interpretation**:
- Z-score = 0: Value equals the mean
- Z-score = +2: Value is 2 standard deviations above mean
- Z-score = -2: Value is 2 standard deviations below mean
**Common threshold**: |Z-score| > 3 often indicates an outlier
**Example**: If mean response time = 200ms, σ = 50ms, then 350ms has Z-score = (350-200)/50 = 3

---

## See Also

- **[Introduction to Graphs](intro-to-graphs.md)** — Core concepts and principles
- **[Dashboard Personas](dashboard-personas.md)** — How different roles use these terms
- **[Graph Types Reference](intro-to-graphs.md#part-6-graph-types-reference)** — When to use each chart type
