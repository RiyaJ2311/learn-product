# Data Triangulation

**Framework:** Shaun Clowes (CPO @ Confluent, ex-Atlassian)

**Core Principle:** Click Left, Right, and Up. Go one click to the left (what happened before), one click to the right (what happened after), and one click up (the metric above).

---

## The Problem

PMs often make decisions from a single data point. This leads to:
- Solving the wrong problem
- Missing root causes
- Making decisions based on noise

**Example:**
> "Conversion dropped 5%. We should fix the checkout flow."

**But what if:**
- Traffic quality changed (upstream/left)?
- Post-conversion metrics changed (downstream/right)?
- The metric one level up (revenue) is actually fine?

---

## The Framework: Click Left, Right, and Up

From Shaun Clowes:

> "Go one click to the left (what happened before), one click to the right (what happened after), and one click up (the metric above). If you still see the thing that tells you the story you want to tell, then now you've got something compelling."

### Step 1: Identify Your Metric
- What metric are you looking at?
- What change did you see?
- What decision are you trying to make?

### Step 2: Click Left (Upstream)
**What happened before this data point?**

**Questions to ask:**
- Where did the users come from?
- What changed in acquisition?
- What changed in activation?
- What changed in the funnel before this?
- What inputs drove this outcome?

### Step 3: Click Right (Downstream)
**What happened after this data point?**

**Questions to ask:**
- What happens after conversion?
- What's the impact on retention?
- What's the impact on revenue?
- Does the effect persist?
- What changed downstream?

### Step 4: Click Up (One Level Up)
**What's the metric that matters above this?**

**Questions to ask:**
- What's the parent metric?
- Is the parent metric also changing?
- Is this change isolated or systemic?
- Does my insight hold at the higher level?

**Example:**
- Your metric: Conversion rate
- One level up: Revenue
- Check: Did revenue also drop, or is it stable?

---

## Examples

### Example 1: Trial Conversion (Real-World Scenario)

**Initial Observation:**
> "Trial conversion is 7.2% this week."

**Without Triangulation:**
- Stakeholder asks: "Is that good or bad?"
- You: "Well... it's about average?"
- Stakeholder: "What was it before? What's driving it?"
- You: "Let me check..." 😬

**With Triangulation:**

**Baseline (Historical):**
- 6.5% baseline three months ago
- Current: 7.2% (up 10.8%)

**Left (Upstream):**
- Email-onboarded users: 9.1% conversion
- Organic users: 5.8% conversion
- Welcome series launched in October (correlates with lift)

**Right (Downstream):**
- Email-onboarded users show 15% higher D30 retention
- Quality is up, not just quantity

**Up (One Level Up):**
- Overall trial-to-paid conversion improving
- Revenue per trial user increasing

**Conclusion:**
> "Trial conversion is 7.2%, up from our 6.5% baseline three months ago. The lift is concentrated in email-onboarded users (9.1%) vs organic (5.8%). This correlates with the welcome series we launched in October. Downstream, these users show 15% higher D30 retention, which means the quality is also up."

**Result:** Stakeholder immediately understands and can make a decision: "Great. Let's double down on email."

---

### Example 2: Conversion Drop

**Initial Observation:**
> "Conversion dropped 5%."

**Triangulation:**

**Upstream:**
- Traffic source changed (more organic, less paid)
- Traffic quality changed (lower intent)
- Acquisition channel mix changed

**Downstream:**
- Post-conversion metrics stable (retention, revenue per user)
- User satisfaction unchanged
- Support tickets unchanged

**One Level Up:**
- Revenue actually increased (more volume, slightly lower conversion)
- Overall business health is fine

**Conclusion:**
> "Conversion dropped 5%, but this is due to traffic mix changes. Revenue is up, and post-conversion metrics are stable. No action needed—this is expected."

---

### Example 2: Engagement Increase

**Initial Observation:**
> "DAU increased 10%."

**Triangulation:**

**Upstream:**
- Acquisition increased (more new users)
- Activation improved (more users completing onboarding)
- Retention improved (more users coming back)

**Downstream:**
- Revenue per user stable
- Feature adoption increased
- Support tickets decreased

**One Level Up:**
- Overall product health improved
- Business metrics improving

**Conclusion:**
> "DAU increased 10% due to improved activation and retention. This is driving better business outcomes. We should double down on what's working."

---

### Example 3: Feature Adoption Low

**Initial Observation:**
> "Feature adoption is only 15%."

**Triangulation:**

**Upstream:**
- Feature discoverability low (users not finding it)
- Onboarding doesn't mention feature
- No prompts or guidance

**Downstream:**
- Users who adopt feature have 20% higher retention
- Users who adopt feature have 30% higher revenue
- Feature solves a real problem

**One Level Up:**
- Overall product health could improve if more users adopt
- This feature is valuable but underutilized

**Conclusion:**
> "Feature adoption is 15%, but users who adopt have 20% higher retention. The problem is discoverability, not value. We should improve onboarding and prompts."

---

## Practice Questions

Before making any data-driven decision, ask:

