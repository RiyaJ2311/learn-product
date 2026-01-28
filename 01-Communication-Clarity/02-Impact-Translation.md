# Impact Translation

**Core Principle:** Data without meaning is noise. Always translate data -> meaning -> action.

**Framework:** Always say "This means..." and "So we should..."

---

## 2-Minute Summary

**The problem:** Data is shared without business meaning or action.

**The solution:** Always complete the sentence: "This data shows X, which means Y, so we should Z."

**The framework:**
- Data -> What the numbers say
- Insight -> What it means for the business
- Action -> What we should do about it

**Quick test:** After sharing any data, did you say "This means..." and "So we should..."?

---

## The Insight

> "When sharing data, translate it into impact/meaning ('so what?'), not just raw numbers."

> "Data is a compass, not a GPS. It doesn't give you the answer - it tells you if what you think is ridiculous or if there's something there."
> - Shaun Clowes (CPO, Confluent) on Lenny's Podcast

**The gap:** You're giving people the compass reading, but not the direction to walk.

---

## The Problem

PMs often share data without translating it to impact or action. This leaves stakeholders confused about what to do.

**Bad Pattern:**
> "Engagement is up 5%. Retention improved 3%. We're seeing good signals."

**Good Pattern:**
> "Engagement is up 5%. **This means** users are finding value faster. **So we should** double down on the onboarding changes that drove this. Here's what we're seeing..."

---

## The Framework

### Step 1: Share the Data
- What's the metric?
- What's the change?
- What's the baseline?

### Step 2: Translate to Meaning ("This means...")
- What does this data tell us?
- What's the implication?
- Why does this matter?

### Step 3: Translate to Action ("So we should...")
- What should we do about it?
- What decision does this inform?
- What's the next step?

---

## The "So What" Chain

Every data point needs to go through this chain. Keep asking "so what?" until you hit an action.

```
DATA      "Trial starts dropped 20% this week"
  ↓
SO WHAT?  "This means we'll miss our Q1 target by $15K"
  ↓
SO WHAT?  "Which affects our runway by ~2 weeks"
  ↓
SO WHAT?  "So we should revert the pricing page today"
```

---

## The Impact Translation Formula

**Formula:** DATA -> MEANS -> SHOULD

"[DATA POINT], which means [BUSINESS IMPACT], so we should [ACTION]."

**Example 1 (Retention):**
"Retention dropped from 45% to 38%, which means we're losing ~$12K MRR per cohort, so we should prioritize the onboarding fix this sprint."

**Example 2 (Experiment):**
"The experiment has a 12% lift, which means ~500 more trials per month ($25K MRR), so we should roll it out to 100% this week."

**Example 3 (Performance):**
"Page load time increased to 4.2 seconds, which means we're likely losing 15-20% of mobile users at checkout (based on benchmarks), so we should prioritize the performance fix before the sale."

---

## Connecting to What Stakeholders Care About

Different stakeholders care about different impacts. Translate to their language.

| Stakeholder | They care about | Translate to |
| --- | --- | --- |
| CEO/Founder | Revenue, runway, growth rate | "$X impact on MRR" |
| Engineering lead | Technical debt, velocity, reliability | "Saves X hours per sprint" |
| Sales | Pipeline, conversion, deal size | "X more qualified leads" |
| Marketing | CAC, traffic, brand | "Reduces CAC by $X" |
| Finance | Unit economics, margin | "Improves margin by X%" |

**Same data, different audiences**

Data: "Email automation increased activation by 8%"

- CEO: "Email automation increased activation by 8%, adding ~$30K ARR, so we should invest in expanding the automation platform."
- Engineering: "Email automation increased activation by 8%. The implementation is stable, so we should prioritize the API work you proposed."
- Marketing: "Email automation increased activation by 8%, which means CAC payback improved from 14 to 12 months. Let's discuss scaling paid spend."

---

## The Three Levels of Insight

**Level 1: Descriptive (weak)**
What happened: "Signups were down 15% last week."

**Level 2: Diagnostic (better)**
Why it happened: "Signups were down 15% because the landing page experiment reduced form completions."

**Level 3: Prescriptive (best)**
What to do: "Signups were down 15% due to the landing page experiment. We should revert today - the upside ($5K/mo) isn't worth the downside ($20K/mo)."

Always aim for Level 3.

---

## Examples

### Example 1: Trial Conversion Impact (Real Scenario)

**Stakeholder asks:** "What's the impact on trial conversions?"

**Bad (Data Dump):**
> "So we've been tracking this for a few weeks now, and the data shows some interesting patterns. The cohort from October had different behavior than September, and we noticed that email-onboarded users tend to convert at different rates..."

