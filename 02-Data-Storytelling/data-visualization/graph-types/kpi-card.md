# KPI Card: The Complete Guide

**← [Back to Graphs & Dashboard Design](../intro-to-graphs.md)**

The KPI card is the attention magnet of dashboards — a single number with context that immediately tells you if things are good or bad.

---

## History & Origin

### The Digital Scorecard (2000s)

KPI cards emerged with the rise of business intelligence dashboards in the early 2000s. They adapted the concept of "at-a-glance metrics" from physical scorecards and executive summary reports to digital interfaces.

The innovation: Instead of reading through rows in a table, executives could see the most important number instantly — like a speedometer in a car.

### Why It Works

KPI cards leverage the principle of **progressive disclosure**: show the headline first, details later. Our brains process large, isolated numbers faster than data in tables or complex charts.

---

## When to Use a KPI Card

### Perfect For:

| Question Type | Example |
|--------------|---------|
| **What is the current value?** | Revenue this month |
| **Is it good or bad vs goal?** | Did we hit our target? |
| **Is it better or worse vs last period?** | Up or down from last week? |
| **Single metric spotlight** | Trial starts today |

### Questions It Answers

- What's happening right now?
- Are we on track?
- Should I be worried or celebrate?
- How does this compare to my benchmark?

### Not Ideal For:

- Showing trend details (use [line chart](./line-chart.md))
- Comparing multiple categories (use [bar chart](./bar-chart.md))
- Understanding distribution (use [histogram](./histogram.md))
- Showing breakdown (use [funnel](./funnel.md) or stacked chart)

---

## KPI Card Anatomy

### Essential Components

| Component | Purpose | Example |
|-----------|---------|---------|
| **Label** | What metric this is | "Monthly Recurring Revenue" |
| **Value + Unit** | The number itself | "₹4.2M" or "24%" |
| **Delta** | Change vs comparison | "+12% WoW" or "-5% vs goal" |
| **Context** | Good/bad indicator | ✓ Goal met / ⚠ Needs attention |

### Optional Components

| Component | When to Add |
|-----------|-------------|
| **Sparkline** | When trend direction matters |
| **Target line** | When showing progress to goal |
| **Comparison period** | When context isn't obvious |

---

## Design Principles: What Makes a Beautiful KPI Card

### 1. Hierarchy Through Size

**The number is the hero:**
- Value: 48-72px font size
- Label: 14-16px font size
- Delta/context: 12-14px font size

The eye should go: Number → Delta → Label

### 2. Use Color Semantically

| Color | Meaning | When to Use |
|-------|---------|-------------|
| **Green** | Positive, on track | Revenue up, churn down |
| **Red** | Negative, alert | Revenue down, errors up |
| **Gray/Black** | Neutral | No comparison or status |
| **Orange/Yellow** | Warning | Close to threshold |

**Never**: Use color just for decoration.

### 3. Context is Mandatory

A raw number is meaningless. Always show:
- **vs Goal**: "Target: $5M"
- **vs Time**: "+12% WoW" (week-over-week)
- **vs Benchmark**: "Industry avg: 3.5%"

### 4. Units Must Be Clear

| Bad | Good |
|-----|------|
| 4.2 | ₹4.2M |
| 24 | 24% conversion |
| 1250 | 1,250 users |

### 5. Show Direction with Arrows

- ↑ or △ for increase
- ↓ or ▽ for decrease
- → for no change

**Pair with color** for accessibility.

---

## Common Issues and How to Fix Them

| Issue | Problem | Fix |
|-------|---------|-----|
| **Too Many KPI Cards** | 15 KPI cards at the top of dashboard — attention is diluted. If everything is important, nothing is important | Limit to 3-5 cards maximum per dashboard · Ask: "If I could only show 3 numbers, what would they be?" · Group related metrics (revenue, profit, margin as one "Revenue Health" card) |
| **No Comparison** | Shows "Revenue: ₹4.2M" with no context. Is this good? Is it growing? No way to know | Always add comparison: "+15% vs last month" · "92% of ₹4.5M goal" · "↑ from ₹3.6M" |
| **Mixing Units Without Clear Labels** | Dashboard shows "4.2M" next to "24" next to "3.5%" — what do these mean? | Clear labels: "Revenue: ₹4.2M" · Unit in value: "24% conversion" · Consistent formatting across all cards |
| **Misleading Deltas** | Shows "+120%" without context — change from 1 to 2.2, not meaningful | Consider absolute change too: "+120% (+1.2 users)" · Add minimum threshold: "Only show % if base > 100" · Or show "Too small to compare" for tiny numbers |
| **Wrong Comparison Period** | Showing "vs yesterday" for metric that's naturally weekly (B2B signups) | Match comparison to metric cadence: Daily ops → vs yesterday/last week · Weekly business → vs last week/month · Monthly revenue → vs last month/year |
| **Color Inversion** | Revenue down shown in green, churn down shown in red | Define semantic meaning first: Revenue ↑ = Green, Revenue ↓ = Red · Churn ↑ = Red, Churn ↓ = Green. The direction alone doesn't determine color — the impact does |

