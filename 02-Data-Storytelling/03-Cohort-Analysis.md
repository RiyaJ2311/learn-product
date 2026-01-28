# Cohort Analysis

**Framework:** Shaun Clowes' approach to understanding user behavior over time.

**Core Principle:** Aggregate metrics hide important patterns. Break down by cohort to understand what's really happening.

---

## The Problem

Aggregate metrics (e.g., "Overall retention is 40%") hide important patterns:
- Are new users different from old users?
- Is retention improving or declining?
- Which cohorts are driving changes?

**Example:**
> "Overall retention is 40%."

**But what if:**
- New user retention is 30% (declining)
- Old user retention is 50% (stable)
- The aggregate hides a problem with new users

---

## The Framework

### Step 1: Define Cohorts
- How are you segmenting users?
- Common cohorts: signup date, acquisition channel, user type, feature usage

### Step 2: Analyze by Cohort
- What's the metric for each cohort?
- How do cohorts compare?
- Which cohorts are driving changes?

### Step 3: Identify Patterns
- Are some cohorts performing better?
- Are some cohorts declining?
- What's driving the differences?

### Step 4: Take Action
- What should we do for underperforming cohorts?
- What can we learn from outperforming cohorts?
- How do we improve overall?

---

## Common Cohort Definitions

### Time-Based Cohorts
**Definition:** Users who signed up in the same period (week, month, quarter)
**Use Case:** Understanding if product changes affect new users differently

**Example:**
- Week 1 cohort: Users who signed up in Week 1
- Week 2 cohort: Users who signed up in Week 2
- Compare retention, engagement, revenue across cohorts

---

### Acquisition Channel Cohorts
**Definition:** Users who came from the same acquisition channel
**Use Case:** Understanding which channels drive better users

**Example:**
- Organic cohort: Users from organic search
- Paid cohort: Users from paid ads
- Referral cohort: Users from referrals
- Compare retention, conversion, revenue across channels

---

### Feature Usage Cohorts
**Definition:** Users who used/didn't use a specific feature
**Use Case:** Understanding feature impact on user behavior

**Example:**
- Feature adopters: Users who used the feature
- Non-adopters: Users who didn't use the feature
- Compare retention, engagement, revenue

---

### User Type Cohorts
**Definition:** Different user segments (free vs paid, power vs casual)
**Use Case:** Understanding how different user types behave

**Example:**
- Free users: Users on free plan
- Paid users: Users on paid plan
- Compare retention, engagement, feature usage

---

## Examples

### Example 1: Retention by Signup Cohort

**Aggregate Metric:**
> "Overall retention is 40%."

**Cohort Analysis:**
- Jan cohort: 45% retention
- Feb cohort: 40% retention
- Mar cohort: 35% retention

**Pattern:**
> "Overall retention is 40%, but it's declining by cohort. Jan cohort has 45% retention, but Mar cohort has only 35%. This suggests our recent changes are hurting new user retention."

---

### Example 2: Conversion by Acquisition Channel

**Aggregate Metric:**
> "Overall conversion is 5%."

**Cohort Analysis:**
- Organic: 7% conversion
- Paid: 3% conversion
- Referral: 8% conversion

**Pattern:**
> "Overall conversion is 5%, but it varies significantly by channel. Referral users convert at 8%, while paid users convert at only 3%. We should optimize our paid channel targeting and invest more in referrals."

---

### Example 3: Engagement by Feature Usage

**Aggregate Metric:**
> "DAU is 10K."

**Cohort Analysis:**
- Feature adopters: 12K DAU (60% of adopters active daily)
- Non-adopters: 8K DAU (40% of non-adopters active daily)

**Pattern:**
> "DAU is 10K, but feature adopters are 50% more engaged. Users who adopt the feature have 60% daily activity vs 40% for non-adopters. We should improve feature discoverability to drive adoption."

---

## Practice Questions

Before analyzing any metric, ask:
- [ ] What cohorts should I analyze?
- [ ] How do cohorts compare?
- [ ] Which cohorts are driving changes?
- [ ] Did I break down by cohort?

---

## Common Mistakes

### Mistake 1: Only Looking at Aggregate
**Problem:** Analyzing only overall metrics.
**Fix:** Always break down by relevant cohorts.

### Mistake 2: Too Many Cohorts
**Problem:** Creating too many cohorts, making analysis confusing.
**Fix:** Focus on 2-3 most relevant cohorts.

### Mistake 3: Wrong Cohort Definition
**Problem:** Using irrelevant cohorts.
**Fix:** Choose cohorts that matter for your question.

### Mistake 4: Not Comparing Cohorts
**Problem:** Showing cohorts but not comparing them.
**Fix:** Always compare cohorts and explain differences.

---

## Cohort Analysis Template

**Metric:** [Name]
**Aggregate Value:** [Value]

**Cohort Breakdown:**
- Cohort 1: [Value] ([%] of total)
- Cohort 2: [Value] ([%] of total)
- Cohort 3: [Value] ([%] of total)

**Pattern:**
- [What patterns do you see?]
- [Which cohorts are performing better/worse?]
- [What's driving the differences?]

**Action:**
- [What should we do for underperforming cohorts?]
- [What can we learn from outperforming cohorts?]
- [How do we improve overall?]

---

## Building the Habit

### Week 1: Awareness
- Before analyzing any metric, ask: "What cohorts should I analyze?"
- Note when you're about to analyze only aggregate
- Catch yourself and break down by cohort

### Week 2: Practice
- Force yourself to analyze by cohort for key metrics
- Create cohort definitions for your key metrics
- Self-grade: Did I break down by cohort?

### Week 3: Refinement
- Make it automatic
- Build cohort tracking for your key metrics
- Continue self-grading

---

## Advanced: Multi-Dimensional Cohorts

For complex analysis, combine multiple cohort dimensions:

**Example:**
- Time-based (signup month) × Acquisition channel
- Feature usage × User type
- Geography × User type

**Use Case:** Understanding how different factors interact

---

## Next Steps

1. **Practice today:** Before your next metric analysis, break down by cohort
2. **Self-grade:** After each analysis
3. **Review:** Combine with `01-Data-Triangulation.md` and `02-Baseline-First.md`

---

**Remember:** Aggregate metrics hide patterns. Cohorts reveal truth.
