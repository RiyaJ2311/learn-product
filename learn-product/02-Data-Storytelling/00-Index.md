# Data Storytelling

Before you share your next metric, ask yourself: "Can I explain why this number matters without anyone asking follow-up questions?" If the answer is no, you're about to present a data point. Not a story.

This module teaches you how to turn isolated numbers into narratives that drive decisions. Based on Shaun Clowes' framework from Atlassian and Confluent, you'll learn to triangulate data, establish baselines, and tell stories that build conviction.

**Your feedback after 6 months of working with data:** "There is no baseline metric... I don't expect this"

That ends here.

---

## What You'll Learn

| Part | Title | Time | When to Use |
|------|-------|------|-------------|
| 01 | [Data Triangulation](./01-Data-Triangulation.md) | 45 mins | Every single time you analyze a metric |
| 02 | [Baseline First](./02-Baseline-First.md) | 30 mins | Before presenting any number |
| 03 | [Cohort Analysis](./03-Cohort-Analysis.md) | 60 mins | When you need to understand user behavior patterns |
| 04 | [Growth Funnel](./04-Growth-Funnel.md) | 60 mins | When building product strategy or finding leverage |
| 05 | [Retention & Engagement](./05-Retention-Engagement.md) | 60 mins | When diagnosing churn or building engagement loops |
| 06 | [Experimentation System](./06-Experimentation-System.md) | 60 mins | When running A/B tests or validating hypotheses |

Total: 5.5 hours of content. Lifetime of better data decisions.

---

## The Problem (You've Lived This)

```
┌─────────────────────────────────────────────────────────────┐
│ THE MEETING YOU WANT TO AVOID                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  You: "Trial conversion is 7.2% this week."                │
│                                                             │
│  Stakeholder: "Is that good or bad?"                       │
│                                                             │
│  You: "Well... it's about average?"                        │
│                                                             │
│  Stakeholder: "What was it before? What's driving it?"     │
│                                                             │
│  You: "Let me check..."                                    │
│                                                             │
│  Stakeholder: 😐 [loses confidence in your analysis]        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

I've been in this meeting. You say a number. They ask three questions you should have answered upfront. You scramble to pull up dashboards. The room gets quiet. Someone else volunteers to "look into it" after the meeting.

Here's what that same meeting looks like when you triangulate your data:

```
┌─────────────────────────────────────────────────────────────┐
│ THE MEETING WHERE YOU SOUND LIKE YOU KNOW WHAT YOU'RE DOING │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  You: "Trial conversion is 7.2%, up from our 6.5% baseline │
│        three months ago. The lift is concentrated in       │
│        email-onboarded users (9.1%) vs organic (5.8%).     │
│        This correlates with the welcome series we launched │
│        in October. Downstream, these users show 15% higher │
│        D30 retention, which means the quality is also up." │
│                                                             │
│  Stakeholder: ✅ "Great. Let's double down on email."      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

Same metric. Different story. One builds conviction, the other erodes trust.

---

## The Framework: Shaun Clowes' Approach to Data

Shaun Clowes (CPO at Confluent, ex-Atlassian) has a simple philosophy about data that changed how I think about metrics. From his Lenny's Podcast episode:

### Data is a compass, not a GPS

> "If you look at data as a way of giving you the answer, you're always wrong. You're always wrong or you're slow... Data is more about disproving whatever you think."

Data doesn't tell you what to build. It tells you whether what you believe is true.

### Click left, right, and up

> "Go one click to the left (what happened before), one click to the right (what happened after), and one click up (the metric above). If you still see the thing that tells you the story you want to tell, then now you've got something compelling."

One data point is a number. Three data points is a story.

### Don't bring a knife to a gunfight

> "If you present data with authority and that data is ridiculous or the analysis is just full of holes, you don't just not get benefit—you lose a whole bunch of brownie points."

Bad data analysis doesn't just waste time. It costs you credibility.

---

## How to Use This Module

### If you have 1 hour: Start with the basics
1. Read [Baseline First](./02-Baseline-First.md) (30 mins)
2. Read [Data Triangulation](./01-Data-Triangulation.md) (45 mins)
3. Apply to your next metric presentation

**Why this order:** Baseline First is the easiest habit to build and the highest ROI. Once you have baselines, triangulation becomes natural.

### If you have 5 hours: Go deep
Work through all 6 parts in order. Each builds on the previous one.

**Week 1:** Data Triangulation + Baseline First
**Week 2:** Cohort Analysis
**Week 3:** Growth Funnel
**Week 4:** Retention & Engagement
**Week 5:** Experimentation System

### If you're about to present data in 10 minutes
Use the quick checklist below. Right now.

---

## Quick Checklist: The 4 Questions

Before you present any metric, answer these:

```
┌─────────────────────────────────────────────────────────────┐
│ DATA STORYTELLING CHECKLIST                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ ✅ BASELINE                                                 │
│    What was this metric last week? Last month? Baseline?   │
│                                                             │
│ ✅ UPSTREAM (Click Left)                                    │
│    What happened before this? What inputs changed?         │
│                                                             │
│ ✅ DOWNSTREAM (Click Right)                                 │
│    What happened after? Does the effect persist?           │
│                                                             │
│ ✅ ONE LEVEL UP                                             │
│    What's the parent metric? Is it also moving?            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

Can't answer all four? Don't present yet. Go find the answers.

---

## What Each Part Teaches You

### [01: Data Triangulation](./01-Data-Triangulation.md)
**The "Click Left, Right, Up" Framework**

Learn Shaun's approach: check what happened before (upstream), what happened after (downstream), and whether the metric one level up confirms your insight.

**You'll learn:**
- How to triangulate any metric in 3 steps
- Why single data points lie
- How to present data with conviction

**Use this when:** Analyzing any metric change

### [02: Baseline First](./02-Baseline-First.md)
**Never Present a Number Without Context**

Establish baselines for every metric. No exceptions. No "let me check." Just data you can trust.

**You'll learn:**
- How to set meaningful baselines
- When to reset baselines
- How to present variance with context

**Use this when:** Presenting any metric to anyone

### [03: Cohort Analysis](./03-Cohort-Analysis.md)
**Understand User Behavior Over Time**

Stop looking at aggregate numbers. Start understanding how different user cohorts behave differently.

**You'll learn:**
- How to build cohort retention curves
- When cohort analysis matters
- How to spot patterns in user behavior

**Use this when:** Diagnosing retention issues or validating product changes

### [04: Growth Funnel](./04-Growth-Funnel.md)
**Map Your Complete User Journey**

Build the AARRR funnel (Acquisition → Activation → Retention → Revenue → Referral). Know your conversion rate at every stage.

**You'll learn:**
- How to build a complete funnel
- Where to find leverage in your funnel
- Which drop-offs actually matter

**Use this when:** Building product strategy or finding growth opportunities

### [05: Retention & Engagement](./05-Retention-Engagement.md)
**Build Products People Come Back To**

Understand retention curves, identify churn predictors, and create engagement loops that stick.

**You'll learn:**
- How to build retention curves
- What predicts churn
- How to create engagement loops

**Use this when:** Building for long-term engagement or diagnosing churn

### [06: Experimentation System](./06-Experimentation-System.md)
**Run Experiments That Actually Teach You Something**

Design rigorous experiments with clear hypotheses, proper measurement, and cumulative learning.

**You'll learn:**
- How to design valid experiments
- When to trust your results
- How to build an experiment log

**Use this when:** Testing product changes or validating hypotheses

---

## You've Mastered This When

**Good signs:**
- ✅ Stakeholders stop asking "is that good or bad?"
- ✅ You can recite your key funnel metrics from memory
- ✅ Your data insights drive immediate decisions
- ✅ You catch yourself triangulating data automatically

**Warning signs:**
- ❌ "What was it before?" gets asked frequently
- ❌ Your insights get challenged in meetings
- ❌ You don't know why a metric moved
- ❌ Stakeholders do their own analysis after yours

If you're seeing warning signs, go back to Baseline First and Data Triangulation. Master those before moving forward.

---

## What Makes This Different

Most data guides teach you SQL or chart types. This module teaches you how to think about data in a way that builds conviction and drives decisions.

**Less focus on:**
- How to write queries
- Which chart type to use
- Dashboard design

**More focus on:**
- What story your data tells
- Whether your insight holds under scrutiny
- How to present data with authority

---

## Prerequisites

**Recommended:** [Module 1: Communication Clarity](../01-Communication-Clarity/) (especially Answer First and Impact Translation)

You can start here without Module 1, but knowing how to structure your thinking makes data storytelling much easier.

---

## What's Next

After mastering Data Storytelling, move to [Module 3: Ownership & Execution](../03-Ownership-Execution/) to learn how to own your metrics week-over-week.

---

## Start Here

**Go to:** [01-Data-Triangulation.md](./01-Data-Triangulation.md)

**Or jump to:**
- [04-Growth-Funnel.md](./04-Growth-Funnel.md) if you want to map your complete funnel first
- [02-Baseline-First.md](./02-Baseline-First.md) if you need the quick win
- [06-Experimentation-System.md](./06-Experimentation-System.md) if you're running experiments now

---

## Cross-References

| Use This With | When |
|---------------|------|
| [Impact Translation](../01-Communication-Clarity/02-Impact-Translation.md) | Presenting data insights to stakeholders |
| [PRD Quality](../04-Product-Strategy/03-PRD-Quality.md) | Writing metrics sections in PRDs |
| [Metric Ownership](../03-Ownership-Execution/02-Metric-Ownership.md) | Tracking and owning metrics weekly |

---

**Remember:** One data point is a story. Multiple data points are truth. The funnel shows you where to focus. And baseline always comes first.
