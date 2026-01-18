# Funnel Chart: The Complete Guide

**← [Back to Graphs & Dashboard Design](../intro-to-graphs.md)**

The funnel chart answers the most critical product question: "Where do users drop off?" — visualizing sequential step-by-step conversion.

---

## When to Use a Funnel

**Perfect for:**
- Sequential user journeys (signup → verify → activate)
- Conversion paths (visit → trial → pay)
- Drop-off analysis
- Multi-step processes

**Questions it answers:**
- "Where's the biggest leak?"
- "Which step loses most users?"
- "Did our change improve step 2 conversion?"
- "What % make it all the way through?"

**Not ideal for:**
- Non-sequential events
- Parallel paths
- Time-series trends (use [line chart](./line-chart.md))

---

## Design Principles

### 1. Steps Must Be Fixed and Ordered

**Correct sequence:**
```
Visit (100%) →
  Signup (40%) →
    Verify Email (30%) →
      Trial Start (24%) →
        Payment (6%)
```

Each step MUST happen after the previous.

### 2. Show Both Count and Conversion %

| Step | Users | Conversion | Drop-off |
|------|-------|------------|----------|
| Visit | 10,000 | 100% | - |
| Signup | 4,000 | 40% | 60% |
| Verify | 3,000 | 75% of signups | 25% |

**Both metrics matter**:
- Count: Absolute impact
- %: Relative performance

### 3. Highlight the Biggest Leak

Use color or annotation to call out worst-performing step:
- 🔴 **Verify Email: 25% drop** ← Fix this first

### 4. Compare vs Previous Period

| Step | This Week | Last Week | Change |
|------|-----------|-----------|--------|
| Visit → Signup | 40% | 38% | +2% ↑ |
| Signup → Verify | 75% | 70% | +5% ↑ |

---

## Common Issues

### Issue 1: Changing Funnel Definition

**Problem**: Week 1 shows 5 steps, week 2 shows 6 steps

**Fix**: Lock funnel steps. Create new funnel if flow changes.

### Issue 2: Event Logic Mismatch

**Problem**: Step 2 can happen without step 1

**Example**: User goes directly to `/trial` without signing up

**Fix**: Enforce strict sequencing in event logic:
```
Step 2 count = Users who did Step 1 AND Step 2
```

### Issue 3: No Comparison

**Problem**: Shows conversion % but no benchmark

**Fix**: Add comparison:
- vs last period
- vs goal
- vs industry benchmark

---

## Funnel Variations

### Horizontal Funnel

```
[Visit: 10K] → [Signup: 4K] → [Verify: 3K] → [Pay: 600]
    ↓40%          ↓75%           ↓20%
```

**Use when**: Limited vertical space

### Vertical Funnel

```
Visit: 10,000 (100%)
      ↓ 60% drop
Signup: 4,000 (40%)
      ↓ 25% drop
Verify: 3,000 (30%)
      ↓ 80% drop
Pay: 600 (6%)
```

**Use when**: Want to emphasize drop-offs

---

## Labeling Best Practices

### Title Formula

**Pattern**: [Journey Name] Funnel ([Time Period])

Examples:
- "Onboarding Funnel (Last 30 Days)"
- "Trial to Paid Conversion (This Week)"

### Step Labels

- Clear action: "Verify Email" not "Step 2"
- Include count: "Verify Email (3,000)"
- Include %: "Verify Email (75% of signups)"

---

## Placement

**By Dashboard Type:**
- **Executive**: Summary only (top/bottom step)
- **Product**: Critical — full funnel analysis
- **Growth**: Heavy use — acquisition and activation
- **Sales**: Pipeline funnels

**Position**: Drivers zone (central focus)

---

## Quick Checklist

- [ ] Steps are strictly sequential
- [ ] Both count and % shown
- [ ] Biggest drop-off highlighted
- [ ] Comparison included (vs previous, vs goal)
- [ ] Step labels are action-oriented
- [ ] Event logic enforces sequence
- [ ] Time period clearly stated

---

## See Also

- [Bar Chart](./bar-chart.md) — Alternative for non-sequential steps
- [Line Chart](./line-chart.md) — For funnel performance over time
- [Product Dashboards](../dashboard-personas.md#3-product-managers--designers-product-analytics)
- [Growth Analytics](../../04-Growth-Funnel.md)
