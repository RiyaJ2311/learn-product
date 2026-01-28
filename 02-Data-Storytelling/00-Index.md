# Module 2: Data Storytelling

## 2-Minute Overview

This module transforms your data presentations from "numbers on a dashboard" to "compelling narratives that drive decisions." Based on Shaun Clowes' framework from Atlassian/Confluent, you'll learn to triangulate data, establish baselines, and tell stories that build conviction.

**Your Feedback:** "There is no baseline metric... after 6 months of working with data, I don't expect this"

**Your Goal:** Every data point tells a complete story with context and conviction

---

## Module Contents

| Part | Title | Time | Priority |
|------|-------|------|----------|
| 01 | Data Triangulation | 45 mins | ⭐⭐⭐⭐⭐ |
| 02 | Baseline First | 30 mins | ⭐⭐⭐⭐⭐ |
| 03 | Cohort Analysis Mastery | 60 mins | ⭐⭐⭐⭐ |
| 04 | The Growth Funnel | 60 mins | ⭐⭐⭐⭐ |
| 05 | Retention & Engagement | 60 mins | ⭐⭐⭐⭐ |
| 06 | Experimentation System | 60 mins | ⭐⭐⭐⭐ |

**Total Time:** ~5.5 hours content + ongoing practice

---

## The Problem

```
┌─────────────────────────────────────────────────────────────┐
│ WHAT YOU DO NOW                                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  You: "Trial conversion is 7.2% this week."              │
│                                                             │
│  Stakeholder: "Is that good or bad?"                       │
│                                                             │
│  You: "Well... it's about average?"                        │
│                                                             │
│  Stakeholder: "What was it before? What's driving it?"     │
│                                                             │
│  You: "Let me check..."                                    │
│                                                             │
│  Stakeholder: 😐 [trust eroding]                            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

```
┌─────────────────────────────────────────────────────────────┐
│ WHAT TOP PMs DO                                             │
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

---

## Key Framework: Shaun Clowes' Data Philosophy

From the Lenny's Podcast episode with Shaun Clowes (CPO, Confluent; ex-Atlassian):

### 1. Data is a Compass, Not a GPS
> "If you look at data as a way of giving you the answer, you're always wrong. You're always wrong or you're slow... Data is more about disproving whatever you think."

### 2. Click Left, Right, and Up
> "Go one click to the left (what happened before), one click to the right (what happened after), and one click up (the metric above). If you still see the thing that tells you the story you want to tell, then now you've got something compelling."

### 3. Don't Bring a Knife to a Gunfight
> "If you present data with authority and that data is ridiculous or the analysis is just full of holes, you don't just not get benefit—you lose a whole bunch of brownie points."

---

## Learning Path

### Week 1: Data Triangulation
- Read `01-Data-Triangulation.md` (45 mins)
- Apply the "Left, Right, Up" framework to your next 3 data points
- Present one data point with full context

### Week 2: Baseline Discipline
- Read `02-Baseline-First.md` (30 mins)
- Establish baselines for your key metrics
- Never present a metric without its baseline

### Week 3+: Cohort Analysis
- Read `03-Cohort-Analysis.md` (60 mins)
- Build a cohort analysis for one key metric
- Present segmented insights to stakeholders

### Week 4: Growth Funnel
- Read `04-Growth-Funnel.md` (60 mins)
- Map your complete funnel (AARRR)
- Identify biggest drop-off and leverage point

### Week 5: Retention & Engagement
- Read `05-Retention-Engagement.md` (60 mins)
- Build retention curves and cohort analysis
- Identify churn predictors and engagement loops

### Week 6: Experimentation System
- Read `06-Experimentation-System.md` (60 mins)
- Design and run one experiment end-to-end
- Document learnings and build experiment log

---

## Quick Reference: The 4 Questions

Before presenting any data, answer:

```
┌─────────────────────────────────────────────────────────────┐
│ DATA STORYTELLING CHECKLIST                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ 1. BASELINE                                                 │
│    □ What was this metric before?                          │
│    □ What's the historical average?                        │
│                                                             │
│ 2. UPSTREAM (Left)                                          │
│    □ What happened before this data point?                 │
│    □ What inputs drove this outcome?                       │
│                                                             │
│ 3. DOWNSTREAM (Right)                                       │
│    □ What happened after?                                  │
│    □ Does the effect persist?                              │
│                                                             │
│ 4. ONE LEVEL UP                                             │
│    □ What's the metric that matters above this?            │
│    □ Does my insight hold at the higher level?             │
│                                                             │
│ 5. FUNNEL CONTEXT                                           │
│    □ Where does this metric fit in the funnel?              │
│    □ What's the conversion rate at each stage?             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Success Metrics

### You've Mastered This When:
- ✅ You never present a number without its baseline
- ✅ Stakeholders don't ask "is that good or bad?"
- ✅ You can explain variance with upstream/downstream context
- ✅ Your data insights drive immediate decisions

### Warning Signs:
- ⚠️ "What was it before?" gets asked frequently
- ⚠️ Your insights get challenged in meetings
- ⚠️ You don't know why a metric moved
- ⚠️ Stakeholders do their own analysis after yours

---

## Module Structure

### 01-Data-Triangulation.md
Shaun Clowes' framework: Always check upstream and downstream metrics. What's the metric one level up?

**Key Question:** What happened upstream/downstream of this data?

### 02-Baseline-First.md
Never analyze without a baseline. No docs without baselines.

**Key Question:** Do I have baseline metrics?

### 03-Cohort-Analysis.md
Use cohort analysis to understand user behavior over time.

**Key Question:** What cohorts are driving this change?

### 04-Growth-Funnel.md
Build a complete funnel view—understand how each stage feeds the next, and where the real leverage is.

**Key Question:** Can you recite your conversion rate at each funnel stage?

### 05-Retention-Engagement.md
Build retention curves, identify churn predictors, and create engagement loops that bring users back.

**Key Question:** What's your D30 retention? Can you explain why it's that number?

### 06-Experimentation-System.md
Build a rigorous experimentation system with clear hypotheses, proper measurement, and cumulative learning.

**Key Question:** For your last 3 experiments, can you state exactly what you learned?

---

## Data Visualization Resources

### Comprehensive Guides
- **[Graphs & Dashboard Design](./data-visualization/intro-to-graphs.md)** - Complete guide covering graph history, analytics tools, dashboard design principles, and data storytelling framework
- **[Dashboard Personas](./data-visualization/dashboard-personas.md)** - Audience-specific dashboard design for 8 personas (Executives, PMs, Growth, Sales, Ops, Analysts, Customers)

### Graph Type Guides

**Core Visualization Types:**
- [KPI Card](./data-visualization/graph-types/kpi-card.md) - Single metric spotlight with delta and context
- [Bar Chart](./data-visualization/graph-types/bar-chart.md) - Comparing categories
- [Grouped Bar Chart](./data-visualization/graph-types/grouped-bar.md) - Side-by-side comparisons within categories
- [Stacked Bar Chart](./data-visualization/graph-types/stacked-bar.md) - Total + composition visualization
- [Line Chart](./data-visualization/graph-types/line-chart.md) - Change over time
- [Area Chart](./data-visualization/graph-types/area-chart.md) - Volume over time
- [Pie Chart](./data-visualization/graph-types/pie-chart.md) - Part-to-whole relationships

**Analytical Visualizations:**
- [Scatter Plot](./data-visualization/graph-types/scatter-plot.md) - Correlation between variables
- [Histogram](./data-visualization/graph-types/histogram.md) - Distribution analysis
- [Heatmap](./data-visualization/graph-types/heatmap.md) - Patterns and intensity over two dimensions

**Product Analytics Charts:**
- [Funnel Chart](./data-visualization/graph-types/funnel.md) - Sequential conversion tracking
- [Cohort/Retention Chart](./data-visualization/graph-types/cohort-retention.md) - User retention over time
- [Table](./data-visualization/graph-types/table.md) - Exact values with search, sort, and export

Each guide includes: when to use, design principles, common mistakes, labeling best practices, and real-world examples.

---

## Prerequisites

**Module 1:** Communication Clarity (Answer First, Impact Translation)

---

## Next Module

After mastering Data Storytelling, move to `03-Ownership-Execution/` to learn how to own your metrics week-over-week.

---

## Start Here

**Go to:** `01-Data-Triangulation.md`

**Or jump to:**
- `04-Growth-Funnel.md` if you want to understand the complete funnel first
- `05-Retention-Engagement.md` if you want to dive deep into retention
- `06-Experimentation-System.md` if you want to build your experiment engine

---

## Cross-References

| Use With | When |
|----------|------|
| [02-Impact-Translation](../01-Communication-Clarity/02-Impact-Translation.md) | Presenting data insights |
| [03-PRD-Quality](../04-Product-Strategy/03-PRD-Quality.md) | Writing metrics sections |
| [02-Metric-Ownership](../03-Ownership-Execution/02-Metric-Ownership.md) | Tracking metrics weekly |

---

**Remember:** One data point is a story. Multiple data points are truth. The funnel shows you where to focus.