```
┌─────────────────────────────────────────────────────────────┐
│ LEFT, RIGHT, UP CHECKLIST                                   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ LEFT (Upstream):                                            │
│ □ What happened before this data point?                     │
│ □ What inputs drove this outcome?                          │
│                                                             │
│ RIGHT (Downstream):                                         │
│ □ What happened after?                                     │
│ □ Does the effect persist?                                 │
│                                                             │
│ UP (One Level Up):                                          │
│ □ What's the metric that matters above this?                │
│ □ Does my insight hold at the higher level?                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Common Mistakes

### Mistake 1: Single Data Point Decisions
**Problem:** Making decisions from one metric.
**Fix:** Always check upstream, downstream, and one level up.

### Mistake 2: Ignoring Upstream Changes
**Problem:** Assuming the metric change is isolated.
**Fix:** Always check what feeds into your metric.

### Mistake 3: Ignoring Downstream Impact
**Problem:** Not checking if downstream metrics changed.
**Fix:** Always check what your metric feeds into.

### Mistake 4: Not Checking One Level Up
**Problem:** Optimizing a metric that doesn't matter.
**Fix:** Always check the parent metric.

---

## The Upstream/Downstream Map

For any metric, map:

**Upstream (What feeds into it):**
- Acquisition channels
- Activation metrics
- Previous funnel steps
- User segments

**Your Metric:**
- The metric you're analyzing
- The change you observed

**Downstream (What it feeds into):**
- Next funnel steps
- Retention metrics
- Revenue metrics
- User satisfaction

**One Level Up:**
- Parent metric
- Business outcome
- Strategic goal

---

## Building the Habit

### Week 1: Awareness
- Before sharing any metric, ask: "What's upstream/downstream?"
- Note when you're about to make a single-point decision
- Catch yourself and triangulate

### Week 2: Practice
- Force yourself to check upstream/downstream before every analysis
- Create a mental map for key metrics
- Self-grade: Did I triangulate?

### Week 3: Refinement
- Make it automatic
- Build upstream/downstream maps for your key metrics
- Continue self-grading

---

## Advanced: Multi-Level Triangulation

For complex problems, triangulate at multiple levels:

**Level 1:** Your metric (e.g., conversion)
**Level 2:** Upstream (acquisition, activation)
**Level 3:** Downstream (retention, revenue)
**Level 4:** One level up (business health)
**Level 5:** External factors (market, competition)

---

## Next Steps

1. **Practice today:** Before your next metric share, check upstream/downstream
2. **Self-grade:** After each analysis
3. **Move to:** `02-Baseline-First.md` to add baseline context

---

## Your Real Examples

> Based on actual feedback: "You open the dashboard and leave it open... you have to cut down the paths"

### Example: The Open Dashboard Problem

**The Situation:**
You're analyzing activation metrics. You have the dashboard open with 15 different charts.

**What Happened (Before):**
> Opens dashboard. Looks at activation rate. Looks at retention. Looks at revenue. Looks at cohorts. Looks at channels. Sees some numbers moving. Not sure what to focus on. Shares: "The dashboard shows some interesting patterns..."

**What to Do Instead (After):**

**Step 1: Define the question**
> "Why did Week 1 activation drop from 38% to 32%?"

**Step 2: Check upstream**
> Acquisition channels: Paid traffic up 40%, organic flat
> Traffic quality: Paid merchants have 20% lower intent scores
> → Upstream change identified: traffic mix shifted

**Step 3: Check downstream**
> Week 2 retention: Stable at 65%
> Revenue per activated merchant: Up 5%
> → Downstream healthy for those who activate

**Step 4: One level up**
> Total activated merchants: Actually UP (more volume, lower rate)
> MRR: Stable
> → Business outcome fine

**Conclusion:**
> "Activation rate dropped 6 points due to traffic mix—paid merchants convert lower. But total activations are up because of volume. No action needed on activation; instead, optimize paid targeting for quality."

**Key Takeaway:** Don't stare at dashboards. Pick ONE metric, triangulate it, then move on.

---

### Example: 0-100 Activation Funnel Analysis

**The Situation:**
Preparing data for the 0-100 activation PRD

**What Happened (Before):**
> "Here's the funnel: Signup → Profile → First Campaign → First Send → First Results. The numbers are..."
> (No analysis of WHY each step has drop-off)

**What to Do Instead (After):**

**Funnel with triangulation:**
```
Signup (100) → Profile (78) → First Campaign (52) → First Send (31)
                   ↓              ↓                   ↓
              UPSTREAM       YOUR METRIC          DOWNSTREAM
              (Acquisition)  (Activation)         (Retention)
```

**For each major drop-off, ask:**
1. Profile → Campaign (34% drop): What's upstream? → They don't know what campaigns do
2. Campaign → Send (40% drop): What's downstream? → Merchants who send have 3x retention

**One level up:** Are activated merchants valuable?
> Activated merchants have $45 ARPU vs $12 for inactive → Yes, this matters

**Conclusion:**
> "The biggest lever is Campaign → Send. Merchants who send once have 3x retention. We should focus on reducing friction in the first send, not earlier steps."

---

### The "Cut Down the Paths" Framework

When you open a dashboard:

1. **Write down your question** (literally write it)
2. **Identify the ONE metric** that answers it
3. **Triangulate that metric** (upstream, downstream, one level up)
4. **Close the dashboard** once you have your answer
5. **Don't explore** "interesting patterns" — stay focused

**Red flags you're wandering:**
- You've been in the dashboard for 10+ minutes
- You've looked at 5+ unrelated charts
- You can't summarize your finding in one sentence

---

**Remember:** One data point is a story. Multiple data points are truth.
