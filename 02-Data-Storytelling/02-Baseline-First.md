# Part 2: Baseline First

## 2-Minute Summary

**The Problem:** You present metrics without historical context, leaving stakeholders unable to judge if the number is good or bad.

**The Solution:** Never present a metric without its baseline. Before any doc or analysis, establish what "normal" looks like.

**The Framework:**
- Establish baseline before writing any doc
- Always compare current vs baseline
- Explain variance when presenting

**Quick Test:** For your top 3 metrics, can you state the baseline right now?

---

## The Feedback

From your performance review:

> "There is no baseline metric. After 6 months of working with data, I don't expect this."
> "Docs are being written without a proper funnel or baseline metrics."

**This isn't about data skills—it's about discipline.**

---

## What is a Baseline?

A baseline is the reference point that gives context to any number.

```
┌─────────────────────────────────────────────────────────────┐
│ WITHOUT BASELINE                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  "Trial conversion is 7.2%"                                 │
│                                                             │
│  Stakeholder thinks: Is that good? Bad? Should I care?     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

```
┌─────────────────────────────────────────────────────────────┐
│ WITH BASELINE                                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  "Trial conversion is 7.2% vs 6.5% baseline (+11%)"        │
│                                                             │
│  Stakeholder thinks: Great, we're improving.               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Types of Baselines

### 1. Historical Baseline
**What was it before?**

- Last month / quarter / year
- Before a specific change
- Rolling average (last 4 weeks)

**Example:** "Retention is 42%, up from 38% last quarter."

---

### 2. Target Baseline
**What should it be?**

- Company goal
- Industry benchmark
- Model prediction

**Example:** "Retention is 42%, vs our Q1 target of 45%."

---

### 3. Segment Baseline
**What is it for comparable groups?**

- Control group
- Similar cohort
- Industry average

**Example:** "Retention is 42% for new users, vs 55% for returning users."

---

### 4. Benchmark Baseline
**What:** Industry standard or competitor value

**Example:** "Retention is 40% (industry benchmark: 35%, +5% above benchmark)"

---

### 5. Cohort Baseline
**What:** Same cohort in previous period

**Example:** "Week 1 retention is 50% (baseline: 45% for same cohort last month, +5%)"

---

## The Framework

### Step 1: Establish the Baseline
Before analyzing any metric, ask:
- What was the historical value?
- What's the target or benchmark?
- What's normal for this metric?

### Step 2: Show the Change
- What's the current value?
- How does it compare to baseline?
- Is this good or bad?

### Step 3: Provide Context
- Why did it change?
- Is this expected or unexpected?
- What should we do about it?

---

## The Baseline Discipline

### Rule: No Doc Without Baseline Metrics

Before writing any PRD, strategy doc, or analysis:

```
┌─────────────────────────────────────────────────────────────┐
│ PRE-DOC BASELINE CHECKLIST                                  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ □ What are the 3-5 key metrics for this project?           │
│ □ What is the current value of each metric?                │
│ □ What is the historical baseline (last 90 days avg)?      │
│ □ What is the target we're trying to hit?                  │
│ □ How will we measure success vs baseline?                 │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Rule: Always State Baseline When Presenting

Every metric presentation should follow this format:

**[METRIC] is [CURRENT VALUE] vs [BASELINE] ([CHANGE %])**

**Examples:**
- "Trial conversion is 7.2% vs 6.5% baseline (+11%)"
- "Retention is 42% vs 45% target (-7% gap)"
- "MRR is $150K vs $140K last month (+7%)"

---

## Building Your Baseline Muscle

### Step 1: Identify Your Key Metrics

What are the 5-7 metrics you're responsible for?

| Metric | Current | Baseline | Target |
|--------|---------|----------|--------|
| Trial Conversion | ___% | ___% | ___% |
| D7 Retention | ___% | ___% | ___% |
| Activation Rate | ___% | ___% | ___% |
| Revenue (MRR) | $___ | $___ | $___ |
| [Your metric] | ___ | ___ | ___ |

### Step 2: Establish Baselines

For each metric, determine:

- **90-day rolling average** (historical baseline)
- **Same period last year** (seasonality baseline)
- **Target for this quarter** (goal baseline)

### Step 3: Maintain a Baseline Doc

Create a simple doc with:

- Metric name
- Baseline value
- Date established
- How calculated (query or source)

**Update monthly.**

---

## Examples

### Example 1: Metric Increase

**Without Baseline:**
> "DAU increased."

**With Baseline:**
> "DAU is 10K (baseline: 8K last month, +25%). This is above our 9K target. The increase is driven by improved activation from our onboarding changes."

---

### Example 2: Metric Decrease

**Without Baseline:**
> "Conversion dropped."

**With Baseline:**
> "Conversion is 4% (baseline: 5% last week, -20%). This is below our 6% target. The drop started after we changed the checkout flow. We should investigate and potentially roll back."

---

### Example 3: New Metric

**Without Baseline:**
> "Feature adoption is 15%."

**With Baseline:**
> "Feature adoption is 15% (target: 25%, -10% below target). This is our first measurement, so no historical baseline. We're below target and should improve discoverability."

---

## Practice Questions

Before sharing any metric, ask:
- [ ] What's the baseline? (historical, target, or benchmark)
- [ ] How does current compare to baseline?
- [ ] Is this good or bad?
- [ ] Did I include baseline in my communication?

---

## Common Baseline Mistakes

### Mistake 1: No Baseline
**Problem:** Sharing metric without context.
**Fix:** Always establish baseline before sharing.

### Mistake 2: Wrong Baseline
**Problem:** Using irrelevant baseline (e.g., comparing to wrong period).
**Fix:** Use appropriate baseline (historical, target, or benchmark).

### Mistake 3: Baseline Without Context
**Problem:** Showing baseline but not explaining what it means.
**Fix:** Always explain: "This is good/bad because..."

### Mistake 4: Baseline in Head Only
**Problem:** Knowing baseline but not sharing it.
**Fix:** Always include baseline in written and spoken communication.

### Mistake 5: Cherry-Picking the Baseline
❌ "Conversion is up 20% vs last week" (last week was unusually bad)
✅ "Conversion is up 20% vs last week, and +8% vs 90-day average"

### Mistake 6: Forgetting Seasonality
❌ "December signups dropped 30%" (holiday effect)
✅ "December signups dropped 30% vs November, but are flat vs December last year"

### Mistake 7: Using Inconsistent Baselines
❌ Comparing to different time periods in the same doc
✅ Using the same baseline definition throughout

### Mistake 8: Not Having a Baseline at All
❌ "We launched and activation improved" (improved from what?)
✅ "Activation improved from 25% to 32% (+28%)"

---

## The Baseline-First PRD

Your PRDs should include a Baseline Metrics section:

```markdown
## Baseline Metrics

### Primary Metric
- **Metric:** 0-100 store activation rate
- **Current:** 12% (as of Jan 2026)
- **Baseline:** 10% (90-day average)
- **Target:** 20% by end of Q1

### Supporting Metrics
| Metric | Current | Baseline | Target |
|--------|---------|----------|--------|
| Trial start rate | 15% | 14% | 25% |
| D7 retention | 38% | 35% | 45% |
| Time to first value | 5 days | 7 days | 3 days |