**Good (Impact Translation):**
> "12% lift in trial conversions, adding ~$15K MRR. **This means** our onboarding changes are working. **So we should** scale this to 100% of traffic next week. The effect is stronger for email-onboarded users (18%) vs. organic (8%)."

**Key:** Data -> Meaning -> Action, all in the first response.

---

### Example 2: Positive Metric

**Data:**
> "DAU increased 10% this week."

**Translation:**
> "DAU increased 10% this week. **This means** our new feature is driving daily usage. **So we should** invest more in this area and consider expanding it. Here's what's working..."

---

### Example 3: Negative Metric

**Data:**
> "Conversion dropped 8%."

**Translation:**
> "Conversion dropped 8%. **This means** something broke in our funnel. **So we should** investigate immediately and potentially roll back the recent changes. Here's what we're seeing..."

---

### Example 4: Neutral/Unclear Metric

**Data:**
> "Time to value is 3 days."

**Translation:**
> "Time to value is 3 days. **This means** we're not hitting our 1-day target. **So we should** investigate what's blocking users and prioritize improvements. Here's what we know..."

---

### Example 5: Multiple Metrics (Common PM Scenario)

**Stakeholder asks:** "How's the launch going?"

**Bad (Data Dump):**
> "Engagement is up 5%. Retention improved 3%. We're seeing good signals. Conversion is stable. Revenue is up slightly."

**Good (Impact Translation):**
> "Launch is on track - we're hitting our targets. Engagement is up 5% and retention improved 3%. **This means** users are finding value and sticking around. **So we should** double down on the onboarding changes that drove this. Revenue is up slightly, but conversion is stable - we'll optimize that next."

**Key:** Group related metrics, translate to meaning, then action.

---

## Practice: The Translation Exercise

Complete the chain for each data point:

**Template:**
```
DATA:   [What the numbers say]
MEANS:  [What this implies for the business]
SHOULD: [What action we should take]
```

**Exercise 1**
DATA: "Average session duration dropped from 4 mins to 2.5 mins"
MEANS: __________
SHOULD: __________

<details>
<summary>Example answer</summary>

MEANS: "Users aren't finding value quickly enough, which likely means lower conversion (engagement correlates with 2x higher trial conversion)."
SHOULD: "We should investigate where users are dropping off and prioritize time-to-value improvements in the backlog."

</details>

**Exercise 2**
DATA: "Support tickets increased 40% after the new feature launch"
MEANS: __________
SHOULD: __________

<details>
<summary>Example answer</summary>

MEANS: "Users are confused by the new UI, which will increase churn if not addressed (each support ticket correlates with 15% higher churn risk)."
SHOULD: "We should add an in-app tutorial before EOW and consider a targeted email to users who've submitted tickets."

</details>

---

## Practice Questions

Before sharing any data, ask:
- [ ] What does this data mean? ("This means...")
- [ ] What should we do about it? ("So we should...")
- [ ] Did I translate data to impact and action?

---

## Common Pitfalls (and Fixes)

### Pitfall 1: Stopping at the data
**Bad:** "Conversions are up 5%."
**Fix:** "Conversions are up 5%, which means we're on track to hit Q1 target. No action needed - just continue monitoring."

### Pitfall 2: Vague impact
**Bad:** "This is significant for the business."
**Fix:** "This adds ~$10K MRR, which is 5% of our Q1 target."

### Pitfall 3: Missing the stakeholder's frame
**Bad:** "This improves code quality significantly."
**Fix (to CEO):** "This reduces bugs by 30%, which means fewer support tickets and ~8 hours/week saved - about $2K/month in engineering time."

### Pitfall 4: Action that's too vague
**Bad:** "We should look into this."
**Fix:** "We should run a 2-week experiment starting Monday to validate this."

---

## Combining with Answer First

```
1. ANSWER FIRST
   "Trial conversions are up 12%."

2. IMPACT TRANSLATION
   "This means we're adding ~$15K MRR per month, putting us on track to hit Q1 target."

3. EVIDENCE (if needed)
   - Control: 7.1% conversion
   - Variant: 8.2% conversion
   - Sample: 4,000 users (95% confidence)

4. RECOMMENDATION
   "So we should roll out to 100% this week."
```

---

## Daily Practice

This week's challenge: every time you share data, pause before hitting send.

- Did I complete the "means -> should" chain?
- If not, add it.

Track your success:

Day 1: __ / __ messages had impact translation
Day 2: __ / __ messages had impact translation
Day 3: __ / __ messages had impact translation

Goal: 100% of data shares include impact + action by end of week.

---

## Key Takeaways

