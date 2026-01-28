# Scenario-Based Practice Exercises

Practice PM skills with realistic scenarios. Each exercise targets specific feedback themes.

---

## How to Use This

1. **Read the scenario** (don't skip ahead)
2. **Write your response** before looking at the answer
3. **Compare** to the example answer
4. **Grade yourself** using the rubric
5. **Track progress** at the bottom

---

## Module 1: Communication Clarity

### Exercise 1.1: Answer First

**Scenario:**
You're in a weekly sync with your manager. They ask: "What's happening with the activation rate?"

You know:
- Current activation: 32%
- Last week: 35%
- Target: 45%
- Main drop is in the "first campaign" step
- Paid acquisition cohort is 15% lower than organic

**Write your response (2-3 sentences max):**

_________________________________
_________________________________
_________________________________

<details>
<summary>Example Answer</summary>

> "Activation dropped from 35% to 32% this week. The drop is from paid acquisition—they're converting 15% lower than organic at the 'first campaign' step. I'm investigating if it's a targeting issue or onboarding friction."

**Key elements:**
- Answer first: gave the number immediately
- Context: explained where the drop is
- Next step: stated what you're doing about it

</details>

**Self-grade:**
- [ ] Did I give the number in the first sentence?
- [ ] Did I explain the "why" briefly?
- [ ] Did I avoid unnecessary context?

---

### Exercise 1.2: Impact Translation

**Scenario:**
You need to share experiment results in Slack. Here's your data:
- Variant A: 12% conversion (was 10% baseline)
- Sample size: 5,000 users
- Statistical significance: 95%
- ARPU: $45/month

**Write your Slack message:**

_________________________________
_________________________________
_________________________________
_________________________________

<details>
<summary>Example Answer</summary>

> "📊 Experiment Results: Onboarding Wizard
>
> **Result:** 12% conversion vs 10% baseline (+20% lift)
>
> **This means:** ~100 more activated merchants/month at $45 ARPU = $4,500 additional MRR
>
> **So we should:** Roll out to 100% this week. Sample: 5K users, 95% confidence.
>
> Objections by EOD Thursday, otherwise shipping Friday."

**Key elements:**
- Data first
- "This means" with business impact
- "So we should" with specific action
- Timeline for objections

</details>

---

### Exercise 1.3: The Adjacent Question Trap

**Scenario:**
Leadership asks: "Should we prioritize the TikTok integration?"

You've done research and know:
- 3 of top 10 merchants requested it
- Competitor A launched it 2 months ago
- Estimated 2-sprint effort
- TikTok engagement is 40% higher than Instagram
- But it's not in Q1 roadmap

**Write your response:**

_________________________________
_________________________________
_________________________________

<details>
<summary>Example Answer</summary>

> "Yes, we should prioritize it for Q2. Three of our top 10 merchants requested it, and Competitor A already launched it. TikTok content gets 40% higher engagement. It's a 2-sprint effort—I recommend we slot it after the activation work in Q1."

**Key elements:**
- Answered yes/no first
- Gave the reason (merchant demand + competitive)
- Acknowledged the constraint (not in Q1)
- Proposed timing

**NOT this:**
> "So TikTok has been growing a lot, and we've seen some interesting patterns with engagement. The technical complexity is moderate, and some merchants have asked about it..."

</details>

---

## Module 2: Data Storytelling

### Exercise 2.1: Data Triangulation

**Scenario:**
You see in your dashboard: "Conversion dropped 8% this week."

Before presenting this to anyone, what 3 questions do you need to answer?

**Write your questions:**

1. LEFT (upstream): _________________________________
2. RIGHT (downstream): _________________________________
3. UP (one level up): _________________________________

<details>
<summary>Example Answer</summary>

1. **LEFT (upstream):** What changed in traffic sources? Did traffic quality change? Did acquisition mix shift?

2. **RIGHT (downstream):** Did post-conversion metrics change? Is retention for converted users stable? Are revenue metrics affected?

3. **UP (one level up):** Did total revenue change, or just the rate? Is the business outcome actually impacted?

**Why this matters:**
- If traffic mix changed (upstream), the conversion drop might be expected
- If downstream metrics are stable, the quality is fine
- If revenue is up (one level up), maybe no action needed

</details>

---

### Exercise 2.2: Baseline First

**Scenario:**
You're writing a PRD for improving the onboarding flow. You need to define success metrics.

**Bad version (fix this):**
> "Success Metrics:
> - Improve activation rate
> - Reduce time to first send
> - Increase retention"

**Rewrite with proper baselines:**

_________________________________
_________________________________
_________________________________
_________________________________
_________________________________

<details>
<summary>Example Answer</summary>

> **Success Metrics:**
>
> | Metric | Current (Baseline) | Target | How We'll Measure |
> |--------|-------------------|--------|-------------------|
> | Activation rate | 32% (Jan 2024) | 45% | Weekly cohort, [dashboard] |
> | Time to first send | 72 hrs median | 24 hrs | P50 by cohort week |
> | D7 retention (activated) | 65% | 75% | Cohort analysis, [query] |
>
> **Guardrails (must not regress):**
> - Support tickets: <75/week (current: 50)
> - Page load time: <2s (current: 1.2s)

</details>

---

### Exercise 2.3: The Open Dashboard Problem

**Scenario:**
Your manager asks: "Why is retention down?"

You open your dashboard and see 15 charts. You're tempted to explore...

**What should you do instead? Write the steps:**

1. _________________________________
2. _________________________________
3. _________________________________
4. _________________________________

<details>
<summary>Example Answer</summary>

1. **Write down the exact question:** "Why did D7 retention drop from 65% to 58%?"

2. **Identify ONE metric to triangulate:** D7 retention, specifically for the cohort where the drop occurred

3. **Check LEFT, RIGHT, UP:**
   - LEFT: What cohort is this? What acquisition channel? What onboarding path?
   - RIGHT: Did D30 also drop? Is revenue per retained user stable?
   - UP: Is overall MRR affected?

4. **Close the dashboard** once you have the answer. Write it in one sentence.

**Example answer:**
> "D7 retention dropped 7 points because the Jan paid cohort had 40% lower retention than organic—likely a targeting issue upstream, not an onboarding issue."

</details>

---

## Module 3: Ownership & Execution

### Exercise 3.1: Permission Audit

**Scenario:**
List 3 things you're currently waiting on. For each, assess if you actually need permission.

| What I'm waiting on | Do I actually need permission? | What would I do as CEO? |
|---------------------|-------------------------------|------------------------|
| 1. _________________ | Yes / No | _________________ |
| 2. _________________ | Yes / No | _________________ |
| 3. _________________ | Yes / No | _________________ |

**Common "fake blockers" to check yourself against:**
- [ ] Waiting for approval to update a doc I own
- [ ] Waiting for feedback to ship a low-risk experiment
- [ ] Waiting for validation to share data publicly
- [ ] Waiting for alignment before UX copy changes

---

### Exercise 3.2: Permissionless Communication

**Scenario:**
You have experiment results ready. You're about to DM your manager: "Should I post these in the channel?"

**Rewrite as a permissionless Slack post:**

_________________________________
_________________________________
_________________________________
_________________________________
_________________________________

<details>
<summary>Example Answer</summary>

> "🧪 Experiment Results: Profile Tooltip
>
> **Result:** +12% profile completion (variant vs control)
> **Sample:** 3,000 users, 95% confidence
> **Impact:** ~50 more activated merchants/month
>
> **Recommendation:** Ship to 100%
> **Timeline:** Rolling out Thursday unless objections by EOD Wednesday
>
> cc @manager @eng-lead"

**Why this is better:**
- You made the decision
- You gave people a chance to object
- You set a timeline
- You didn't ask permission to share factual information

</details>

---

### Exercise 3.3: Metric Ownership Quiz

**Without looking at any dashboard, answer for your primary metric:**

1. What's the current value? _______
2. What was it last week? _______
3. What's driving the trend? _______________________
4. What are you doing about it? _______________________

**Score yourself:**
- 4/4: True ownership
- 2-3/4: Tracking but not owning
- 0-1/4: Not owning yet

---

## Module 4: PRD Quality

### Exercise 4.1: Problem Paragraph

**Scenario:**
You're writing a PRD for a "guided onboarding wizard." Write the problem paragraph.

**Template:**
- Who has the problem?
- What is the pain (in their words)?
- Why now?
- How do we know it exists?

**Write your problem paragraph:**

_________________________________
_________________________________
_________________________________
_________________________________
_________________________________

<details>
<summary>Example Answer</summary>

> **Problem:**
>
> New merchants signing up via paid acquisition are dropping off 40% at the "create campaign" step. Support tickets show they don't understand what campaigns are or why they need one. ("What is a campaign? I just want to send a notification.")
>
> **Why now:** Q1 target is 45% activation (currently 32%). Missing target impacts retention pipeline and Q2 revenue goals.
>
> **Evidence:**
> - 147 support tickets in December mentioning "what is a campaign"
> - User interviews: 8/10 mentioned confusion at this step
> - Funnel data: 52% → 31% drop at this step ([dashboard link])

</details>

---

### Exercise 4.2: Controllable vs Track-Only

**Scenario:**
You're defining metrics for the onboarding wizard PRD. Categorize these:

| Metric | Controllable or Track-Only? |
|--------|----------------------------|
| Profile → Campaign conversion | ________ |
| Signup volume | ________ |
| D7 retention | ________ |
| Campaign → Send conversion | ________ |
| Revenue per activated merchant | ________ |

<details>
<summary>Example Answer</summary>

| Metric | Controllable or Track-Only? |
|--------|----------------------------|
| Profile → Campaign conversion | **Controllable** (you're building the wizard for this) |
| Signup volume | **Track-only** (marketing owns this) |
| D7 retention | **Track-only** (downstream effect, not direct) |
| Campaign → Send conversion | **Controllable** (your feature affects this) |
| Revenue per activated merchant | **Track-only** (downstream, not direct) |

</details>

---

## Module 5: Impact Selling

### Exercise 5.1: Win Tracking

**List your last 3 wins and track their "stickiness":**

| Win | Impact | Times Mentioned | Last Mentioned | Stuck Yet? |
|-----|--------|----------------|----------------|------------|
| 1. | | | | Y/N |
| 2. | | | | Y/N |
| 3. | | | | Y/N |

**For any win mentioned <3 times:** Schedule to mention it in your next 1:1 or team meeting.

---

### Exercise 5.2: Leadership Language Translation

**Scenario:**
You shipped a feature that increased profile completion by 12%.

**Write the update for:**

**Team Slack:**
_________________________________

**Manager 1:1:**
_________________________________

**Skip-level / Leadership sync:**
_________________________________

<details>
<summary>Example Answer</summary>

**Team Slack:**
> "📊 Profile tooltip shipped. +12% profile completion in first week. Watching for downstream retention impact."

**Manager 1:1:**
> "Profile tooltip is working—12% lift in completion. This should add ~50 more activated merchants per month. I'll share results in the skip-level next week."

**Skip-level / Leadership:**
> "One highlight: our profile tooltip improved activation funnel efficiency by 12%, which projects to 50 additional activated merchants per month. At $45 ARPU, that's ~$2.2K MRR. We're monitoring downstream retention and expect to see D7 lift in 2 weeks."

</details>

---

## Integrated Scenario

### The Full Loop Exercise

**Scenario:**
It's Monday morning. You're preparing for a strategy meeting at 2pm where you'll present the activation metrics.

**Work through this step by step:**

**1. Before opening any dashboard, write down your question:**
_________________________________

**2. Open the dashboard. What's the ONE metric you'll triangulate?**
_________________________________

**3. Triangulate (fill in):**
- LEFT (upstream): _________________________________
- RIGHT (downstream): _________________________________
- UP (one level up): _________________________________

**4. Write your opening statement for the meeting (answer first):**
_________________________________
_________________________________

**5. Add impact translation:**
- "This means..." _________________________________
- "So we should..." _________________________________

**6. What baseline will you include?**
_________________________________

**7. After the meeting, self-grade:**
- [ ] Did I answer the question first?
- [ ] Did I triangulate before presenting?
- [ ] Did I include baseline?
- [ ] Did I translate to impact?
- [ ] Did I make a clear recommendation?

---

## Progress Tracking

### Weekly Exercise Log

| Week | Exercises Completed | Avg Self-Grade | Focus for Next Week |
|------|--------------------| --------------|---------------------|
| W1 | /10 | /5 | |
| W2 | /10 | /5 | |
| W3 | /10 | /5 | |
| W4 | /10 | /5 | |

### Skill Progression

Track which skills are becoming automatic:

| Skill | Week 1 | Week 2 | Week 3 | Week 4 |
|-------|--------|--------|--------|--------|
| Answer First | ⬜ | ⬜ | ⬜ | ⬜ |
| Impact Translation | ⬜ | ⬜ | ⬜ | ⬜ |
| Data Triangulation | ⬜ | ⬜ | ⬜ | ⬜ |
| Baseline First | ⬜ | ⬜ | ⬜ | ⬜ |
| Permissionless | ⬜ | ⬜ | ⬜ | ⬜ |
| Metric Ownership | ⬜ | ⬜ | ⬜ | ⬜ |
| Impact Selling | ⬜ | ⬜ | ⬜ | ⬜ |

Legend: ⬜ Practicing → 🟨 Improving → ✅ Automatic

---

**Next:** Complete 2-3 exercises per day. Review on Friday in your weekly reflection.
