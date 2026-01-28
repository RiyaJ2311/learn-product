# Part 6: Experimentation System

## 2-Minute Summary

**The Problem:** You run experiments but can't tell if they actually worked. Results are noisy, learnings are lost.

**The Solution:** Build a rigorous experimentation system with clear hypotheses, proper measurement, and cumulative learning.

**The Framework:** Hypothesis → Test → Measure → Learn → Iterate

**Quick test:** For your last 3 experiments, can you state exactly what you learned?

---

## Why Experimentation Matters for PLG

From Shaun Clowes:

> "PLG is about many small bets. You need a system to run experiments quickly, measure accurately, and learn continuously."

---

## The Experiment Mindset

```
┌─────────────────────────────────────────────────────────────┐
│ OLD WAY vs NEW WAY                                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  OLD: "Let's launch this feature"                          │
│  → Ships → Gets forgotten → No learning                    │
│                                                             │
│  NEW: "Let's test this hypothesis"                         │
│  → Ships as experiment → Measured → Learning captured     │
│  → Informs next experiment                                 │
│                                                             │
│  Every change is an opportunity to learn.                  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## The Experiment Lifecycle

```
┌─────────────────────────────────────────────────────────────┐
│ EXPERIMENT LIFECYCLE                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. HYPOTHESIS                                              │
│     "If we [change], then [metric] will [improve]          │
│      because [reason]"                                     │
│           │                                                 │
│           ▼                                                 │
│  2. DESIGN                                                  │
│     Control vs Treatment                                   │
│     Sample size, Duration                                  │
│           │                                                 │
│           ▼                                                 │
│  3. RUN                                                     │
│     Launch, Monitor, Wait                                  │
│           │                                                 │
│           ▼                                                 │
│  4. ANALYZE                                                 │
│     Statistical significance?                              │
│     Triangulate results                                    │
│           │                                                 │
│           ▼                                                 │
│  5. DECIDE                                                  │
│     Ship / Iterate / Kill                                  │
│           │                                                 │
│           ▼                                                 │
│  6. DOCUMENT                                                │
│     Learnings captured                                     │
│     Informs next experiment                                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Step 1: Hypothesis Formation

### The Hypothesis Template

**IF** we [specific change]
**THEN** [metric] will [improve by X%]
**BECAUSE** [user behavior/psychology reason]

### Good vs Bad Hypotheses

**Bad:**
> "If we improve onboarding, retention will increase"
> 
> Too vague. What change? How much increase?

**Good:**
> "If we reduce signup fields from 6 to 2, then signup completion will increase by 15% because users abandon long forms"
> 
> Specific change, measurable outcome, clear reasoning

### Hypothesis Quality Checklist

- [ ] Specific change defined
- [ ] Primary metric identified
- [ ] Expected impact quantified (even if estimated)
- [ ] Reasoning based on evidence or insight
- [ ] Falsifiable (can be proven wrong)
- [ ] Time-bound (when will we know?)

---

## Step 2: Experiment Design

### A/B Test Structure

```
┌─────────────────────────────────────────────────────────────┐
│ A/B TEST DESIGN                                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  TRAFFIC SPLIT                                              │
│  ┌─────────────────────┐  ┌─────────────────────┐          │
│  │ Control (50%)       │  │ Treatment (50%)     │          │
│  │ Current experience  │  │ New experience      │          │
│  └──────────┬──────────┘  └──────────┬──────────┘          │
│             │                        │                      │
│             ▼                        ▼                      │
│       [Measure]                [Measure]                    │
│             │                        │                      │
│             └──────────┬─────────────┘                      │
│                        ▼                                    │
│                  [Compare]                                  │
│                        │                                    │
│                        ▼                                    │
│           Statistical Difference?                          │
│           Practical Significance?                          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Sample Size Calculation

**Rule of thumb:** You need enough users to detect the change.

**SAMPLE SIZE FACTORS:**
- Baseline conversion rate (current performance)
- Minimum detectable effect (how small a change matters)
- Statistical significance level (usually 95%)
- Statistical power (usually 80%)

**ROUGH ESTIMATES:**
- 10% baseline, detect 10% relative lift → ~3,000 per variant
- 5% baseline, detect 10% relative lift → ~6,000 per variant
- 2% baseline, detect 10% relative lift → ~16,000 per variant

**Low traffic?** Run longer or accept larger minimum detectable effect.

### Duration Planning

**EXPERIMENT DURATION**
```
─────────────────────────────────────────────────────────

Too Short:
- Not enough sample
- Day-of-week effects missed
- Novelty effect not worn off

Too Long:
- Opportunity cost
- Context changes
- Team loses interest

