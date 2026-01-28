# Part 5: Retention & Engagement

## 2-Minute Summary

**The Problem:** Users activate but slowly drift away. You don't notice until it's too late.

**The Solution:** Build retention curves, identify churn predictors, and create engagement loops that bring users back.

**The Framework:** Retention = Habit Formation + Continued Value + Re-engagement

**Quick test:** What's your D30 retention? Can you explain why it's that number?

---

## Why Retention Is Everything

### The Math of Retention

From Shaun Clowes:

> "All of the other stuff—activation, acquisition—none of it matters if you can't retain."

```
┌─────────────────────────────────────────────────────────────┐
│ RETENTION'S COMPOUNDING EFFECT                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Scenario: 1000 signups/month, $10/user/month              │
│                                                             │
│  20% Retention:                                            │
│  Month 1: 1000 users = $10,000                             │
│  Month 6: 1,240 users = $12,400                            │
│  Month 12: 1,245 users = $12,450 (almost flat)             │
│                                                             │
│  40% Retention:                                            │
│  Month 1: 1000 users = $10,000                             │
│  Month 6: 2,520 users = $25,200                            │
│  Month 12: 4,980 users = $49,800 (growing!)               │
│                                                             │
│  2x retention improvement = 4x revenue at month 12         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Understanding Retention Curves

### Anatomy of a Retention Curve

```
100% ─┐
      │╲
      │ ╲          Phase 1: Rapid Drop-Off
      │  ╲         (First few days - normal)
      │   ╲
      │    ╲___________  Phase 2: Flattening
      │                  (If curve flattens = product-market fit)
      │         ________
      │                  Phase 3: Stable
  0% ─┴─────────────────────────────────────────
      D0  D1  D7  D14  D30  D60  D90  D180
```

### Good vs Bad Retention

**GOOD: Flattens above 0%**
```
─────────────────────────────────────────
100%│╲
    │ ╲_______________
    │                  ← Retained users stay
 20%│                     (product-market fit)
  0%│─────────────────────────────────────
```

**BAD: Trends to zero**
```
─────────────────────────────────────────
100%│╲
    │ ╲
    │  ╲
    │   ╲
    │    ╲           ← Everyone eventually leaves
    │     ╲____         (no product-market fit)
  0%│──────────────────────────────────────
```

### Key Retention Metrics

| Timeframe | Definition | Benchmark (B2B SaaS) |
|-----------|------------|---------------------|
| D1 | % back day 1 | > 40% |
| D7 | % back day 7 | > 20% |
| D30 | % back day 30 | > 10% |
| D90 | % back day 90 | > 5% |
| DAU/MAU | Stickiness ratio | > 20% is strong |

---

## Cohort Analysis

### Why Cohorts Matter

From Shaun Clowes:

> "I still don't see people do anywhere near enough cohort analysis. Averages hide everything."

### Building Your Cohort Table

**RETENTION BY SIGNUP COHORT**
```
─────────────────────────────────────────────────────────

              D1      D7      D14     D30     D60
Oct 2025     42%     24%     18%     12%     8%
Nov 2025     45%     27%     21%     15%     10%
Dec 2025     48%     31%     25%     19%     13%  ← Improving!

WHAT TO LOOK FOR:
✓ Are newer cohorts better? (Product improving)
✗ Are newer cohorts worse? (Quality declining)
→ Is there a ceiling? (Product-market fit limit)
```

### Segment Your Cohorts

Don't just look at time—segment by:

**BY ACQUISITION SOURCE:**
```
              D1      D7      D30
Organic      55%     35%     22%
Paid         38%     19%     8%   ← Lower quality
Referral     62%     42%     28%  ← Best quality
```

**BY USER TYPE:**
```
              D1      D7      D30
SMB          45%     25%     15%
Mid-Market   52%     32%     22%
Enterprise   48%     38%     32%  ← Stickier
```

**BY ACTIVATION STATUS:**
```
              D1      D7      D30
Activated    72%     55%     42%  ← This is why activation matters
Not Activated 18%     5%      2%
```

---

## Engagement Metrics

### Leading Indicators of Retention

Find behaviors that predict retention:

**ENGAGEMENT SIGNALS**
```
─────────────────────────────────────────────────────────

