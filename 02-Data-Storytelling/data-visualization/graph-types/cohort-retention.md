# Cohort/Retention Chart: The Complete Guide

**← [Back to Graphs &amp; Dashboard Design](../intro-to-graphs.md)**

The retention chart answers product's most existential question: "Do users come back?" showing how cohorts behave over time.

---

## When to Use a Cohort/Retention Chart

**Perfect for:**

- User retention tracking (Day 1, Day 7, Day 30)
- Cohort comparison (Jan signups vs Feb signups)
- Product stickiness measurement
- Feature adoption persistence

**Questions it answers:**

- "Do users come back after Day 1, Day 7, Day 30?"
- "Is retention improving for recent cohorts?"
- "Which cohort had the best retention?"
- "When do most users churn?"

**Not ideal for:**

- Overall trends (use [line chart](./line-chart.md))
- Single metric tracking (use [KPI card](./kpi-card.md))
- Non-time-based analysis

---

## Design Principles

### 1. Cohorts on Y-Axis, Time Periods on X-Axis

**Standard layout:**

```
Cohort        Day 0  Day 1  Day 7  Day 30
Jan 2025      100%   45%    32%    18%
Feb 2025      100%   48%    35%    22%
Mar 2025      100%   52%    38%    —
```

### 2. Show Both % Retention AND Absolute Numbers

| Approach                  | What to Show        | Example         |
| ------------------------- | ------------------- | --------------- |
| **Percentage only** | ❌ Misleading       | 50% retention   |
| **Count only**      | ❌ Hard to compare  | 500 users       |
| **Both**            | ✅ Complete picture | 50% (500 users) |

**Why both matter:**

- 80% retention of 10 users = 8 users (not meaningful)
- 20% retention of 100,000 users = 20,000 users (very meaningful)

### 3. Use Color to Show Retention Intensity

```
100%  ⬛ Dark green (perfect retention)
75%   🟩 Medium green
50%   🟨 Yellow (warning)
25%   🟧 Orange (concerning)
0%    🟥 Red (complete churn)
```

### 4. Label Time Periods Consistently

**Common patterns:**

- **Daily retention**: Day 0, Day 1, Day 7, Day 14, Day 30
- **Weekly retention**: Week 0, Week 1, Week 4, Week 12
- **Monthly retention**: Month 0, M1, M3, M6, M12

---

## Common Issues

### Issue 1: Comparing Different Sized Cohorts

**Problem**:

```
Cohort A: 100 users → 90% retention (90 users)
Cohort B: 10,000 users → 40% retention (4,000 users)
```

Cohort A looks "better" but Cohort B has 44× more retained users!

**Fix**: Always show absolute numbers alongside percentages

### Issue 2: Not Showing Cohort Size

**Problem**: Percentages shown without initial cohort count

**Fix**: Add a "Size" column:

```
Cohort      Size    Day 0  Day 1  Day 7
Jan 2025    10K     100%   45%    32%
Feb 2025    50      100%   80%    70%  ← Small cohort!
```

### Issue 3: Too Many Time Periods

**Problem**: Showing Day 0 through Day 365 (366 columns!)

**Fix**: Use strategic intervals:

- Days 0, 1, 7, 14, 30 (first month)
- Weeks 4, 8, 12 (months 2-3)
- Months 6, 12 (long-term)

### Issue 4: No Incomplete Data Indicator

**Problem**: Recent cohorts don't have Day 30 data yet, but cell shows 0%

**Fix**: Use "—" or gray for not-yet-available data:

```
Cohort        Day 0  Day 1  Day 7  Day 30
Jan 2025      100%   45%    32%    18%
Feb 2025      100%   48%    35%    22%
Mar 2025      100%   52%    38%    —      ← Too early
```

---

## Cohort Chart Variations

![Cohort Chart Variations](../images/cohort-retention-chart-variations.png)

### Classic Retention Table

**Layout**: Grid with percentages and color coding

```
Cohort      Day 0  Day 1  Day 7  Day 30
W1 Jan      100%   42%    28%    12%
W2 Jan      100%   45%    31%    15%
W3 Jan      100%   48%    35%    18%
W4 Jan      100%   50%    38%    22%
```

**Insight**: Retention improving week-over-week (good!)

### Retention Curve

**Alternative visualization**: [Line chart](./line-chart.md) showing retention curves

```
100% ─┐
      │ ╲_____ Jan cohort
 50% ─┤      ╲_____ Feb cohort (better)
      │           ╲___
  0% ─┴─────────────────
     Day 0  Day 7  Day 30
```

**Use when**: Want to emphasize curve shape differences

### Unbounded Retention (N-Day)

Instead of calendar cohorts, track "Days since signup":

- Day 0 retention = 100% (by definition)
- Day 1 retention = All users who returned 1 day after signup
- Day 7 retention = All users who returned 7 days after signup

**Use when**: You care about behavior relative to signup, not calendar time

---

## Labeling Best Practices

![Labeling Best Practices](../images/cohort-retention-labeling-best-practices.png)

### Title Formula

**Pattern**: [Cohort Type] Retention ([Time Range])

Examples:

- "Weekly Signup Cohorts: 30-Day Retention"
- "Feature Adoption Retention by Month"
- "User Retention: First 90 Days"

### Row Labels (Cohorts)

- Clear cohort definition: "Jan 2025 Signups" not "Jan"
- Show cohort size: "Jan 2025 (10,000 users)"
- Chronological order: Most recent at top OR bottom (be consistent)

### Column Labels (Time Periods)

- Consistent intervals: Day 0, 1, 7, 14, 30 (not 0, 1, 2, 3, 4...)
- Clear units: "Day 1" not "1"
- Align to cohort definition: If cohort = "Week of Jan 1", use Week 0, Week 1, etc.

---

## Placement

**By Dashboard Type:**

- **Executive**: Summary only (e.g., "Overall 30-day retention: 22%")
- **Product**: Critical — full cohort analysis, retention drivers
- **Growth**: Essential — activation and retention analysis
- **Sales/Success**: Account retention cohorts

**Position**: Drivers zone (central focus area)

---

## Quick Checklist

- [ ] Cohorts on Y-axis, time periods on X-axis
- [ ] Both percentages AND absolute numbers shown
- [ ] Cohort size displayed
- [ ] Color coding for retention intensity
- [ ] Incomplete data marked clearly (not as 0%)
- [ ] Strategic time intervals (not every single day)
- [ ] Recent cohorts at top or bottom (consistent order)
- [ ] Title includes cohort type and time range
- [ ] Legend explains color scale

---

## Advanced: What Good Retention Looks Like

### Smile Curve (Ideal)

```
100% retention ─┐
                │╲
                │ ╲_____  ← Initial drop is normal
                │       ────── ← Flattens = retained core
  0% ───────────┴────────────────────
              Day 0    Day 7    Day 30
```

**Healthy pattern**: Sharp initial drop, then flattening

### Continued Decline (Warning)

```
100% ─┐
      │╲
      │ ╲___
      │     ╲___
      │         ╲___ ← Never flattens
  0% ─┴──────────────╲___
     Day 0        Day 30
```

**Problem**: No retained core — product not sticky

---

## See Also

- [Heatmap](./heatmap.md) — Visual alternative for retention patterns
- [Line Chart](./line-chart.md) — For retention curves over time
- [Funnel Chart](./funnel.md) — For activation leading to retention
- [Product Dashboards](../dashboard-personas.md#3-product-managers--designers-product-analytics) — Heavy retention focus
- [Growth Analytics](../../04-Growth-Funnel.md) — Retention as growth driver
