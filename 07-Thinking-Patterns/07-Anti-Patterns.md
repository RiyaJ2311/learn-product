# Common PM Anti-Patterns

## 2-Minute Overview

Anti-patterns are common but ineffective behaviors—things that feel right but lead to poor outcomes. Recognizing them is the first step to avoiding them.

**Why it matters:** Most PM failures aren't due to lack of skill, but to falling into these traps. Knowing the anti-patterns helps you catch yourself before damage is done.

---

## The 15 Most Common PM Anti-Patterns

### Anti-Pattern 1: Solution-First Thinking

**What it looks like:**
- "I want to build X" before understanding the problem
- Falling in love with a specific solution
- PRDs that start with features, not problems

**Why it happens:**
- Solutions are tangible and exciting
- Problems are uncomfortable
- Stakeholders often ask for solutions

**The fix:**
- Force yourself to write the problem statement first
- If you can't articulate the problem, you're not ready to build
- Ask "What problem does this solve?" before any solution discussion

```
┌────────────────────────────────────────────────────────────┐
│ SOLUTION-FIRST CHECK                                        │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ My proposed solution: _________________________________    │
│                                                            │
│ The problem it solves (in one sentence):                   │
│ ________________________________________________________  │
│                                                            │
│ □ I can articulate the problem clearly                     │
│ □ I've validated this problem exists                       │
│ □ I've considered other solutions                          │
│                                                            │
│ If any unchecked → Go back to problem definition           │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

### Anti-Pattern 2: Feature Factory Mode

**What it looks like:**
- Shipping features without measuring impact
- Backlogs measured by output, not outcomes
- "We shipped 20 features this quarter" as success metric

**Why it happens:**
- Features are visible and countable
- Outcomes are delayed and harder to attribute
- Organizations reward visible activity

**The fix:**
- Define success metrics before building
- Measure outcomes, not just output
- Kill features that don't move metrics

---

### Anti-Pattern 3: Specification by Committee

**What it looks like:**
- Everyone's feedback gets incorporated
- Requirements keep expanding
- Design by consensus (lowest common denominator)

**Why it happens:**
- Desire to make everyone happy
- Avoiding conflict
- Lack of clear decision-making authority

**The fix:**
- DACI: One approver, clear contributors
- Explicit "input window" followed by decision
- Accept that some people will disagree

---

### Anti-Pattern 4: The Infinite Scope Creep

**What it looks like:**
- "While we're at it, let's also add..."
- Timelines slip because scope grows
- V1 becomes V3 before shipping

**Why it happens:**
- Optimism about capacity
- "Since we're touching this area anyway..."
- Stakeholders add requirements incrementally

**The fix:**
- Explicit scope lock with change control
- "What can we cut to add this?"
- MVP discipline: what's the minimum to learn?

---

### Anti-Pattern 5: Building Without Talking to Users

**What it looks like:**
- Assumptions about user needs without validation
- "Users will love this" based on intuition
- Post-launch surprise when adoption is low

**Why it happens:**
- User research takes time
- We think we know our users
- Building is more fun than research

**The fix:**
- Talk to 5 users before writing any PRD
- Build talking to users into your weekly rhythm
- Validate problems before building solutions

---

### Anti-Pattern 6: Metric Worship

**What it looks like:**
- Optimizing for metrics at expense of user experience
- "The metric went up, so it's good"
- Gaming metrics instead of improving product

**Why it happens:**
- Metrics are objective and visible
- Pressure to show quantitative results
- Easier to defend decisions with numbers

**The fix:**
- Qualitative + quantitative understanding
- Guardrail metrics to prevent gaming
- Ask "Does this actually make the user's life better?"

---

### Anti-Pattern 7: HiPPO Capitulation

**What it looks like:**
- Building what executives want, not what users need
- Changing priorities based on who asked loudest
- Abandoning data-driven decisions for opinions

**Why it happens:**
- Career pressure
- Executive confidence is compelling
- Path of least resistance

**The fix:**
- Come prepared with data
- Frame decisions around user/business outcomes
- Push back respectfully with evidence
- If overruled, disagree and commit

---

### Anti-Pattern 8: The Perfect Launch Fallacy

**What it looks like:**
- Delaying launch to add "one more thing"
- Chasing perfection instead of shipping
- V1 never ships because it's never "ready"

**Why it happens:**
- Fear of criticism
- Desire for perfect first impression
- Underestimating learning from real usage

**The fix:**
- Define "good enough" upfront
- Remember: imperfect and shipped beats perfect and delayed
- You learn more in one week of real usage than months of planning

---

### Anti-Pattern 9: Shiny Object Syndrome

**What it looks like:**
- Jumping to new ideas before completing current ones
- "Competitor launched X, we should too!"
- Roadmap changes every sprint

**Why it happens:**
- New is exciting, execution is hard
- External noise creates urgency
- Lack of clear strategy to anchor decisions

**The fix:**
- Explicit evaluation criteria for new ideas
- Time-boxed "no new ideas" periods
- Strategy that filters noise from signal

---

### Anti-Pattern 10: Documentation Theater

**What it looks like:**
- PRDs that no one reads
- Documentation for documentation's sake
- Process as performance, not substance

**Why it happens:**
- Organizations reward visible artifacts
- Docs feel like progress
- Cover-your-ass mentality

**The fix:**
- Write for the reader, not for the file
- Ask "Who will use this and how?"
- Shorter docs that actually get read

---

### Anti-Pattern 11: Stakeholder Avoidance

**What it looks like:**
- Working in isolation to avoid feedback
- Surprising stakeholders at the end
- "Just build it and they'll accept it"

**Why it happens:**
- Feedback feels like slowing down
- Conflict avoidance
- Overconfidence in your approach

**The fix:**
- Early and frequent stakeholder touchpoints
- "Disagree and commit" after genuine input
- Accept that feedback improves the work

---

### Anti-Pattern 12: The Data Excuse

**What it looks like:**
- "We don't have enough data to decide"
- Analysis paralysis waiting for perfect information
- Using data absence to avoid decisions

**Why it happens:**
- Decisions are risky
- Data feels objective and safe
- Organizational culture of over-certainty

**The fix:**
- Recognize "good enough" data
- Make reversible decisions faster
- Ask "What would we need to believe to decide?"

---

### Anti-Pattern 13: Launch and Abandon

**What it looks like:**
- Shipping features and moving on
- No iteration based on feedback
- "Feature complete" = done

**Why it happens:**
- New is more exciting than improving
- Maintenance isn't glamorous
- Pressure to ship more features

**The fix:**
- Build iteration into roadmap
- Measure post-launch, not just launch
- Own features through their lifecycle

---

### Anti-Pattern 14: The Echo Chamber

**What it looks like:**
- Only talking to users who like your product
- Ignoring negative feedback
- Team groupthink on product direction

**Why it happens:**
- Positive feedback feels good
- Negative feedback is uncomfortable
- We seek validation

**The fix:**
- Actively seek critics
- Exit interviews with churned users
- Diverse perspectives in planning

---

### Anti-Pattern 15: The Hero Complex

**What it looks like:**
- Doing everything yourself
- Not delegating or trusting team
- Single point of failure

**Why it happens:**
- Faster in short term to do it yourself
- Control feels safe
- Getting help feels like weakness

**The fix:**
- Invest in team capability
- Document and delegate
- Measure yourself on team output, not personal output

---

## Anti-Pattern Self-Assessment

Score yourself honestly:

```
┌────────────────────────────────────────────────────────────┐
│ ANTI-PATTERN SELF-ASSESSMENT                                │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ Rate each: 1 = Never, 2 = Rarely, 3 = Sometimes,           │
│           4 = Often, 5 = Always                            │
│                                                            │
│ Solution-First Thinking         ___/5                      │
│ Feature Factory Mode            ___/5                      │
│ Specification by Committee      ___/5                      │
│ Infinite Scope Creep            ___/5                      │
│ Building Without User Research  ___/5                      │
│ Metric Worship                  ___/5                      │
│ HiPPO Capitulation             ___/5                      │
│ Perfect Launch Fallacy          ___/5                      │
│ Shiny Object Syndrome           ___/5                      │
│ Documentation Theater           ___/5                      │
│ Stakeholder Avoidance           ___/5                      │
│ The Data Excuse                 ___/5                      │
│ Launch and Abandon              ___/5                      │
│ The Echo Chamber                ___/5                      │
│ The Hero Complex                ___/5                      │
│                                                            │
│ Highest scores = Your personal anti-pattern danger zones   │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## The Anti-Pattern Antidote

