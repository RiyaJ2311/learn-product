# Part 4: The Growth Funnel

## 2-Minute Summary

**The Problem:** You optimize individual metrics without seeing how they connect.

**The Solution:** Build a complete funnel view—understand how each stage feeds the next, and where the real leverage is.

**The Framework:** AARRR (Acquisition → Activation → Retention → Revenue → Referral) with quality checks at each stage.

**Quick test:** Can you recite your conversion rate at each funnel stage right now?

---

## The Complete Funnel

```
┌─────────────────────────────────────────────────────────────┐
│ THE GROWTH FUNNEL                                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────┐               │
│  │         ACQUISITION                      │               │
│  │  "How do users find us?"                │               │
│  │  Traffic → Signup                        │               │
│  └────────────────┬────────────────────────┘               │
│                   │ __% convert                            │
│  ┌────────────────▼────────────────────────┐               │
│  │         ACTIVATION                       │               │
│  │  "Do they experience value?"            │               │
│  │  Signup → [Aha Moment]                  │               │
│  └────────────────┬────────────────────────┘               │
│                   │ __% convert                            │
│  ┌────────────────▼────────────────────────┐               │
│  │         RETENTION                        │               │
│  │  "Do they come back?"                   │               │
│  │  D1 → D7 → D30 → D90                    │               │
│  └────────────────┬────────────────────────┘               │
│                   │ __% convert                            │
│  ┌────────────────▼────────────────────────┐               │
│  │         REVENUE                          │               │
│  │  "Do they pay?"                         │               │
│  │  Free → Trial → Paid                    │               │
│  └────────────────┬────────────────────────┘               │
│                   │ __% convert                            │
│  ┌────────────────▼────────────────────────┐               │
│  │         REFERRAL                         │               │
│  │  "Do they bring others?"                │               │
│  │  Invites, Reviews, Word of mouth        │               │
│  └─────────────────────────────────────────┘               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Stage 1: Acquisition

### What It Measures
How users discover and sign up for your product.

### Key Metrics

| Metric | Definition | Benchmark Question |
|--------|------------|-------------------|
| Traffic | Visitors to site/app | Is it growing? |
| Signup Rate | Visitors → Signups | >2-5% is good |
| CAC | Cost per signup | Sustainable? |
| Channel Mix | Where users come from | Diversified? |

### Common Acquisition Channels

**PAID**                    **ORGANIC**               **VIRAL**
├── Google Ads         ├── SEO               ├── Referrals
├── Facebook/Meta      ├── Content           ├── Word of mouth
├── LinkedIn           ├── App Store         ├── Integrations
└── Affiliates         └── Social            └── Embeds

### Acquisition Quality Check

Not all signups are equal:

- **Source matters:** Paid vs organic vs referral
- **Intent matters:** High-intent vs casual browsers
- **Segment matters:** Target ICP vs everyone else

From Shaun Clowes:

> "If you go upstream and find out that this intervention only applies to 2% of the inbound stream, it's meaningless."

---

## Stage 2: Activation

### What It Measures
Whether users experience the core value of your product.

### The "Aha Moment"
The moment when a user first experiences meaningful value.

**Examples:**
- **Slack:** Sending 2000 messages as a team
- **Dropbox:** Uploading first file
- **PushOwl:** First push notification sent (or first revenue attributed?)

### Key Metrics

| Metric | Definition | Why It Matters |
|--------|------------|----------------|
| Activation Rate | % who reach aha moment | Core PLG metric |
| Time to Value | Time from signup to aha | Faster = better |
| Setup Completion | % who complete onboarding | Friction indicator |
| First [Action] | % who do core action | Value indicator |

### Activation Quality Check

From Shaun Clowes:

> "You might find, yep, they last for the second week, but in the third week they all churn. They're basically pointless. Why are we even talking about this?"

**Check downstream:** Do activated users actually retain?

---

## Stage 3: Retention

### What It Measures
Whether users come back and continue using the product.

### Retention Curves

```
100% ─┐
      │╲
      │ ╲
      │  ╲___________  ← Good: Flattens (retained users)
      │   ╲
      │    ╲__________  ← Okay: Slow decline
      │     ╲
      │      ╲
      │       ╲________  ← Bad: Continuous decline
  0% ─┴─────────────────
      D1  D7  D14  D30  D60  D90
