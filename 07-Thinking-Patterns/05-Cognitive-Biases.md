# Cognitive Biases for PMs

## 2-Minute Overview

Cognitive biases are systematic errors in thinking that affect everyone. As a PM, you make dozens of decisions daily under uncertainty, time pressure, and incomplete information—exactly the conditions where biases thrive.

**Why it matters:** You can't eliminate biases, but you can recognize them. Awareness is the first defense. This module covers the biases most dangerous for PMs and how to counteract them.

---

## The Top 10 PM Biases

### 1. Confirmation Bias

**What it is:** Seeking information that confirms what you already believe, ignoring contradictory evidence.

**PM danger zone:**
- Interpreting user feedback to support your feature idea
- Only looking at metrics that show success
- Dismissing negative signals as "noise"

**Antidote:**
- Actively seek disconfirming evidence
- Ask "What would prove me wrong?"
- Have someone play devil's advocate

```
┌────────────────────────────────────────────────────────────┐
│ CONFIRMATION BIAS CHECK                                     │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ My hypothesis: _________________________________________   │
│                                                            │
│ Evidence FOR (that I've found):                            │
│ • ________________________________________________        │
│                                                            │
│ Evidence AGAINST (that I've actively sought):              │
│ • ________________________________________________        │
│                                                            │
│ If I had to argue the opposite, I would say:               │
│ ______________________________________________________    │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

### 2. Sunk Cost Fallacy

**What it is:** Continuing to invest in something because you've already invested, regardless of future value.

**PM danger zone:**
- Refusing to kill features you've spent months building
- Sticking with a strategy because "we've come this far"
- Not pivoting because of past investment

**Antidote:**
- Ask "If I hadn't started this, would I start it now?"
- Focus on future value, not past investment
- Set kill criteria upfront

```
┌────────────────────────────────────────────────────────────┐
│ SUNK COST CHECK                                             │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ Current investment: _________________ (time, money, etc.)  │
│                                                            │
│ If I started fresh today with this knowledge,              │
│ would I pursue this? □ Yes  □ No                           │
│                                                            │
│ If No: What's stopping me from stopping?                   │
│ ______________________________________________________    │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

### 3. Survivorship Bias

**What it is:** Focusing on successes while ignoring failures that are no longer visible.

**PM danger zone:**
- "Successful companies do X, so we should do X"
- Learning only from winning features
- Copying competitor strategies that might not be working

**Antidote:**
- Ask "What failures am I not seeing?"
- Study failures, not just successes
- Consider base rates (how many attempted X and failed?)

---

### 4. Anchoring Bias

**What it is:** Over-relying on the first piece of information you receive.

**PM danger zone:**
- Competitor priced at $99, so you think around $99
- First estimate becomes the ceiling/floor for all estimates
- Initial user feedback dominates subsequent interpretation

**Antidote:**
- Generate your own estimate before seeing others
- Consider multiple anchors
- Ask "Would I think differently if the first number had been X?"

---

### 5. Availability Bias

**What it is:** Overweighting information that's easy to recall (recent, vivid, emotional).

**PM danger zone:**
- One angry customer email outweighs aggregate data
- Recent launch success biases next decision
- Vivid failure creates excessive risk aversion

**Antidote:**
- Use systematic data, not anecdotes
- Ask "Is this representative or just memorable?"
- Keep written records to counteract memory bias

---

### 6. Optimism Bias (Planning Fallacy)

**What it is:** Underestimating time, costs, and risks while overestimating benefits.

