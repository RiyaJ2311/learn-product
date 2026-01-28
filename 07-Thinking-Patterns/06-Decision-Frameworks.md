# Decision Frameworks

## 2-Minute Overview

PMs make 50+ decisions per week. Most don't need frameworks—you can decide quickly based on experience. But some decisions are high-stakes, irreversible, or complex. For these, having structured frameworks improves outcomes and reduces regret.

**Why it matters:** Good decision-making is a skill, not a talent. Frameworks are tools that make you better at it.

---

## When to Use Frameworks

Not every decision needs a framework. Use them when:

```
┌─────────────────────────────────────────────────────────────┐
│ FRAMEWORK DECISION MATRIX                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│                    │ Low Stakes  │ High Stakes             │
│ ───────────────────┼─────────────┼─────────────            │
│ Reversible         │ Just decide │ Light framework          │
│ ───────────────────┼─────────────┼─────────────            │
│ Irreversible       │ Careful     │ Full framework           │
│                    │ thought     │                          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

Jeff Bezos calls these **Type 1** (irreversible, consequential—need rigor) and **Type 2** (reversible, low-consequence—decide fast) decisions.

---

## Framework 1: The Reversibility Test

**Use when:** Deciding how much rigor to apply

**The Framework:**
```
┌────────────────────────────────────────────────────────────┐
│ REVERSIBILITY TEST                                          │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ Question: How hard is this to undo?                        │
│                                                            │
│ EASILY REVERSIBLE                                          │
│ • A/B test, feature flag, pricing experiment               │
│ • Action: Decide fast, learn from results                  │
│                                                            │
│ MODERATELY REVERSIBLE                                      │
│ • New feature, process change, hire                        │
│ • Action: Think carefully, but don't overthink             │
│                                                            │
│ MOSTLY IRREVERSIBLE                                        │
│ • Platform change, public commitment, firing               │
│ • Action: Full analysis, get input, document reasoning     │
│                                                            │
│ FULLY IRREVERSIBLE                                         │
│ • Fundamental architecture, major rebranding               │
│ • Action: Maximum rigor, broad input, sleep on it          │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## Framework 2: Regret Minimization

**Use when:** Major life/career decisions, strategic pivots

**From Jeff Bezos:**
> "I wanted to project myself forward to age 80 and say, 'OK, I'm looking back on my life. I want to minimize the number of regrets I have.'"

**The Framework:**
1. Project yourself to 80 years old
2. Look back at this decision
3. Which choice minimizes regret?

**Key insight:** We rarely regret things we tried and failed. We often regret things we never tried.

```
┌────────────────────────────────────────────────────────────┐
│ REGRET MINIMIZATION                                         │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ At 80, will I regret NOT taking this action?               │
│                                                            │
│ □ Yes → Strong signal to do it                             │
│ □ No → OK to pass                                          │
│                                                            │
│ At 80, will I regret TAKING this action?                   │
│                                                            │
│ □ Yes → Understand why, maybe don't do it                  │
│ □ No → Go ahead                                            │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## Framework 3: DACI (Decision-Making Clarity)

**Use when:** Group decisions, stakeholder alignment

**The Framework:**
- **D**river: Single person responsible for driving decision to completion
- **A**pprover: Person who makes the final call (ideally one)
- **C**ontributors: People who have input but not decision rights
- **I**nformed: People who need to know but don't need to input

```
┌────────────────────────────────────────────────────────────┐
│ DACI TEMPLATE                                               │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ Decision: _____________________________________________    │
│                                                            │
│ D (Driver): ________________                               │
│   → Responsible for driving to completion                  │
│                                                            │
│ A (Approver): ______________                               │
│   → Makes the final call                                   │
│                                                            │
│ C (Contributors): __________                               │
│   → Provide input and expertise                            │
│                                                            │
│ I (Informed): ______________                               │
│   → Need to know the outcome                               │
│                                                            │
│ Deadline: ________________                                 │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

**Common mistake:** Too many Approvers. One Approver is ideal.

---

## Framework 4: Weighted Scoring

**Use when:** Comparing multiple options with multiple criteria

**The Framework:**
1. List your options
2. Define criteria that matter
3. Weight criteria by importance
4. Score each option against each criterion
5. Calculate weighted scores

```
┌────────────────────────────────────────────────────────────┐
│ WEIGHTED SCORING TEMPLATE                                   │
├────────────────────────────────────────────────────────────┤
│                                                            │
│             │ Weight │ Option A │ Option B │ Option C      │
│ ────────────┼────────┼──────────┼──────────┼──────────     │
│ Criterion 1 │  40%   │  ___/10  │  ___/10  │  ___/10       │
│ Criterion 2 │  30%   │  ___/10  │  ___/10  │  ___/10       │
│ Criterion 3 │  20%   │  ___/10  │  ___/10  │  ___/10       │
│ Criterion 4 │  10%   │  ___/10  │  ___/10  │  ___/10       │
│ ────────────┼────────┼──────────┼──────────┼──────────     │
│ WEIGHTED    │  100%  │  ______  │  ______  │  ______       │
│ TOTAL       │        │          │          │               │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

**Caution:** Don't let the math override intuition. If the "winner" feels wrong, investigate why.

---

## Framework 5: The 10/10/10 Rule

**Use when:** Emotionally charged decisions, short-term vs. long-term tradeoffs

**From Suzy Welch:**

Ask: How will I feel about this decision...
- **10 minutes** from now?
- **10 months** from now?
- **10 years** from now?

```
┌────────────────────────────────────────────────────────────┐
│ 10/10/10 TEMPLATE                                           │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ Decision: _____________________________________________    │
│                                                            │
│ In 10 MINUTES, I'll feel: _____________________________   │
│                                                            │
│ In 10 MONTHS, I'll feel: ______________________________   │
│                                                            │
│ In 10 YEARS, I'll feel: _______________________________   │
│                                                            │
│ Insight: ______________________________________________   │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

