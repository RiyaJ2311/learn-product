# Inversion & Pre-Mortems

## 2-Minute Overview

Inversion is thinking backwards—instead of asking "How do I succeed?", ask "How would I guarantee failure?" Then avoid those things. Pre-mortems apply this to launches and projects: imagine the project failed, then work backwards to identify why.

**Why it matters for PMs:** We're wired to be optimistic about our projects. Inversion and pre-mortems force you to see risks you'd otherwise miss, leading to better planning and fewer surprises.

---

## Part 1: Inversion Thinking

### The Core Idea

From Charlie Munger:

> "Invert, always invert. Turn a situation or problem upside down. Look at it backward. What happens if all our plans go wrong? Where don't we want to go, and how do you get there?"

Instead of: "How do I make this feature successful?"
Ask: "How would I guarantee this feature fails?"

---

### The Inversion Process

```
┌─────────────────────────────────────────────────────────────┐
│ INVERSION PROCESS                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  STEP 1: STATE YOUR GOAL                                    │
│  └── What are you trying to achieve?                        │
│                                                             │
│  STEP 2: INVERT THE GOAL                                    │
│  └── What's the opposite? What would guarantee failure?     │
│                                                             │
│  STEP 3: LIST FAILURE PATHS                                 │
│  └── Brainstorm all the ways to achieve failure             │
│                                                             │
│  STEP 4: AVOID THOSE PATHS                                  │
│  └── Make sure you're not accidentally doing any of them    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

### PM Inversion Examples

**Goal:** Increase activation rate

**Inverted question:** How would I guarantee users NEVER activate?
- Make onboarding confusing
- Ask for payment before showing value
- Hide the core feature
- Require 10+ steps before they can do anything
- Send no guidance or help
- Make the UI overwhelming

**Insight:** Now check—are any of these partially true today?

---

**Goal:** Ship a successful feature

**Inverted question:** How would I guarantee this feature fails?
- Don't talk to any users beforehand
- Skip the problem definition
- Make it hard to discover
- Don't measure anything
- Ignore edge cases
- Ship and forget

**Insight:** Each of these becomes a checklist item to avoid.

---

**Goal:** Build stakeholder trust

**Inverted question:** How would I destroy trust completely?
- Surprise stakeholders with bad news
- Miss deadlines without communication
- Say yes to everything, deliver on nothing
- Never admit mistakes
- Take credit, deflect blame
- Change priorities without explanation

**Insight:** Do the opposite of each.

---

### The Failure Recipe

For any initiative, write the "recipe for failure":

```
┌────────────────────────────────────────────────────────────┐
│ FAILURE RECIPE TEMPLATE                                     │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ Project: _____________________________________________     │
│                                                            │
│ To guarantee this project fails, I would:                  │
│                                                            │
│ 1. ________________________________________________       │
│                                                            │
│ 2. ________________________________________________       │
│                                                            │
│ 3. ________________________________________________       │
│                                                            │
│ 4. ________________________________________________       │
│                                                            │
│ 5. ________________________________________________       │
│                                                            │
│ Am I accidentally doing any of these? _______________      │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## Part 2: Pre-Mortems

### What is a Pre-Mortem?

A post-mortem happens after failure: "What went wrong?"
A **pre-mortem** happens before launch: "Assume this failed. Why?"

From Gary Klein (psychologist who developed the technique):

> "A pre-mortem in a business setting comes at the beginning of a project rather than the end, so that the project can be improved rather than autopsied."

---

### Why Pre-Mortems Work

1. **Permission to be pessimistic:** Teams are biased toward optimism. Pre-mortems give cover to voice concerns.

2. **Prospective hindsight:** Imagining the future as past makes it easier to identify causes.

3. **Reduces groupthink:** Everyone contributes risks independently before discussing.

4. **Improves planning:** Identified risks become mitigation actions.

---

### How to Run a Pre-Mortem