**PM danger zone:**
- "This will take 2 weeks" (takes 6)
- "Users will love this" (they're indifferent)
- "Nothing will go wrong" (everything goes wrong)

**Antidote:**
- Use reference class forecasting (how long did similar things take?)
- Add buffers to all estimates
- Pre-mortems to surface risks

```
┌────────────────────────────────────────────────────────────┐
│ PLANNING FALLACY CHECK                                      │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ My estimate: ___________                                   │
│                                                            │
│ Similar past projects actually took: ___________           │
│                                                            │
│ Adjusted estimate (using base rates): ___________          │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

### 7. Bandwagon Effect (Social Proof)

**What it is:** Doing something because others are doing it.

**PM danger zone:**
- "Everyone's adding AI, we should too"
- Following competitor moves without analysis
- Building features because they're trendy

**Antidote:**
- Ask "Would this make sense if no one else was doing it?"
- First principles analysis
- Consider if this trend serves YOUR users

---

### 8. Status Quo Bias

**What it is:** Preferring the current state, resisting change.

**PM danger zone:**
- Not killing underperforming features
- Maintaining processes that don't work
- "That's how we've always done it"

**Antidote:**
- Regularly audit: "Would we add this today?"
- Zero-based thinking for features and processes
- Treat status quo as an active choice, not default

---

### 9. IKEA Effect

**What it is:** Overvaluing things you've created yourself.

**PM danger zone:**
- Overestimating value of your own feature ideas
- Defending solutions you personally designed
- Undervaluing external or competitor approaches

**Antidote:**
- Get external validation
- Have others evaluate your work blind
- Ask "Would I value this if someone else made it?"

---

### 10. Authority Bias

**What it is:** Over-trusting opinions from authority figures.

**PM danger zone:**
- HiPPO decisions (Highest Paid Person's Opinion)
- Not questioning executive requests
- Assuming "experts" are always right

**Antidote:**
- Focus on evidence, not source
- Ask authorities to show their work
- Create psychological safety to question up

---

## Bias Categories

### Biases That Distort What We See

| Bias | You think... | Reality... |
|------|--------------|------------|
| Confirmation | Data supports my view | You only see supporting data |
| Availability | Recent events are representative | They're just memorable |
| Survivorship | Success patterns are visible | Failures are invisible |
| Anchoring | First number is reasonable baseline | It's just arbitrary anchor |

### Biases That Distort What We Decide

| Bias | You think... | Reality... |
|------|--------------|------------|
| Sunk Cost | Can't stop, invested too much | Past investment is irrelevant |
| Status Quo | Current way is proven best | Current way is just familiar |
| Optimism | This time will be different | Base rates apply to you too |
| Bandwagon | Everyone's doing it for good reason | Everyone might be wrong |

### Biases That Distort How We Value

| Bias | You think... | Reality... |
|------|--------------|------------|
| IKEA Effect | My creation is valuable | You're biased toward your work |
| Endowment | What I have is worth more | Ownership inflates value |
| Authority | Expert says so, must be true | Experts have biases too |

---

## Bias-Prone Situations

Be extra vigilant when:

```
┌─────────────────────────────────────────────────────────────┐
│ HIGH-BIAS SITUATIONS                                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  TIME PRESSURE                                              │
│  └── Rushed decisions trigger heuristics (and biases)       │
│                                                             │
│  EMOTIONAL INVOLVEMENT                                      │
│  └── Your baby, your pet project, your idea                 │
│                                                             │
│  COMPLEXITY                                                 │
│  └── When you can't fully analyze, biases fill gaps         │
│                                                             │
│  SOCIAL PRESSURE                                            │
│  └── When others expect certain answers                     │
│                                                             │
│  FATIGUE                                                    │
│  └── Decision fatigue depletes rational capacity            │
│                                                             │
│  UNCERTAINTY                                                │
│  └── Ambiguity invites bias to create false certainty       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## The Bias Audit

For important decisions, audit for biases:

```
┌────────────────────────────────────────────────────────────┐
│ BIAS AUDIT TEMPLATE                                         │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ Decision: _____________________________________________    │
│                                                            │
│ CONFIRMATION BIAS                                          │
│ □ I've actively sought disconfirming evidence              │
│ Evidence against my view: ____________________________    │
│                                                            │
│ SUNK COST                                                  │
│ □ I would make this decision even without past investment  │
│ Past investment: _____________ Would I start fresh? ____  │
│                                                            │
│ AVAILABILITY                                               │
│ □ I'm using systematic data, not just memorable examples   │
│ Anecdote I might be overweighting: ____________________   │
│                                                            │
│ ANCHORING                                                  │
│ □ I've considered multiple anchors                         │
│ Original anchor: _______ Alternative anchor: __________   │
│                                                            │
│ OPTIMISM                                                   │
│ □ I've used base rates from similar past projects          │
│ My estimate: _______ Base rate estimate: ______________   │
│                                                            │
│ SOCIAL PROOF                                               │
│ □ This makes sense independent of what others are doing    │
│ Would I do this if no one else was? ____________________  │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## Daily Practice

### Before Decisions
Ask: "What bias might be affecting this?"
- Check the list
- Be especially careful in high-bias situations

### After Decisions (Retrospective)
Ask: "What bias did affect this?"
- Learn your personal bias patterns
- Build awareness over time

### Weekly Reflection
Add to Friday reflection:
- What decision might have been biased?
- What bias was it?
- How would I decide differently?

---

## Team-Level Bias Mitigation

Individual awareness isn't enough. Create team practices:

1. **Red Team / Devil's Advocate:** Assign someone to argue the opposite
2. **Pre-mortem:** "Assume this failed, why?"
3. **Independent estimates:** Write estimates before sharing
4. **Data first:** Look at data before forming opinions
5. **Psychological safety:** Make it safe to question assumptions

---

## Quick Reference

```
┌────────────────────────────────────────────────────────────┐
│ BIAS QUICK CHECK                                            │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ Before any significant decision, ask:                      │
│                                                            │
│ □ Am I only seeing what I want to see? (Confirmation)      │
│ □ Would I do this if I hadn't already invested? (Sunk Cost)│
│ □ Is this memorable or representative? (Availability)      │
│ □ Am I anchored on an arbitrary number? (Anchoring)        │
│ □ Are my estimates realistic? (Optimism)                   │
│ □ Am I following the crowd? (Bandwagon)                    │
│ □ Am I overvaluing my own creation? (IKEA Effect)          │
│ □ Am I assuming current way is best? (Status Quo)          │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

**Remember:** Having biases is human. Not accounting for them is negligent. The goal isn't to eliminate bias—it's to recognize and compensate for it.