For your top 3 anti-patterns, create specific countermeasures:

```
┌────────────────────────────────────────────────────────────┐
│ PERSONAL ANTI-PATTERN PLAN                                  │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ Anti-pattern #1: _______________________________________   │
│ Trigger situation: _____________________________________   │
│ My countermeasure: _____________________________________   │
│ How I'll know I'm falling in: __________________________   │
│                                                            │
│ Anti-pattern #2: _______________________________________   │
│ Trigger situation: _____________________________________   │
│ My countermeasure: _____________________________________   │
│ How I'll know I'm falling in: __________________________   │
│                                                            │
│ Anti-pattern #3: _______________________________________   │
│ Trigger situation: _____________________________________   │
│ My countermeasure: _____________________________________   │
│ How I'll know I'm falling in: __________________________   │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## Weekly Anti-Pattern Check

Add to your Friday reflection:

1. Which anti-pattern did I fall into this week?
2. What triggered it?
3. What will I do differently next time?

---

## Team-Level Anti-Patterns

Watch for these at the team/org level:

| Pattern | Sign | Fix |
|---------|------|-----|
| Meeting Overload | No time for deep work | Meeting audit, "no meeting" days |
| Decision Bottlenecks | Everything waits for one person | Delegate authority, DACI |
| Roadmap Volatility | Priorities change weekly | Strategy alignment, saying no |
| Knowledge Silos | Single points of failure | Documentation, rotation |
| Burnout Culture | Heroes rewarded, balance punished | Sustainable pace, boundaries |

---

## The Anti-Pattern Warning Signs

```
┌────────────────────────────────────────────────────────────┐
│ WARNING SIGNS YOU'RE IN AN ANTI-PATTERN                     │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ □ "We've always done it this way"                          │
│ □ "We don't have time to talk to users"                    │
│ □ "Let's just add one more thing"                          │
│ □ "The exec wants it, so we're doing it"                   │
│ □ "We shipped, so we're done"                              │
│ □ "The metrics went up, it must be working"                │
│ □ "I'll just do it myself, it's faster"                    │
│ □ "We need more data before deciding"                      │
│ □ "No one had complaints in the meeting"                   │
│ □ "It's not perfect yet, we can't launch"                  │
│                                                            │
│ If you hear yourself saying these → Pause and examine      │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

**Remember:** Everyone falls into anti-patterns. The difference between good and great PMs is recognizing them quickly and course-correcting before damage is done.