### Guardrails (should not regress)
- Overall conversion: >6%
- Support tickets: <50/week
- Page load time: <3s
```

---

## Quick Practice

For your current project, fill in:

**Primary Metric:** _______________
- Current: ___
- Baseline (90-day avg): ___
- Target: ___

**Supporting Metric 1:** _______________
- Current: ___
- Baseline: ___

**Supporting Metric 2:** _______________
- Current: ___
- Baseline: ___

**If you can't fill these in, you're not ready to write the doc.**

---

## Real-World Examples

### Example 1: PRD Without Baselines

**The Situation:**
Writing the 0-100 activation PRD, defining success metrics

**What Happened (Before):**
> **Success Metrics:**
> - Improve activation rate
> - Reduce time to first send
> - Increase retention for new merchants

**The Feedback:**
> "There is no baseline metric. How will we know if we improved? What's the current state?"

**What to Do Instead (After):**
> **Success Metrics:**
> - Activation rate: 32% → 45% (baseline: 32% as of Jan 2024)
> - Time to first send: 72hrs → 24hrs (baseline: 72hrs median)
> - D7 retention for activated merchants: 65% → 75% (baseline: 65%)
>
> **How we'll measure:** Weekly cohort analysis, tracked in [dashboard link]

**Key Takeaway:** Every metric in a PRD needs: current value, target value, and measurement method.

---

### Example 2: Data Discussion Without Context

**The Situation:**
Presenting activation funnel in a strategy meeting

**What Happened (Before):**
> "The activation funnel shows 31% completion rate."

**The Feedback:**
> "After 6 months of working with data, I don't expect this. Is 31% good or bad? What was it before?"

**What to Do Instead (After):**
> "The activation funnel is at 31% completion (baseline: 28% in October, up 3 points). Our target is 45%. We're improving but still 14 points below target. The main blocker is the first-send step, which has 40% drop-off."

**Key Takeaway:** Never present a number without context. Always include baseline + target + interpretation.

---

### The "6 Months" Standard

If you've been working with a metric for more than a few weeks, you should know:

1. **What's the current value?** (e.g., 32%)
2. **What was it 4 weeks ago?** (e.g., 28%)
3. **What was it 12 weeks ago?** (e.g., 25%)
4. **What's the target?** (e.g., 45%)
5. **What's driving the trend?** (e.g., onboarding improvements)

**If you can't answer these without looking at the dashboard, you don't own the metric yet.**

---

## Baseline Checklist

Before any analysis or doc, ensure:
- [ ] Historical baseline (if available)
- [ ] Target baseline (if applicable)
- [ ] Comparison to baseline (current vs baseline)
- [ ] Interpretation (is this good or bad?)
- [ ] Context (why did it change?)

---

## Building the Habit

### Week 1: Awareness
- Before sharing any metric, ask: "What's the baseline?"
- Note when you're about to share without baseline
- Catch yourself and add baseline

### Week 2: Practice
- Force yourself to include baseline in every metric share
- Create baseline references for key metrics
- Self-grade: Did I include baseline?

### Week 3: Refinement
- Make it automatic
- Build baseline tracking for your key metrics
- Continue self-grading

---

## Baseline Documentation Template

For key metrics, document:

**Metric:** [Name]
**Current Value:** [Value]
**Baseline Type:** [Historical/Target/Benchmark]
**Baseline Value:** [Value]
**Change:** [Current vs Baseline]
**Interpretation:** [Good/Bad/Neutral]
**Context:** [Why did it change?]
**Action:** [What should we do?]

---

## Advanced: Multiple Baselines

For important metrics, use multiple baselines:

**Example:**
> "DAU is 10K (baseline: 8K last month, +25%; target: 9K, +11% above target; benchmark: 7K industry avg, +43% above benchmark). We're performing well across all baselines."

---

## Quick Template: Metric Share with Baseline

```
[Metric] is [current value].
├── Baseline: [previous value] ([time period])
├── Target: [target value]
├── Change: [+/- X%] from baseline
├── Interpretation: [good/bad/on track]
└── Reason: [why did it change?]
```

**Example:**
> "Activation rate is 32%.
> - Baseline: 28% (October)
> - Target: 45%
> - Change: +4 points from baseline
> - Interpretation: Improving but below target
> - Reason: New onboarding tooltip increased profile completion"

---

## Key Takeaways

- ✅ **Never present a number without baseline** - It's meaningless without context
- ✅ **Establish baselines before any doc** - Front-load the work
- ✅ **Use consistent baseline definitions** - 90-day average is a good default
- ✅ **Account for seasonality** - Compare to same period, not just previous
- ✅ **Maintain a baseline reference doc** - Know your numbers cold

---

## The Discipline Check

Before any meeting where you'll discuss data, ask yourself:

> **"For every number I mention, can I state the baseline?"**

**If no, you're not prepared.**

---

## Next Steps

1. **Practice today:** Before your next metric share, add baseline
2. **Self-grade:** After each analysis
3. **Move to:** `03-Cohort-Analysis.md` to add cohort context

---

## Next Step

**Go to:** `03-Cohort-Analysis.md`

Learn advanced cohort analysis techniques to segment your insights.

---

**Remember:** No metric without baseline. No baseline without context.