Strong predictors of D30 retention:
├── Logged in 3+ days in first week    → 68% D30 retention
├── Used core feature 5+ times         → 72% D30 retention
├── Connected integration              → 75% D30 retention
└── Invited team member                → 82% D30 retention

Weak signals:
├── Viewed settings page               → 15% D30 retention
├── Read help docs                     → 22% D30 retention
└── Changed avatar                     → 18% D30 retention
```

### DAU/WAU/MAU Framework

```
┌─────────────────────────────────────────────────────────────┐
│ ENGAGEMENT DEPTH                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  DAU/MAU RATIO:                                            │
│                                                             │
│  > 50%  = Daily habit product (Slack, social media)        │
│  20-50% = Regular use product (Email tools, analytics)     │
│  10-20% = Periodic use product (Project management)        │
│  < 10%  = Infrequent use (some B2B tools)                 │
│                                                             │
│  Your target depends on your product's natural frequency   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### The L-ness Framework

Measure engagement intensity:

- **L7:** How many days in the last 7 did the user engage?
- **L30:** How many days in the last 30?

**L7 DISTRIBUTION**
```
─────────────────────────────────────────

0 days  ████████████████████████  35%  ← At risk
1-2 days ██████████████            22%  ← Light users
3-4 days ████████████              18%  ← Moderate
5-7 days ████████████████          25%  ← Power users

GOAL: Move users right →
```

---

## Churn Prediction

### Building a Churn Model

Identify signals that predict churn before it happens:

**CHURN RISK SIGNALS**
```
─────────────────────────────────────────────────────────

HIGH RISK (>70% will churn):
├── No login in 14+ days
├── Support ticket open > 7 days
├── Core feature usage dropped 80%+
└── Removed integrations

MEDIUM RISK (40-70% will churn):
├── No login in 7+ days
├── Feature usage down 50%+
├── Haven't used new features
└── Billing issues

LOW RISK (<40% will churn):
├── Usage patterns stable
├── Recently used new features
├── Added team members
└── Upgraded plan
```

### Churn Prevention Workflow

```
┌─────────────────────────────────────────────────────────────┐
│ AUTOMATED CHURN PREVENTION                                  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Risk Signal Detected                                      │
│         │                                                   │
│         ▼                                                   │
│  ┌─────────────────┐                                       │
│  │ Score Risk      │                                       │
│  │ (High/Med/Low)  │                                       │
│  └────────┬────────┘                                       │
│           │                                                 │
│     ┌─────┴─────┐                                          │
│     │           │                                           │
│     ▼           ▼                                           │
│  High Risk   Med/Low Risk                                  │
│     │           │                                           │
│     ▼           ▼                                           │
│  CS Outreach  Automated                                    │
│  (Personal)   Re-engagement                                │
│               Email                                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Re-Engagement Strategies

### Email Sequences

**Day 3 (No return):**
```
Subject: Your [Product] setup is 80% complete

Hey [Name],

You started something great—let's finish it.

[One-click to complete setup]
```

**Day 7 (Inactive):**
```
Subject: Quick win waiting for you

[Name], you're missing out on [specific value].

[Customer] just [achieved result] using [feature].

[Try it now]
```

**Day 14 (At risk):**
```
Subject: We miss you

It's been a while. Here's what's new:
- [New feature 1]
- [New feature 2]

[Come back and explore]
```

### In-App Re-Engagement

**NOTIFICATION STRATEGIES**
```
─────────────────────────────────────────────────────────

1. ACHIEVEMENT UNLOCKS
   "You're 1 away from 100 subscribers!"

2. SOCIAL PROOF
   "15 merchants in your industry sent campaigns today"

3. NEW FEATURE ANNOUNCEMENTS
   "New: Automated welcome series (takes 2 min)"

4. RESULTS HIGHLIGHTS
   "Your last campaign earned $340 - ready for another?"

5. PERSONALIZED TIPS
   "Based on your data, try sending on Tuesdays"
```

---

## Habit Formation

Build features that create natural return loops:

**HABIT LOOP DESIGN**
```
─────────────────────────────────────────────────────────

1. TRIGGER (External → Internal)
   Email reminder → User remembers on their own

2. ACTION (Easy)
   One-click to see results/take action