- Never share data alone - always add "which means" and "so we should"
- Keep asking "so what?" until you reach an action
- Translate to their language (revenue, time, CAC, margin)
- Be prescriptive - recommend, don't just describe
- Quantify impact whenever possible

---

## Checklist Before Sharing Data

- [ ] Did I complete the DATA -> MEANS -> SHOULD chain?
- [ ] Is the impact quantified (or explained why not)?
- [ ] Is my recommendation specific and time-bound?
- [ ] Am I speaking in the stakeholder's language?
- [ ] Did I answer first, then provide evidence?

---

## Quick Checklist

```
┌─────────────────────────────────────────────────────────────┐
│ IMPACT TRANSLATION CHECKLIST                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ Before sharing data:                                        │
│ □ What's the metric?                                        │
│ □ What's the change?                                        │
│ □ What's the baseline?                                      │
│                                                             │
│ After sharing data:                                         │
│ □ Did I say "This means..."?                                │
│ □ Did I say "So we should..."?                             │
│ □ Is my recommendation specific?                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## The Pattern in Different Contexts

### In Written Updates
**Structure:**
1. Data point
2. "This means..." (impact)
3. "So we should..." (action)
4. Supporting details

### In Presentations
**Structure:**
1. Slide: Data visualization
2. Slide: "This means..." (implications)
3. Slide: "So we should..." (recommendations)

### In Meetings
**Structure:**
1. Share data
2. Pause: "This means..."
3. Pause: "So we should..."
4. Discuss details

---

## Self-Grading Rubric

After sharing data, grade yourself:

**A:** Shared data, meaning, and action. Stakeholders understood and acted.
**B:** Shared data and meaning, but action was unclear. Minor follow-up needed.
**C:** Shared data and meaning, but no action. Stakeholders asked "So what?"
**D:** Shared only data. Stakeholders confused about implications.
**F:** Shared data without context. No one understood what to do.

---

## Building the Habit

### Week 1: Add "This means..."
- After every data point, force yourself to say "This means..."
- Practice explaining implications
- Self-grade: Did I translate data to meaning?

### Week 2: Add "So we should..."
- After every "This means...", add "So we should..."
- Practice recommending actions
- Self-grade: Did I translate meaning to action?

### Week 3: Make It Natural
- Combine both seamlessly
- Make it conversational
- Continue self-grading

---

## Advanced: Multi-Level Translation

For complex data, translate at multiple levels:

**Data:** "Feature adoption is 15%"
**Level 1 (Direct):** "This means 15% of users tried the feature."
**Level 2 (Impact):** "This means we're not hitting our 25% target."
**Level 3 (Action):** "So we should investigate why adoption is low and improve discoverability."

---

## Next Steps

1. **Practice today:** In your next data share, add "This means..." and "So we should..."
2. **Self-grade:** After each communication this week
3. **Move to:** `03-Self-Grading.md` to build feedback loops

---

## Your Real Examples

> Based on actual feedback: "When sharing data, translate it into impact/meaning ('so what?'), not just raw numbers"

### Example: Retention Data Share

**The Situation:**
Weekly sync: sharing retention metrics with leadership

**What Happened (Before):**
> "Week 1 retention is 45%. Week 4 retention is 32%. We're also tracking 7-day active users which is at 28%. The cohort from last month shows some variation. Here's the dashboard..."

**What to Do Instead (After):**
> "Week 1 retention dropped from 48% to 45%. **This means** our onboarding changes hurt first-week engagement. **So we should** roll back the tooltip changes and A/B test a simpler approach. Here's the breakdown by cohort..."

**Key Takeaway:** Don't leave stakeholders to interpret raw numbers. Tell them the "so what."

---

### Example: Activation Metrics Update

**The Situation:**
Sharing 0-100 activation funnel data in PRD review

**What Happened (Before):**
> "The funnel shows: 100 signups -> 78 complete profile -> 52 first campaign -> 31 first send. We've been tracking this for 3 weeks."

**What to Do Instead (After):**
> "We're losing 40% of merchants between profile completion and first campaign. **This means** the integration step is too complex - merchants don't know what to do next. **So we should** add a guided setup wizard with default templates. This could recover 15-20 merchants per week."

**Key Takeaway:** Every data point should end with an action recommendation.

---

### The "Fluff Reduction" Test

> Feedback: "Reduce English and fluff; increase clarity and precision"

**Before:** "We've been looking at the data, and it's really interesting to see how things have evolved. There are definitely some areas where we could potentially improve, and the team has been thinking about various approaches."

**After:** "Activation dropped 8%. Root cause: integration friction. Fix: guided setup wizard. Expected lift: 15%."

**Key Takeaway:** Every sentence should add new information. If it doesn't, delete it.

---

**Remember:** Data -> Meaning -> Action. Always translate.
