# PRD Quality

**Core Principle:** Lead with the problem paragraph, then prove the solution.

---

## The Problem

PRDs often read like feature specs instead of problem statements. The result is a good story with a weak spine: unclear problem, fuzzy metrics, and no guardrails.

---

## The Framework

### Step 1: Problem Paragraph (First)
Answer these in 3-5 sentences:
- Who has the problem?
- What is the pain, in their words?
- Why now?
- How do we know it exists?

### Step 2: Solution Summary (Second)
- What is the smallest viable solution?
- What are we NOT doing?
- What assumptions are we making?

### Step 3: Metrics and Guardrails
- Controllable metrics (what you can move)
- Track-only metrics (what you monitor)
- Guardrails (what must not regress)

---

## Example Problem Paragraph

"New users drop during onboarding because the activation checklist is confusing and asks for data they do not have yet. We see a 22% drop from step 2 to step 3 compared to last quarter, and support tickets reference this issue weekly. If we do not fix it, activation goals for Q3 will miss by 8%."

---

## PRD Checklist

Before sharing, confirm:
- [ ] The problem paragraph is the first section
- [ ] The problem is user-validated (not internal assumptions)
- [ ] Controllable metrics are listed
- [ ] Guardrails are explicit
- [ ] Tradeoffs are acknowledged

---

## Common Mistakes

### Mistake 1: Feature-First Writing
**Problem:** Starting with "We will build..."
**Fix:** Start with the problem and the evidence.

### Mistake 2: Metrics With No Owner
**Problem:** Only listing vanity or team-wide metrics.
**Fix:** Separate what you can influence from what you only track.

### Mistake 3: Missing Guardrails
**Problem:** Success defined without constraints.
**Fix:** Add 1-2 non-negotiables (performance, reliability, trust).

---

## Practice Questions

Before any PRD review:
- [ ] Can I read the problem paragraph alone and still agree this matters?
- [ ] Are metrics split into controllable vs track-only?
- [ ] Are guardrails explicit and measurable?

---

## Next Steps

1. **Apply today:** Rewrite your last PRD to lead with the problem paragraph.
2. **Review:** Add metrics and guardrails before sharing.
3. **Repeat:** Use the checklist for every new doc.

---

## Your Real Examples

> Based on actual feedback: "Story is good, but the spine is weak"

### Example: The 0-100 Activation PRD

**The Situation:**
PRD review for the 0-100 activation feature

**What Happened (Before):**

**The narrative was compelling:**
> "Merchants struggle to get value from our product. They sign up but never send their first push. We need to help them activate faster..."

**But the spine was weak:**
- ❌ No clear definition of "activation" (is it first send? First result? Day 7 retention?)
- ❌ Metrics listed without separating controllable vs track-only
- ❌ No trusted data queries (where do these numbers come from?)
- ❌ V1 scope was fuzzy ("improve onboarding experience")
- ❌ No guardrails (what must not break?)

**The Feedback:**
> "Story is good, but the spine is weak. Missing: Activation definition, Controllable vs uncontrollable metrics, Trusted data queries, Clear v1 scope, Guardrails."

**What to Do Instead (After):**

---

**PROBLEM (Strong Spine)**

> **Who has the problem?** New merchants signing up via paid acquisition channels
>
> **What is the pain?** 40% drop off between "profile complete" and "first campaign created" — they don't understand what campaigns do
>
> **Why now?** Q1 target is 45% activation (currently 32%). Missing target impacts retention pipeline.
>
> **How do we know?**
> - 147 support tickets in Dec mentioning "what is a campaign"
> - User interviews: 8/10 mentioned confusion at this step
> - Funnel data: [link to dashboard query]

---

**ACTIVATION DEFINITION**

| Stage | Definition | Current | Target |
|-------|------------|---------|--------|
| Signup | Account created | 100% | 100% |
| Profile | Business info complete | 78% | 85% |
| Campaign | First campaign created | 52% | 70% |
| **Activated** | First push sent | 31% | 45% |
| Retained | Active at D7 | 65%* | 70% |

*of activated merchants

---

**METRICS**

**Controllable (we directly move these):**
- Profile → Campaign conversion: 66% → 80%
- Campaign → Send conversion: 60% → 65%

**Track-only (we monitor but don't directly control):**
- Signup volume (marketing owns)
- D7 retention (downstream effect)
- Revenue per activated merchant

**Data sources:**
- Dashboard: [link]
- Query: [SQL query link]
- Refresh: Daily at 6am PST

---

**V1 SCOPE (Crisp)**

**In scope:**
1. Guided campaign creation wizard (3 steps)
2. Pre-built templates (5 templates)
3. Contextual tooltips at confusion points

**Out of scope (v2):**
- AI-generated campaign suggestions
- Advanced segmentation in wizard
- Multi-language templates

---

**GUARDRAILS**

| Guardrail | Current | Must Not Fall Below |
|-----------|---------|---------------------|
| Page load time | 1.2s | 2s |
| Support ticket volume | 50/week | 75/week |
| Existing user NPS | 42 | 38 |

---

### The "Weak Spine" Checklist

Before any PRD review, ensure:

**Definition:**
- [ ] Is the key metric defined with a clear, measurable threshold?
- [ ] Can someone else run the same query and get the same number?

**Metrics:**
- [ ] Separated into controllable vs track-only?
- [ ] Each metric has a baseline, target, and owner?
- [ ] Data source linked (dashboard/query)?

**Scope:**
- [ ] V1 scope is a numbered list of specific deliverables?
- [ ] "Out of scope" is explicitly stated?

**Guardrails:**
- [ ] 2-3 metrics that must not regress?
- [ ] Current value and threshold defined?

---

**Remember:** A strong PRD is a crisp problem statement with testable outcomes.