```
┌─────────────────────────────────────────────────────────────┐
│ PRE-MORTEM PROCESS (15-30 minutes)                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. SET THE SCENE (2 min)                                   │
│  "Imagine it's [3 months from now]. This project has        │
│   failed completely. It was a disaster."                    │
│                                                             │
│  2. INDIVIDUAL BRAINSTORM (5 min)                           │
│  Each person writes down reasons it failed. Silently.       │
│  No discussion yet.                                         │
│                                                             │
│  3. SHARE & CLUSTER (10 min)                                │
│  Go around the room. Each person shares one reason.         │
│  Keep going until all are shared. Group similar ones.       │
│                                                             │
│  4. PRIORITIZE (5 min)                                      │
│  Vote on which failure modes are most likely/impactful.     │
│                                                             │
│  5. MITIGATE (10 min)                                       │
│  For top 3-5 risks, assign owners and mitigation actions.   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

### Pre-Mortem Template

```
┌────────────────────────────────────────────────────────────┐
│ PRE-MORTEM: [PROJECT NAME]                                  │
├────────────────────────────────────────────────────────────┤
│ Date: ___________  Participants: ____________________      │
│                                                            │
│ The project failed because:                                │
│                                                            │
│ CATEGORY: EXECUTION                                        │
│ • ________________________________________________        │
│ • ________________________________________________        │
│                                                            │
│ CATEGORY: TECHNICAL                                        │
│ • ________________________________________________        │
│ • ________________________________________________        │
│                                                            │
│ CATEGORY: MARKET/USERS                                     │
│ • ________________________________________________        │
│ • ________________________________________________        │
│                                                            │
│ CATEGORY: STAKEHOLDERS/DEPENDENCIES                        │
│ • ________________________________________________        │
│ • ________________________________________________        │
│                                                            │
│ TOP 3 RISKS TO MITIGATE:                                   │
│ 1. _____________ | Owner: _____ | Action: _____________   │
│ 2. _____________ | Owner: _____ | Action: _____________   │
│ 3. _____________ | Owner: _____ | Action: _____________   │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

### Personal Pre-Mortem (Solo Version)

You don't need a team. Run a personal pre-mortem:

**Before any launch or major decision:**

1. Write: "It's [date]. This failed completely because..."
2. Stream of consciousness—list everything that comes to mind
3. Circle the 3 most likely/impactful failure modes
4. For each: "How would I prevent this?"
5. Add prevention actions to your plan

---

### Pre-Mortem Prompts

If you're stuck, ask:

**Execution risks:**
- "What if we're 2x slower than expected?"
- "What if the key person leaves mid-project?"
- "What if scope creeps by 50%?"

**Technical risks:**
- "What if the integration doesn't work?"
- "What if performance is 10x worse than expected?"
- "What if there's a critical bug we find after launch?"

**Market risks:**
- "What if users don't care about this problem?"
- "What if a competitor launches first?"
- "What if the market shifts while we're building?"

**Stakeholder risks:**
- "What if leadership changes priorities?"
- "What if the partner backs out?"
- "What if we lose key stakeholder support?"

---

## When to Use Each

### Use Inversion When:
- Stuck on how to achieve a goal
- Planning a new strategy or approach
- Defining success criteria (define failure first)
- Auditing an existing process

### Use Pre-Mortems When:
- Kicking off a new project
- Before major launches
- When team seems overly optimistic
- When stakes are high

---

## Integration with PM Work

### In PRDs
Add a "Risks & Mitigations" section powered by pre-mortem thinking:
- "This could fail if..."
- "We'll mitigate by..."

### In Sprint Planning
Quick inversion: "How would we guarantee this sprint fails?"
- Unclear acceptance criteria
- Dependencies not resolved
- No one owns QA

### In Launch Planning
Full pre-mortem before any major launch

### In Retrospectives
Compare pre-mortem predictions with actual outcomes:
- What did we predict correctly?
- What surprised us?
- What should we predict next time?

---

## The Inversion Checklist

Before finalizing any plan:

- [ ] I've asked "How would this fail?"
- [ ] I've listed at least 5 ways it could go wrong
- [ ] I've checked if I'm accidentally doing any of them
- [ ] For the top 3 risks, I have mitigation actions
- [ ] I've shared risks with stakeholders (no surprises)

---

## Quick Reference

```
┌────────────────────────────────────────────────────────────┐
│ INVERSION IN 60 SECONDS                                     │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ 1. What's your goal?                                       │
│    ________________________________________________       │
│                                                            │
│ 2. How would you guarantee the opposite?                   │
│    ________________________________________________       │
│    ________________________________________________       │
│    ________________________________________________       │
│                                                            │
│ 3. Are you accidentally doing any of these?                │
│    □ Yes → Stop doing it                                   │
│    □ No → Good, now plan to keep it that way               │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

**Remember:** Optimism is necessary to start projects. But pessimism—channeled through inversion and pre-mortems—is necessary to finish them successfully.