GUIDELINES:
- Minimum: 1 full week (capture all days)
- Typical: 2-4 weeks
- Maximum: 6 weeks (then re-evaluate)
```

**Always run for full weeks to avoid day-of-week bias.**

---

## Step 3: Running Experiments

### Pre-Launch Checklist

- [ ] Hypothesis documented
- [ ] Success metrics defined
- [ ] Guardrail metrics defined (shouldn't regress)
- [ ] Sample size calculated
- [ ] Duration planned
- [ ] QA completed on both variants
- [ ] Analytics tracking verified
- [ ] Stakeholders informed

### Monitoring During Experiment

**Daily checks:**
- Are both variants receiving traffic?
- Any errors or bugs?
- Any data quality issues?

**Don't do:**
- Peek at results and decide early
- Change the experiment mid-flight
- Call it early because it "looks good"

### Common Running Mistakes

| Mistake | Problem | Fix |
|---------|---------|-----|
| Peeking | Inflates false positives | Set review date upfront |
| Early stopping | Invalid results | Commit to duration |
| Mid-flight changes | Pollutes data | Start new experiment |
| Uneven traffic | Biased results | Monitor split daily |

---

## Step 4: Analysis

### Statistical Significance

**INTERPRETING RESULTS**
```
─────────────────────────────────────────────────────────

p-value < 0.05:
"We're 95% confident the difference is real, not random"

p-value > 0.05:
"We can't be confident the difference isn't random"
→ This doesn't mean no effect—it means inconclusive

IMPORTANT:
- Statistical significance ≠ Practical significance
- A 0.1% lift can be statistically significant but useless
- A 10% lift can be practically significant but not statistically
```

### The Triangulation Check

From Shaun Clowes:

> "Click left, click right, click up. Don't trust any number until you've checked it from multiple angles."

**TRIANGULATION FOR EXPERIMENTS**
```
─────────────────────────────────────────────────────────

Your experiment shows +15% conversion. Verify:

1. UPSTREAM (Click Left):
   - Did traffic quality change?
   - Different mix of acquisition sources?

2. DOWNSTREAM (Click Right):
   - Do converted users retain?
   - Do they actually pay/engage?

3. ONE LEVEL UP (Click Up):
   - Does this move the business metric?
   - Revenue impact, not just conversion?

If all three check out → High confidence
If any don't → Dig deeper
```

### Analysis Template

```markdown
## Experiment Analysis: [Name]

### Summary
- **Result:** Win / Loss / Inconclusive
- **Primary metric:** [X]% lift (p=[X])
- **Recommendation:** Ship / Iterate / Kill

### Results Detail
| Metric | Control | Treatment | Lift | Significance |
|--------|---------|-----------|------|--------------|
| Primary | | | | |
| Secondary | | | | |
| Guardrail | | | | |

### Triangulation
- **Upstream check:** [What we found]
- **Downstream check:** [What we found]
- **Business impact:** [What we found]

### Learnings
1. [Learning 1]
2. [Learning 2]

### Next Steps
- [Action 1]
- [Action 2]
```

---

## Step 5: Decision Framework

### When to Ship

**SHIP when:**
- Primary metric shows significant positive lift
- Guardrail metrics are flat or positive
- Downstream metrics check out
- Qualitative feedback is positive or neutral
- Implementation is clean (no tech debt)

### When to Iterate

**ITERATE when:**
- Direction is right but lift is small
- Some segments win, others don't
- Downstream metrics are concerning
- Good learning but execution needs work
- New hypothesis emerged from data

### When to Kill

**KILL when:**
- Negative lift on primary metric
- Guardrail metrics regressed
- Hypothesis was wrong
- Effort to iterate > expected value
- Better opportunities exist

### The Decision Matrix

```
                    DOWNSTREAM IMPACT
                    Positive    Negative
                 ┌──────────┬──────────┐
         Strong  │  SHIP ✓  │ ITERATE  │
PRIMARY  ────────┼──────────┼──────────┤
LIFT     Weak/   │ ITERATE  │  KILL ✗  │
         None    │          │          │
                 └──────────┴──────────┘
```

---

## Step 6: Documentation & Learning

### The Experiment Log

```markdown
## Experiment Log

| ID | Name | Dates | Hypothesis | Result | Key Learning |
|----|------|-------|------------|--------|--------------|
| 001 | Shorter signup | Jan 1-14 | Fewer fields → more signups | +12% ✓ | Users abandon at field 4 |
| 002 | Email timing | Jan 8-22 | Morning sends → more opens | Inconclusive | Need bigger sample |
| 003 | CTA color | Jan 15-29 | Green → more clicks | -2% ✗ | Color doesn't matter |
```

### Learning Capture Template

```markdown
## Experiment Learning: [Name]