---

## Labeling Best Practices

### Label Formula

**Pattern**: [Metric Name] + [Time Period if not obvious]

| Weak Label | Strong Label |
|------------|--------------|
| "Revenue" | "Monthly Recurring Revenue" |
| "Users" | "Active Users (Last 7 Days)" |
| "Rate" | "Conversion Rate (Trial → Paid)" |

### Delta Format

**Best practices:**
- Include direction: "+12%" not "12%"
- Include comparison: "+12% WoW" (week-over-week)
- Use abbreviations consistently:
  - WoW = week-over-week
  - MoM = month-over-month
  - YoY = year-over-year
  - vs Goal = against target

### Value Formatting

| Metric | Format |
|--------|--------|
| Currency | ₹4.2M (not ₹4,200,000) |
| Large numbers | 1.2K, 45K, 1.2M |
| Percentages | 24.5% (1 decimal usually enough) |
| Rates | 3.2% conversion (include what it's measuring) |

---

## KPI Card Placement on Dashboards

### By Dashboard Persona

| Persona | KPI Cards Shown | Placement |
|---------|-----------------|-----------|
| **[Executives](../dashboard-personas.md#1-founders--executives-strategic-dashboards)** | 3-4 company health metrics | Top, largest size |
| **[Function Heads](../dashboard-personas.md#2-heads-of-productgrowth-tactical--strategic-mix)** | 4-6 function metrics | Top row |
| **[Product Managers](../dashboard-personas.md#3-product-managers--designers-product-analytics)** | 2-3 key metrics | Small cards, not dominating |
| **[Operations](../dashboard-personas.md#6-ops-support-reliability-operational-dashboards)** | 3-5 current state metrics | Prominent, with alerts |

### Layout Rules

**Top Zone** (first 200px of dashboard):
- Place most critical KPIs here
- Use largest font sizes
- Users see this without scrolling

**Grid patterns:**
```
┌──────────┬──────────┬──────────┐
│  KPI 1   │  KPI 2   │  KPI 3   │   ← 3-column for balance
│  Large   │  Large   │  Large   │
└──────────┴──────────┴──────────┘

Or:

┌────────────────┬────────────────┐
│     KPI 1      │     KPI 2      │   ← 2-column for emphasis
│   Extra Large  │  Extra Large   │
└────────────────┴────────────────┘
```

---

## Real-World Examples

### Good Example: Clear Context

**Monthly Recurring Revenue**
```
₹4.2M
+12% vs last month ↑
Target: ₹4.5M (93% achieved)
```

**Why it works:**
- Large value with unit
- Comparison with direction
- Goal context
- Green color for positive trend

### Bad Example: Ambiguous Card

**Revenue**
```
4200000
12
```

**Why it fails:**
- No units (dollars? rupees? users?)
- What does "12" mean?
- No comparison
- No context

### Good Example: Alert Card

**Critical Errors (Last Hour)**
```
24 errors ⚠
+200% vs avg ↑
Threshold: 10
Action: Investigate now
```

**Why it works:**
- Clear alert state
- Shows spike vs normal
- Threshold for context
- Suggests action

---

## Quick Checklist

Before publishing a KPI card:

- [ ] Number is largest element on card
- [ ] Unit is clearly labeled (₹, %, users)
- [ ] Comparison included (vs goal, vs last period)
- [ ] Direction indicator (↑↓ or color)
- [ ] Label is descriptive and unambiguous
- [ ] Time period specified if not obvious
- [ ] Color used semantically (green=good, red=bad for this metric)
- [ ] Card count limited (3-5 max per view)
- [ ] Comparison period makes sense for metric cadence

---

## Summary

The KPI card is deceptively simple:
- **One number**, but never just the number
- Always with **context** (vs goal, vs time)
- Always with **semantic meaning** (good/bad indicator)
- Position matters — **top zone always**

When someone glances at your dashboard for 3 seconds, KPI cards are what they see and remember.

---

## See Also

**Related Charts:**
- [Bar Chart](./bar-chart.md) — When comparing multiple KPIs across categories
- [Line Chart](./line-chart.md) — When showing KPI trend over time
- [Sparkline (Area)](./area-chart.md) — Tiny trend line to add to KPI card

**Dashboard Context:**
- [Executive Dashboards](../dashboard-personas.md#1-founders--executives-strategic-dashboards) — Heavy KPI card usage
- [Operational Dashboards](../dashboard-personas.md#6-ops-support-reliability-operational-dashboards) — Real-time KPI cards
- [Dashboard Design Principles](../intro-to-graphs.md#part-7-dashboard-design-principles) — Where to place KPIs
- [5-Second Rule](../intro-to-graphs.md#the-5-second-rule) — KPI cards enable this

**Related Concepts:**
- [Dashboard Personas](../intro-to-graphs.md#part-9-dashboard-personas---design-for-your-audience) — Different personas need different KPIs
- [Common Design Mistakes](../intro-to-graphs.md#part-5-common-dashboard-design-mistakes)