**Use case:** "Should I send this angry email?" (10 min: satisfied, 10 months: embarrassed, 10 years: won't remember → don't send)

---

## Framework 6: Eisenhower Matrix

**Use when:** Prioritizing tasks, managing time

```
┌─────────────────────────────────────────────────────────────┐
│ EISENHOWER MATRIX                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│           │ URGENT          │ NOT URGENT                   │
│ ──────────┼─────────────────┼─────────────────             │
│ IMPORTANT │ DO FIRST        │ SCHEDULE                     │
│           │ Crisis, deadline│ Strategy, planning           │
│ ──────────┼─────────────────┼─────────────────             │
│ NOT       │ DELEGATE        │ ELIMINATE                    │
│ IMPORTANT │ Interruptions   │ Time wasters                 │
│           │                 │                              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**PM trap:** Spending all time in "Urgent" quadrants, never in "Important but Not Urgent" (where strategy lives).

---

## Framework 7: Confidence Calibration

**Use when:** Estimating, forecasting, committing

**The Framework:**
Assign confidence levels and act accordingly.

```
┌────────────────────────────────────────────────────────────┐
│ CONFIDENCE LEVELS                                           │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ 90%+ CONFIDENT                                             │
│ • You'd bet significant money on it                        │
│ • Action: Commit, communicate confidently                  │
│                                                            │
│ 70-90% CONFIDENT                                           │
│ • Strong belief with some uncertainty                      │
│ • Action: Commit with caveats, have contingencies          │
│                                                            │
│ 50-70% CONFIDENT                                           │
│ • More likely than not, but uncertain                      │
│ • Action: Test before committing, reduce scope             │
│                                                            │
│ <50% CONFIDENT                                             │
│ • Basically a guess                                        │
│ • Action: Don't commit, gather more information            │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

**Practice:** Track your confidence predictions against outcomes. Calibrate over time.

---

## Framework 8: The Hell Yes Test

**Use when:** Saying yes/no to opportunities, commitments

**From Derek Sivers:**
> "If it's not a HELL YES, it's a NO."

**The Framework:**
- Is this opportunity a clear, enthusiastic "Hell Yes"?
- If you have to talk yourself into it, it's a No

**Caveat:** This works for optional opportunities, not required decisions.

---

## Framework 9: The Newspaper Test (Ethics)

**Use when:** Ethical decisions, reputational risk

**The Framework:**
Would you be comfortable if this decision appeared on the front page of the newspaper tomorrow?

```
┌────────────────────────────────────────────────────────────┐
│ NEWSPAPER TEST                                              │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ Headline: "[Company] [your action]"                        │
│                                                            │
│ □ I'd be proud of this headline                            │
│ □ I'd be comfortable but not proud                         │
│ □ I'd be embarrassed                                       │
│ □ This could be a PR disaster                              │
│                                                            │
│ If embarrassed or worse → reconsider                       │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## Framework 10: The Disagree and Commit Protocol

**Use when:** Team alignment after disagreement

**From Jeff Bezos:**
> "If you have conviction on a particular direction even though there's no consensus, it's helpful to say, 'Look, I know we disagree on this, but will you gamble with me on it? Disagree and commit?'"

**The Framework:**
1. Debate thoroughly
2. Reach decision (even without consensus)
3. Those who disagree commit fully to execution
4. After execution, evaluate—learn, don't blame

**Key:** Commitment must be genuine. Half-hearted execution dooms the decision.

---

## Quick Reference: Which Framework When

| Situation | Framework |
|-----------|-----------|
| How much rigor? | Reversibility Test |
| Major life decision | Regret Minimization |
| Group decision | DACI |
| Multiple options, multiple criteria | Weighted Scoring |
| Emotional decision | 10/10/10 |
| Time/priority | Eisenhower Matrix |
| Estimating | Confidence Calibration |
| Opportunity | Hell Yes Test |
| Ethical decision | Newspaper Test |
| Team disagreement | Disagree and Commit |

---

## The Meta-Framework

When facing any significant decision:

```
┌────────────────────────────────────────────────────────────┐
│ DECISION META-FRAMEWORK                                     │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ 1. CLARIFY                                                 │
│    □ What exactly am I deciding?                           │
│    □ What are my options?                                  │
│    □ What's the deadline?                                  │
│                                                            │
│ 2. CALIBRATE                                               │
│    □ How reversible is this? (Type 1 vs Type 2)            │
│    □ What's my confidence level?                           │
│    □ What framework applies?                               │
│                                                            │
│ 3. ANALYZE                                                 │
│    □ Apply appropriate framework                           │
│    □ Check for biases                                      │
│    □ Consider second-order effects                         │
│                                                            │
│ 4. DECIDE                                                  │
│    □ Make the call                                         │
│    □ Document reasoning                                    │
│    □ Communicate clearly                                   │
│                                                            │
│ 5. LEARN                                                   │
│    □ Track outcome                                         │
│    □ Retrospect on decision quality                        │
│    □ Update your mental models                             │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## Common Decision Traps

1. **Analysis Paralysis:** Overthinking reversible decisions
2. **Shooting from Hip:** Under-thinking irreversible decisions
3. **Decision Avoidance:** Not deciding is a decision (often the worst one)
4. **Consensus Seeking:** Waiting for everyone to agree (often impossible)
5. **Sunk Cost Continuation:** Sticking with bad decisions because you already started

---

**Remember:** The goal isn't to make perfect decisions. It's to make good decisions consistently, learn from mistakes, and improve over time.