```

### Key Metrics

| Metric | Definition | Good Benchmark |
|--------|------------|----------------|
| D1 Retention | % back day 1 | >40% |
| D7 Retention | % back day 7 | >20% |
| D30 Retention | % back day 30 | >10% |
| DAU/MAU | Daily/Monthly ratio | >20% for sticky |

### Retention Cohort Analysis

From Shaun Clowes on the importance of cohorts:

> "I still don't see people do anywhere near enough cohort analysis."

Build retention cohorts:

|         | D1    | D7    | D14   | D30   |
|---------|-------|-------|-------|-------|
| Oct     | 45%   | 28%   | 22%   | 18%   |
| Nov     | 48%   | 31%   | 25%   | 21%   |
| Dec     | 52%   | 35%   | 28%   | 24%   | ← Improving!

### Retention Quality Check

- Are newer cohorts better than older ones?
- Do retained users actually pay?
- Is retention different by segment?

---

## Stage 4: Revenue

### What It Measures
Whether users convert to paying customers.

### Key Metrics

| Metric | Definition | Why It Matters |
|--------|------------|----------------|
| Conversion Rate | Free → Paid | Core business metric |
| Trial Conversion | Trial → Paid | Trial quality indicator |
| ARPU | Revenue per user | Pricing effectiveness |
| LTV | Lifetime value | Unit economics |
| Payback Period | Months to recover CAC | Sustainability |

### Revenue Quality Check

From Shaun Clowes:

> "Let's say an experiment shows a 12% lift in conversions. Step all the way back and go, 'Okay, yes, they convert more, but is their average [revenue] smaller?' Because what we really care about is happy customers paying us money."

**Check the real metric:**

- Not just conversions—revenue
- Not just revenue—LTV
- Not just LTV—margin

---

## Stage 5: Referral

### What It Measures
Whether users bring in other users.

### Key Metrics

| Metric | Definition | Why It Matters |
|--------|------------|----------------|
| NPS | Net Promoter Score | Willingness to refer |
| Viral Coefficient | Users generated per user | Organic growth |
| Invite Rate | % who send invites | Virality potential |
| Invite Conversion | Invites → Signups | Invite quality |

### Referral Loops

```
USER A
   │
   └──→ Invites 3 friends
              │
              ├──→ USER B signs up (33% convert)
              │        │
              │        └──→ Invites 2 friends → USER D
              │
              └──→ USER C signs up
                       │
                       └──→ Invites 1 friend → USER E
```

**Viral Coefficient = Invites × Conversion Rate**

- **<1.0** = Growth requires paid acquisition
- **=1.0** = Sustainable (each user replaces themselves)
- **>1.0** = Viral growth (rare, powerful)

---

## Building Your Funnel Dashboard

### Step 1: Define Each Stage

| Stage | Your Definition | Current Rate |
|-------|----------------|--------------|
| Acquisition | Traffic → Signup | ___% |
| Activation | Signup → [Your Aha] | ___% |
| Retention | D7 retention | ___% |
| Revenue | Trial → Paid | ___% |
| Referral | NPS or Invite rate | ___ |

### Step 2: Identify Biggest Drop-Off

```
Traffic:     100,000 visitors
                ↓ ___% (_____ drop-off)
Signups:     _______
                ↓ ___% (_____ drop-off)
Activated:   _______
                ↓ ___% (_____ drop-off)
Retained D7: _______
                ↓ ___% (_____ drop-off)
Converted:   _______
```

**Biggest lever:** The stage with the biggest drop-off and highest volume.

### Step 3: Triangulate (Shaun's Framework)

For your biggest drop-off:

- **Upstream:** What's driving the drop-off?
- **Downstream:** Do users who pass this stage retain?
- **One level up:** Does fixing this move revenue?

---

## Funnel Prioritization

### Where to Focus

```
┌─────────────────────────────────────────────────────────────┐
│ PRIORITIZATION MATRIX                                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│                    HIGH VOLUME                              │
│                        │                                    │
│   Acquisition ─────────┼───────── Activation               │
│   (if signup rate      │         (FOCUS HERE FIRST)        │
│   is <2%)              │         Most leverage             │
│                        │                                    │
│  ──────────────────────┼──────────────────────────────     │
│                        │                                    │
│   Referral ────────────┼───────── Retention                │
│   (after retention     │         (if activation            │
│   is solid)            │         is >30%)                  │
│                        │                                    │
│                    LOW VOLUME                               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Rule of thumb:

1. **Fix activation first** (it affects everything downstream)
2. **Then retention** (activated users should stick)
3. **Then acquisition** (now you can pour in more users)
4. **Then referral** (multiplier on everything)

---

## Weekly Funnel Review

### Template

```markdown
## Funnel Review: Week of ___

### Metrics vs Last Week
| Stage | This Week | Last Week | Change |
|-------|-----------|-----------|--------|
| Signups | | | |
| Activation Rate | | | |
| D7 Retention | | | |
| Trial Conversion | | | |

### Biggest Change
[What moved the most? Why?]

### This Week's Focus
[Which stage are we optimizing?]

### Experiments Running
[What are we testing?]

### Next Week's Plan
[What will we launch?]
```

---

## Key Takeaways

- ✅ **See the full funnel** - Individual metrics are meaningless without context
- ✅ **Activation is usually the lever** - Fix value delivery first
- ✅ **Quality matters at every stage** - Check downstream effects
- ✅ **Cohort everything** - Aggregates hide the truth
- ✅ **Triangulate always** - Upstream, downstream, one level up

---

## Next Step

**Go to:** `03-Cohort-Analysis.md` for deeper cohort analysis techniques.

Or continue to the next module: `03-Ownership-Execution/`

---

**Remember:** The funnel shows you where to focus. Triangulation shows you if it matters.