### What We Tested
[Brief description]

### What We Learned
1. **Finding:** [Observation]
   **Implication:** [What this means for future work]

2. **Finding:** [Observation]
   **Implication:** [What this means for future work]

### Surprising Insights
- [Anything unexpected]

### Questions Raised
- [New questions to explore]

### How This Informs Future Work
- [Specific next experiments or decisions]
```

---

## Experimentation Velocity

### Building an Experiment Engine

**EXPERIMENTATION MATURITY LEVELS**
```
─────────────────────────────────────────────────────────

Level 1: Ad-hoc
- Experiments happen randomly
- No consistent process
- Learnings lost

Level 2: Structured
- Clear hypothesis process
- Regular experiment cadence
- Basic documentation

Level 3: Systematic
- Experiment backlog prioritized
- Standard templates & tools
- Learnings inform roadmap

Level 4: Cultural
- Everyone thinks in experiments
- Continuous testing is default
- Institutional learning captured
```

### Experiment Prioritization

**ICE Framework:**

- **Impact:** How much will this move the metric?
- **Confidence:** How sure are we it will work?
- **Ease:** How easy is it to build and run?

| Experiment | Impact | Confidence | Ease | ICE Score |
|------------|--------|------------|------|-----------|
| A          | 8      | 6          | 9    | 7.7       |
| B          | 9      | 4          | 3    | 5.3       |
| C          | 6      | 8          | 8    | 7.3       |

**Run A first** (highest ICE)

### Velocity Targets

**EXPERIMENT CADENCE BENCHMARKS**
```
─────────────────────────────────────────────────────────

Early Stage:
- 2-3 experiments per month
- Focus on big, uncertain bets
- Learn what moves the needle

Growth Stage:
- 4-8 experiments per month
- Mix of big bets and optimizations
- Build experiment muscle

Scale Stage:
- 10+ experiments per month
- Continuous optimization
- Automated testing where possible
```

---

## Common Experiment Types

### Activation Experiments

**EXAMPLES:**
- Onboarding flow changes
- Signup field reduction
- First-use guidance
- Empty state improvements
- Quick win prompts

**METRICS:**
- Activation rate
- Time to value
- Setup completion

### Retention Experiments

**EXAMPLES:**
- Re-engagement emails
- Feature adoption nudges
- Habit loop features
- Milestone celebrations
- Team collaboration prompts

**METRICS:**
- D7, D30 retention
- DAU/MAU
- Churn prediction accuracy

### Conversion Experiments

**EXAMPLES:**
- Pricing page layout
- Trial length changes
- Feature gating
- Upgrade prompts
- Social proof elements

**METRICS:**
- Free → Paid conversion
- Trial → Paid conversion
- Revenue per user

---

## Weekly Experiment Review

### Template

```markdown
## Experiment Review: Week of ___

### Experiments Running
| Name | Started | Status | Early Signals |
|------|---------|--------|---------------|
| | | | |

### Experiments Completed This Week
| Name | Result | Ship/Iterate/Kill | Key Learning |
|------|--------|-------------------|--------------|
| | | | |

### Experiment Pipeline
| Priority | Name | Ready to Launch? |
|----------|------|-----------------|
| 1 | | |
| 2 | | |
| 3 | | |

### Velocity Metrics
- Experiments completed this month: ___
- Win rate: ___%
- Average lift of wins: ___%

### Learnings Applied
[How recent learnings influenced decisions]
```

---

## Key Takeaways

- ✅ **Every change is an experiment** - Build the habit of hypotheses
- ✅ **Statistical rigor matters** - Don't trust noisy results
- ✅ **Triangulate everything** - Check upstream, downstream, one level up
- ✅ **Document learnings** - Institutional memory is valuable
- ✅ **Velocity compounds** - More experiments = faster learning

---

## Practice Exercise

### Your Experimentation Audit

1. **Current state:**
   - How many experiments did you run last month?
   - How many produced actionable learnings?

2. **Process check:**
   - Do you have a hypothesis template?
   - Do you calculate sample size?
   - Do you document learnings?

3. **Improvement plan:**
   - What would double your experiment velocity?
   - What's blocking you from more experiments?

4. **Next experiment:**
   - Write a hypothesis for your biggest opportunity
   - Design the experiment end-to-end

---

## Next Step

**Go to:** Next module `03-Ownership-Execution/` to learn how to own metrics end-to-end.

Or continue with advanced topics in the Data Storytelling module.

---

**Remember:** Every change is an opportunity to learn. Build the system, then scale it.
