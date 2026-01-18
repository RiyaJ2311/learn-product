# Dashboard Personas: Designing for Your Audience

**← [Back to Graphs & Dashboard Design](./overview.md)**

Different people in your organization have different needs from dashboards. Before you build, ask: "Who is this for?" The answer determines everything — from chart types to update frequency to layout.

---

## The Audience Matrix

Quick decision: Does your user have 30 seconds or 30 minutes?

| Persona | Time to Insight | Complexity | Update Speed | Decision Type |
|---------|-----------------|-----------|--------------|---------------|
| **[Executives](#1-founders--executives-strategic-dashboards)** | 30 seconds | Very simple | Weekly/Daily | Strategic |
| **[Function Heads](#2-heads-of-productgrowth-tactical--strategic-mix)** | 2-3 minutes | Medium | Daily | Tactical + Strategic |
| **[Product Managers](#3-product-managers--designers-product-analytics)** | 5-10 minutes | High | Daily | Tactical |
| **[Marketing/Growth](#4-marketing-and-growth-teams-marketing-analytics)** | 3-5 minutes | Medium-High | Daily | Tactical |
| **[Sales/Success](#5-sales--success-teams-gtm-dashboards)** | 2 minutes | Low-Medium | Daily | Operational |
| **[Ops/Support/Reliability](#6-ops-support-reliability-operational-dashboards)** | 10 seconds | Simple | Real-time | Immediate Action |
| **[Analysts/BI](#7-analysts--bi-business-intelligence-dashboards)** | 30+ minutes | Very High | As-needed | Discovery + Reporting |
| **[Customers (External)](#8-customers-external-dashboards)** | 1-2 minutes | Very Simple | Daily/Weekly | Trust + Self-serve |

---

## Persona Deep-Dives

### 1. Founders & Executives: Strategic Dashboards

**Goal**: Understand company health at a glance. Make budget and priority decisions.

**Time to Insight**: 30 seconds

**Update Frequency**: Daily or weekly

**Time Horizon**: Monthly and quarterly views

#### What They Care About

- Is the company healthy? Growing? Profitable?
- Where should we invest next?
- Are we hitting targets?
- What are the biggest risks?

#### Charts & Components They Use

| Component | Purpose | Example | Solves for |
|-----------|---------|---------|------------|
| **[KPI Cards](./graph-types/kpi-card.md)** | At-a-glance metrics | Revenue, Growth %, Churn, NRR | Tracking |
| **[Line Charts](./graph-types/line-chart.md)** | Trend over 6-12 months | Revenue trend, User growth, Churn | Long-term changes |
| **Target vs Actual** | Goal tracking | Revenue target vs actual, NRR goal | Health check |
| **[Bar Charts](./graph-types/bar-chart.md)** | Top drivers | Top regions, top channels, top products | Segment performance |
| **Summary** | Why it matters | "Growth slowed due to X" | Risk identification |


#### Sample Layout

```
┌─────────────────────────────────────────┐
│  COMPANY HEALTH DASHBOARD              │
├─────────────────────────────────────────┤
│ Revenue: $5.2M↑12%  │  Churn: 4.2%↑0.5% │
│ Growth: 23% MoM     │  NRR: 112% ↓1%   │
├─────────────────────────────────────────┤
│   Revenue Trend (6 months)              │
│   [LINE CHART - clean upward trend]     │
├─────────────────────────────────────────┤
│   Top Drivers                           │
│   [BAR CHART: Regions or products]      │
├─────────────────────────────────────────┤
│   Story: Enterprise deals closed $1.2M  │
│           SMB down due to sales staffing│
└─────────────────────────────────────────┘
```

---

### 2. Heads of Product/Growth: Tactical + Strategic Mix

**Goal**: Understand both "what's happening" and "why," plus decide what to work on next.

**Time to Insight**: 2-3 minutes

**Update Frequency**: Daily

**Time Horizon**: Weekly and monthly

#### What They Care About

- Where is the funnel leaking?
- Which segments are healthy?
- Did our changes work?
- What's the biggest opportunity?

#### Charts & Components They Use

| Component | Purpose | Example | Solves for |
|-----------|---------|---------|------------|
| **[KPI Cards](./graph-types/kpi-card.md) + Trends** | Headline + direction | Activation rate + trend line | Performance tracking |
| **[Funnels](./graph-types/funnel.md)** | Identify drop-off | Signup → Verify → Activate → Pay | Conversion bottlenecks |
| **[Cohorts](./graph-types/cohort-retention.md)** | Segment performance | Retention by signup week | Retention trends |
| **[Bar Charts](./graph-types/bar-chart.md)** | Segmentation | New vs Returning, By plan tier | Segment comparison |
| **A/B Test Results** | Experiment outcome | Before/After with confidence | Impact validation |
| **[Top Issues Table](./graph-types/table.md)** | What's breaking | Top error events, top drop-off points | Problem prioritization |
| **[Line Charts](./graph-types/line-chart.md)** | Trends | Activation over time by segment | Change over time |

#### Questions They Ask

- Where did 20% of our users drop off?
- Which segment has best retention?
- Did the onboarding redesign increase activation?
- What are the top error events blocking users?
- Should we prioritize mobile or web?

#### What to Avoid

- ❌ Only showing aggregate KPIs without breakdown
- ❌ Complex calculations people need to understand
- ❌ Missing context (what changed at this date?)
- ❌ Funnel funnels without drop-off highlighting

#### Design Vibe

**"Here's what changed, where, why, and what should we do next"**

- KPI at top with clear context
- One main narrative chart
- Secondary breakdown charts
- Annotations showing important events (launch, change, etc.)
- Clear colors: Green (good), Red (bad), Gray (neutral)

#### Sample Layout

```
┌──────────────────────────────────────────────┐
│  PRODUCT HEALTH DASHBOARD                   │
├──────────────────────────────────────────────┤
│  Activation Rate: 24%↑ (redesign launched)  │
├──────────────────────────────────────────────┤
│  Onboarding Funnel (Last 7 Days)            │
│  [FUNNEL: 1000→800→600→144 with drop %]     │
│  🔴 Verify step: 25% drop-off               │
├──────────────────────────────────────────────┤
│  Activation by Segment                      │
│  [BAR: Free 18%, Paid 31%, Enterprise 45%]  │
├──────────────────────────────────────────────┤
│  Redesign Impact (A/B Test)                 │
│  Control: 20% │ Variant: 24% │ +20% lift   │
├──────────────────────────────────────────────┤
│  Top Issues (This Week)                     │
│  Email verification timeout (340 sessions)  │
│  Payment retry flow failure (156 sessions)  │
└──────────────────────────────────────────────┘
```

---

### 3. Product Managers & Designers: Product Analytics

**Goal**: Diagnose problems, answer "why," and drive product improvements.

**Time to Insight**: 5-10 minutes (exploratory)

**Update Frequency**: Daily

**Time Horizon**: Daily and weekly

#### What They Care About

- Where are users struggling?
- Which segments behave differently?
- Did my change improve the metric?
- What predicts power users?

#### Charts & Components They Use

| Component | Purpose | Example | Solves for |
|-----------|---------|---------|------------|
| **[Funnels](./graph-types/funnel.md)** | Identify drop-off | Multi-step user journeys | Conversion bottlenecks |
| **Feature Adoption** | Who used feature X | Last 7 days, by segment, by plan | Feature usage |
| **[Retention Curves](./graph-types/cohort-retention.md)** | User stickiness | D1, D7, D30 retention by cohort | User retention |
| **[Segmentation Bars](./graph-types/bar-chart.md)** | Behavior by group | Device, region, plan tier, persona | Segment differences |
| **Path/Journey** | What happens next | After first purchase, what do users do? | User flow |
| **[Histogram](./graph-types/histogram.md)** | Distribution | Time-to-activate, session duration | Distribution analysis |
| **[Event Tables](./graph-types/table.md)** | Raw data for debugging | Last 100 sessions, last 100 errors | Debugging |
| **[Scatter Plots](./graph-types/scatter-plot.md)** | Correlations | Engagement vs. retention | Relationship discovery |

#### Questions They Ask

- Where is the biggest drop-off?
- Which segment has the worst experience?
- Did we improve activation after the redesign?
- What behavior predicts long-term retention?
- Which users are at risk of churning?
- Do power users differ in their first session?

#### What to Avoid

- ❌ Aggregate metrics without segmentation
- ❌ Missing drill-down capability
- ❌ Tables with hundreds of rows (too much data)
- ❌ Charts without filters
- ❌ No way to compare segments

#### Design Vibe

**Lots of filters and drill-downs, but organized and scannable.**

- Multiple sections for different questions
- Heavy use of segmentation
- Comparison views side-by-side
- Event tables for detailed analysis
- Download/export capability

#### Sample Layout

```
┌─────────────────────────────────────────────────┐
│  ONBOARDING ANALYTICS DASHBOARD                │
│  Filters: [Plan] [Region] [Device] [Cohort]    │
├─────────────────────────────────────────────────┤
│  Activation Rate: 28% | Sessions: 12,450       │
├─────────────────────────────────────────────────┤
│  Onboarding Funnel (Segmented)                 │
│  [FUNNEL showing Free vs Paid vs Enterprise]    │
│  [Each segment's drop-off highlighted]         │
├─────────────────────────────────────────────────┤
│  Retention by Signup Cohort                    │
│  [LINE CHART: Multiple cohort lines]           │
│  [Week 1 cohorts green, week 2 red]            │
├─────────────────────────────────────────────────┤
│  Time-to-Activate Distribution                 │
│  [HISTOGRAM showing shape of activation time]  │
├─────────────────────────────────────────────────┤
│  Feature Adoption (Last 7 Days)                │
│  [BARS: Mobile editor 34%, Timeline 28%...]    │
├─────────────────────────────────────────────────┤
│  Power Users vs Average (Comparison)           │
│  [SCATTER: Engagement vs Time in app]          │
│  [Power users clearly clustered]               │
├─────────────────────────────────────────────────┤
│  Event Audit Table                             │
│  [TABLE: User ID | Event | Time | Properties] │
│  [Sortable, filterable, searchable]            │
└─────────────────────────────────────────────────┘
```

---

### 4. Marketing and Growth Teams: Marketing Analytics

**Goal**: Optimize spending and pipeline. Which channels work? What's the unit economics?

**Time to Insight**: 3-5 minutes

**Update Frequency**: Daily

**Time Horizon**: Weekly and monthly

#### What They Care About

- Which channel is most efficient?
- What's my cost per acquisition?
- Where is the funnel leaking?
- Should I scale or cut this channel?

#### Charts & Components They Use

| Component | Purpose | Example | Solves for |
|-----------|---------|---------|------------|
| **Channel Performance [Bars](./graph-types/bar-chart.md)** | Spend and efficiency | Meta, Google, SEO, Organic, Referral | Channel comparison |
| **[Trend Lines](./graph-types/line-chart.md)** | Spend and ROI over time | Daily spend, daily leads, daily ROAS | Efficiency trends |
| **CAC/ROAS [Bars](./graph-types/bar-chart.md)** | Unit economics | Cost per acquisition, Return on ad spend | Cost efficiency |
| **[Cohort Retention](./graph-types/cohort-retention.md)** | Value by channel | Retention by acquisition channel | Long-term value |
| **[Funnel](./graph-types/funnel.md) by Channel** | Drop-off by source | Impression → Click → Signup → Paid | Channel conversion |
| **Creative Performance [Table](./graph-types/table.md)** | Which ads work | Ad set, creative, CTR, CVR, CPC | Ad optimization |
| **Geo Breakdown [Bars](./graph-types/bar-chart.md)** | Geographic performance | US, EU, APAC | Market comparison |

#### Questions They Ask

- Which channel has the best ROAS?
- Is spend increasing while ROAS decreasing?
- Which geographic market should we expand?
- What's the lifetime value by channel?
- Should we keep running this campaign?

#### What to Avoid

- ❌ Not showing spend alongside conversions
- ❌ Ignoring long-term value (only showing first-day metrics)
- ❌ Comparing channels with different time horizons
- ❌ Missing unit economics

#### Design Vibe

**Comparison-heavy, efficiency-focused, data-driven.**

- Side-by-side channel comparisons
- Efficiency metrics prominent (CAC, ROAS)
- Sortable tables for "top performers"
- Often includes financial metrics

---

### 5. Sales & Success Teams: GTM Dashboards

**Goal**: Move pipeline forward. Close deals. Prevent churn.

**Time to Insight**: 2 minutes

**Update Frequency**: Daily (updated by sales team)

**Time Horizon**: Current week, current month

#### What They Care About

- What's in my pipeline?
- How healthy is this deal?
- Which accounts will churn?
- What's my win rate?

#### Charts & Components They Use

| Component | Purpose | Example | Solves for |
|-----------|---------|---------|------------|
| **Pipeline [Funnel](./graph-types/funnel.md)** | Deal stages | Leads → Qualified → Negotiation → Closed | Deal progression |
| **Win Rate [Line](./graph-types/line-chart.md)** | Historical trend | Months of win rate | Performance trends |
| **Time-to-Close [Histogram](./graph-types/histogram.md)** | Deal cycle | How long deals take | Sales velocity |
| **Account Health Score** | Risk indicator | Red/yellow/green + trend | Churn risk |
| **Churn Risk [Table](./graph-types/table.md)** | Action-needed | High-risk accounts with reason | Retention actions |
| **Rep Performance [Bars](./graph-types/bar-chart.md)** | Who's closing | Revenue per rep, deal count | Team performance |

#### Questions They Ask

- What's in my pipeline this month?
- Is this account at risk?
- How long will this deal take?
- Who's my top performer?
- What's holding up this deal?

#### What to Avoid

- ❌ Too many filters (sales wants quick action, not exploration)
- ❌ Complex calculations
- ❌ Missing "next step" indication
- ❌ Outdated data

#### Design Vibe

**Action-oriented, very simple, table-heavy.**

- Large cards for critical deals
- Heavy use of alerts (red for risk)
- Easy export to CRM
- Minimal charts, maximum tables

---

### 6. Ops, Support, Reliability: Operational Dashboards

**Goal**: "What is on fire right now?" Take action immediately.

**Time to Insight**: 10 seconds

**Update Frequency**: Real-time or near real-time

**Time Horizon**: Today, last 7 days

#### What They Care About

- Are systems healthy?
- How many tickets in queue?
- Are we meeting SLAs?
- What's the top issue?

#### Charts & Components They Use

| Component | Purpose | Example | Solves for |
|-----------|---------|---------|------------|
| **Status [Cards](./graph-types/kpi-card.md)** | Current state | Queue count, response time | Real-time status |
| **Alerts** | What's breaking | SLA breached, outage, high error rate | Immediate action |
| **[Line Charts](./graph-types/line-chart.md)** | Incident trend | Incidents over last 24h | Trend monitoring |
| **[Bar Charts](./graph-types/bar-chart.md)** | Top issues | Top error categories | Issue prioritization |
| **Live [Tables](./graph-types/table.md)** | Action needed | Tickets in queue, assigned to whom | Task assignment |
| **Status by System** | Green/yellow/red | Service health, dependency health | System health |

#### Questions They Ask

- Are we meeting SLAs?
- How many support tickets in queue?
- What's the current incident status?
- Which system is failing?

#### What to Avoid

- ❌ Anything that requires thinking
- ❌ Historical trends (they need now)
- ❌ Multiple pages (everything on one screen)
- ❌ Unclear colors or symbols

#### Design Vibe

**Fast scanning, strong highlights, minimal thinking.**

- Large red alerts at top
- Current metrics in huge numbers
- One screen — no scrolling
- Refresh every 10-30 seconds
- High contrast colors

#### Sample Layout

```
┌────────────────────────────────────────┐
│  OPERATIONS DASHBOARD (Live)           │
├────────────────────────────────────────┤
│  🟢 API: Healthy  🟡 Email: Slow 🔴 DB: DOWN │
├────────────────────────────────────────┤
│  Support Queue: 24  Avg Response: 8min │
│  🔴 SLA BREACH (5 tickets > 30min)     │
├────────────────────────────────────────┤
│  Top Issues (Last Hour)                │
│  [BAR: Payment timeout 12, Email fail 8] │
├────────────────────────────────────────┤
│  Open Tickets (Action Needed)          │
│  [TABLE with refresh every 30sec]      │
└────────────────────────────────────────┘
```

---

### 7. Analysts & BI: Business Intelligence Dashboards

**Goal**: "Why did this happen?" Deep analysis, answering any question. Defining truth.

**Time to Insight**: 30+ minutes (exploratory, discovery)

**Update Frequency**: As-needed (some data may be scheduled daily)

**Time Horizon**: Any (from real-time to 3 years)

#### What They Care About

- Is our data consistent across tools?
- What's the one source of truth?
- How do metrics relate?
- What changed in the data?

#### Charts & Components They Use

| Component | Purpose | Example | Solves for |
|-----------|---------|---------|------------|
| **Metrics Dictionary** | Definitions | Revenue (ARR, MRR, LTV) | Consistency |
| **Cross-functional Views** | Holistic picture | Revenue + Retention + Product usage | Full context |
| **[Scatter Plots](./graph-types/scatter-plot.md)** | Relationships | CAC vs LTV, Churn vs Support quality | Correlation analysis |
| **[Histograms](./graph-types/histogram.md)** | Distributions | Distribution of customer value | Distribution shape |
| **[Cohorts](./graph-types/cohort-retention.md)** | Segmented trends | Revenue by customer segment | Segment trends |
| **Drill-down Trees** | Hierarchical exploration | Total → Region → Segment → Plan → User | Deep analysis |
| **Financial Views** | Unit economics | MRR, ARR, Churn, Expansion, Logo retention | Business metrics |
| **Forecasting** | Predictions | Revenue forecast with confidence intervals | Future planning |
| **Data Quality [Tables](./graph-types/table.md)** | Trust | Last update time, data freshness, anomalies | Data reliability |

#### Questions They Ask

- Is there a relationship between X and Y?
- Which metric is most predictive?
- How does revenue break down by cohort?
- Where's the data quality issue?
- Can we forecast next quarter?

#### What to Avoid

- ❌ Inconsistent definitions across dashboards
- ❌ Unexplained outliers
- ❌ Missing drill-down capability
- ❌ Data that can't be traced to source
- ❌ Dashboards without update frequency noted

#### Design Vibe

**Consistent, comprehensive, highly reliable.**

- Very clear definitions
- Standardized color scheme across all dashboards
- Notes about data freshness
- Version control for metrics
- Heavy use of drill-downs and filters

---

### 8. Customers (External Dashboards): Self-Serve Analytics

**Goal**: Show customers their performance. Build trust. Reduce support questions.

**Time to Insight**: 1-2 minutes

**Update Frequency**: Daily or weekly

**Time Horizon**: Weekly, monthly, sometimes yearly

#### What They Care About

- How am I using your product?
- Am I getting ROI?
- Can I use this for reporting?
- Is my account healthy?

#### Charts & Components They Use

| Component | Purpose | Example | Solves for |
|-----------|---------|---------|------------|
| **Simple [KPI Cards](./graph-types/kpi-card.md)** | At a glance | Usage, ROI, Performance | Quick summary |
| **[Line Charts](./graph-types/line-chart.md)** | Trend | Usage over time | Usage trends |
| **Simple Breakdown [Bars](./graph-types/bar-chart.md)** | What's driving value | By feature, by team, by project | Value drivers |
| **Health Score** | Is it working? | "You're in the 75th percentile" | Benchmarking |
| **Export Button** | For reporting | CSV, PDF export | Sharing |

#### Questions They Ask

- How much am I using this?
- Am I getting value?
- Can I share this with my boss?
- What's my usage compared to others?

#### What to Avoid

- ❌ Complex product terminology
- ❌ Too many options / filters
- ❌ Explanations of how product works (they know)
- ❌ Needing to log in multiple times
- ❌ Data that contradicts their understanding

#### Design Vibe

**Simple, friendly, trustworthy.**

- Very clean, minimal
- Percentile comparisons ("You're in top 20%")
- Encouraging tone
- Easy export
- Mobile-friendly

#### Sample Layout

```
┌──────────────────────────────────┐
│  YOUR DASHBOARD                  │
├──────────────────────────────────┤
│  This Month                      │
│  Usage: 450 hrs  │  ROI: +$12K   │
├──────────────────────────────────┤
│  Usage Trend                     │
│  [SIMPLE LINE CHART]             │
├──────────────────────────────────┤
│  You're in the 75th percentile   │
│  (Most accounts use 300 hrs)     │
├──────────────────────────────────┤
│  [EXPORT TO PDF]                 │
└──────────────────────────────────┘
```

---

## Decision Tree: What Type of Dashboard Should I Build?

```
START: Who is your primary audience?

  ├─ Founder/Executive?
  │  └─→ STRATEGIC DASHBOARD
  │      • 30 seconds to insight
  │      • 4-6 KPI cards + 2 trend lines
  │      • Monthly view
  │
  ├─ Head of Function (Product/Growth/Sales)?
  │  └─→ TACTICAL-STRATEGIC DASHBOARD
  │      • 2-3 min to insight
  │      • KPIs + Funnels + Cohorts
  │      • Daily updates, weekly review
  │
  ├─ PM, Designer, Marketer?
  │  └─→ ANALYTICAL DASHBOARD
  │      • 5-10 min exploratory
  │      • Multiple segmentations + drill-downs
  │      • Daily + hourly for some metrics
  │
  ├─ Sales, Support, Ops?
  │  └─→ OPERATIONAL DASHBOARD
  │      • 10-30 seconds
  │      • Status + Alerts + Live tables
  │      • Real-time
  │
  ├─ Analyst / BI?
  │  └─→ INTELLIGENCE DASHBOARD
  │      • 30+ min deep dives
  │      • Cross-functional + drill-downs
  │      • Scheduled or exploratory
  │
  └─ Customer?
     └─→ SELF-SERVE DASHBOARD
         • 1-2 min consumption
         • Simple metrics + Export
         • Weekly or daily
```

---

## See Also

**Graph Type Selection by Persona**:
- [Bar Charts](./graph-types/bar-chart.md) — Used by all personas for comparisons and rankings
- [Line Charts](./graph-types/line-chart.md) — Used by all personas for trends
- [Funnels & Bars](./graph-types/bar-chart.md#bar-chart-variations) — Product, Growth, Sales
- [Scatter Plots](./graph-types/scatter-plot.md) — Analysts for correlation analysis
- [Histograms](./graph-types/histogram.md) — Product, Analysts for distributions
- [Area Charts](./graph-types/area-chart.md) — Product, Growth for volume and composition
- [Pie Charts](./graph-types/pie-chart.md) — Executives and Customers for part-to-whole

**Related Dashboard Concepts**:
- [Dashboard Design Principles](./overview.md#part-7-dashboard-design-principles)
- [Dashboard Personas Intro](./overview.md#part-9-dashboard-personas--design-for-your-audience)
- [The 5-Second Rule](./overview.md#the-5-second-rule)
- [Common Dashboard Design Mistakes](./overview.md#part-5-common-dashboard-design-mistakes)
- [Data Storytelling Framework](./overview.md#part-8-data-storytelling-framework)
- [Graph Types Reference](./overview.md#part-6-graph-types-reference)

---

## Quick Reference: Choose Your Template

| I need to build a dashboard for... | Template | Time Investment |
|----------------------------------|----------|-----------------|
| CEO/Board | Strategic Dashboard | High — get it perfect |
| VP of Product | Tactical-Strategic Dashboard | High — iterate monthly |
| Team of PMs | Analytical Dashboard | Medium — iterate weekly |
| Support Queue | Operational Dashboard | Low — template works |
| Customer Success | Operational Dashboard | Low — template works |
| Analytics Team | Intelligence Dashboard | Highest — very custom |
| Customer | Self-Serve Dashboard | Medium — balance simplicity + features |