3. VARIABLE REWARD
   Different insights/results each time

4. INVESTMENT
   User adds data/config → more valuable over time


EXAMPLES:
├── Daily digest email → "See your stats" → Revenue numbers
├── Weekly report → "Review performance" → Insights
└── Milestone notification → "Celebrate win" → Social share
```

---

## Retention Experiments

### High-Impact Tests

1. **Onboarding optimization**
   - Test: Guided tour vs self-serve
   - Measure: D7, D30 retention by variant

2. **Email cadence**
   - Test: Different re-engagement timing
   - Measure: Return rate, unsubscribe rate

3. **Feature adoption nudges**
   - Test: In-app prompts for underused features
   - Measure: Feature adoption, overall retention

4. **Team features**
   - Test: Encourage invites and collaboration
   - Measure: Retention of users with vs without teammates

5. **Success milestones**
   - Test: Celebrate achievements in-app
   - Measure: Engagement depth, emotional connection

### Experiment Template

```markdown
## Retention Experiment: [Name]

**Hypothesis:** If we [change], then [retention metric] will [improve] because [reason].

**Current baseline:**
- D7 retention: ___%
- D30 retention: ___%

**Test design:**
- Control: Current experience
- Variant: [New experience]
- Sample size: ___ users
- Duration: ___ weeks

**Success criteria:**
- D7 retention improves by > ___ percentage points
- No increase in support tickets
- Qualitative feedback positive

**Results:**
[To be filled]
```

---

## Retention Dashboard

### Weekly View

```markdown
## Retention Dashboard: Week of ___

### Headline Metrics
| Metric | This Week | Last Week | Trend |
|--------|-----------|-----------|-------|
| D1 Retention | | | |
| D7 Retention | | | |
| D30 Retention | | | |
| DAU/MAU | | | |

### Cohort Health
| Cohort | D7 | D14 | D30 | Status |
|--------|-----|-----|-----|--------|
| Dec W1 | | | | |
| Dec W2 | | | | |
| Dec W3 | | | | |

### Churn Risk
- High risk users: ___
- Outreach sent: ___
- Saves this week: ___

### Engagement Distribution
- Power users (L7 ≥5): ___%
- Regular users (L7 3-4): ___%
- Light users (L7 1-2): ___%
- Dormant (L7 = 0): ___%
```

---

## Common Retention Mistakes

### Mistake 1: Measuring Too Early
**Wrong:** "Our D7 retention is great!"
**Reality:** D7 doesn't predict long-term retention
**Fix:** Track D30, D60, D90 to see true curve

### Mistake 2: Ignoring Segment Differences
**Wrong:** "Our overall retention is 15%"
**Reality:** Enterprise is 35%, SMB is 8%
**Fix:** Segment everything, optimize per segment

### Mistake 3: Confusing Activity with Value
**Wrong:** "Users log in every day"
**Reality:** They log in but don't use core features
**Fix:** Track engagement with value-creating actions

### Mistake 4: Annoying Users Back
**Wrong:** Spam users with "come back" emails
**Reality:** Aggressive re-engagement causes unsubscribes
**Fix:** Value-first re-engagement, smart frequency

---

## Key Takeaways

- ✅ **Retention is the multiplier** - Everything else compounds on top of it
- ✅ **Cohort analysis reveals truth** - Aggregates hide problems
- ✅ **Predict churn before it happens** - Identify and act on risk signals
- ✅ **Build habit loops** - Natural returns beat forced engagement
- ✅ **Segment everything** - Different users have different retention patterns

---

## Practice Exercise

### Your Retention Audit

1. **Build your retention curve:**
   - D1, D7, D14, D30, D60, D90
   - Does it flatten? At what level?

2. **Segment analysis:**
   - By acquisition source
   - By user type/size
   - By activation status

3. **Churn prediction:**
   - What signals predict churn?
   - How early can you detect risk?

4. **Engagement audit:**
   - What's your DAU/MAU?
   - What behaviors predict retention?

---

## Next Step

**Go to:** Next module `03-Ownership-Execution/` to learn how to own metrics end-to-end.

Or continue with advanced topics in the Data Storytelling module.

---

**Remember:** Retention is the multiplier. Everything else compounds on top of it.
