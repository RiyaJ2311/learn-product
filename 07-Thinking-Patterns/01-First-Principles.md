# First Principles Thinking

## 2-Minute Overview

First principles thinking is the practice of breaking down complex problems into their most fundamental truths, then reasoning up from there. Instead of thinking by analogy ("What do others do?") or convention ("How has this always been done?"), you strip away assumptions to find the core components.

**Why it matters for PMs:** Most product decisions are made by analogy—copying competitors, following best practices, or doing what's always been done. First principles thinking helps you find better solutions by questioning everything.

---

## The Framework

### What is First Principles Thinking?

From Elon Musk:

> "First principles is kind of a physics way of looking at the world. You boil things down to the most fundamental truths and say, 'What are we sure is true?'... and then reason up from there."

### The Process

```
┌─────────────────────────────────────────────────────────────┐
│ FIRST PRINCIPLES PROCESS                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  STEP 1: IDENTIFY ASSUMPTIONS                               │
│  └── What are we taking for granted?                        │
│  └── What "rules" are we following without questioning?     │
│                                                             │
│  STEP 2: BREAK DOWN TO FUNDAMENTALS                         │
│  └── What is definitely, objectively true?                  │
│  └── What are the basic building blocks?                    │
│                                                             │
│  STEP 3: CREATE NEW SOLUTIONS                               │
│  └── Rebuild from the ground up                             │
│  └── Ignore how it's "supposed" to work                     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## The 5 Whys Technique

A practical tool for getting to first principles:

**Problem:** Users aren't completing onboarding

1. **Why?** → They drop off at step 3
2. **Why?** → Step 3 asks for payment info
3. **Why?** → We want to verify they're serious
4. **Why?** → We had spam signups before
5. **Why?** → Our signup form was too easy to abuse

**Root insight:** The real problem is spam prevention, not "users need to enter payment info." Now you can explore other spam solutions that don't hurt conversion.

---

## First Principles vs. Analogy Thinking

| Analogy Thinking | First Principles Thinking |
|------------------|---------------------------|
| "Competitor X does it this way" | "What problem are we actually solving?" |
| "This is industry standard" | "Why is this the standard? Is it still valid?" |
| "We've always done it this way" | "What if we started from scratch?" |
| "Best practices say..." | "What do we know for certain?" |
| Faster, but limited | Slower, but can lead to breakthroughs |

**When to use each:**
- **Analogy:** Good for quick decisions, proven patterns, low-stakes choices
- **First Principles:** Essential for stuck problems, innovation, high-stakes decisions

---

## PM Application Examples

### Example 1: Pricing Strategy

**Analogy thinking:** "Competitors charge $99/month, so we should too"

**First principles thinking:**
- What is our actual cost to serve one customer? ($5/month)
- What value does the customer get? ($1000/month in saved time)
- What is the customer's willingness to pay? (Up to 10% of value = $100)
- What's our target margin? (80%)

**New insight:** We could charge $29/month, win on price, and still make 80%+ margin. Or we could charge $199/month if we can prove 2x the value.

### Example 2: Feature Prioritization

**Analogy thinking:** "Every competitor has feature X, so we need it too"

**First principles thinking:**
- What job is the customer trying to do? (Get task Y done)
- Does feature X actually help with task Y? (Maybe not directly)
- What's the fastest path to completing task Y? (Maybe a different approach)
- What do customers actually complain about? (Not the lack of feature X)

**New insight:** Feature X is table stakes for competitors, but our users don't care about it. Focus elsewhere.

### Example 3: Go-To-Market

**Analogy thinking:** "B2B SaaS companies use sales teams, so we need one"

**First principles thinking:**
- What is the average deal size? ($200/year)
- What's the cost of a sales rep? ($150k/year fully loaded)
- How many deals per rep per year? (50 max)
- Math: $10k revenue per rep vs $150k cost = losing money

**New insight:** At this price point, PLG or self-serve is the only viable path.

---

## The Assumption Audit

Before making any major decision, audit your assumptions:

```
┌────────────────────────────────────────────────────────────┐
│ ASSUMPTION AUDIT TEMPLATE                                   │
├────────────────────────────────────────────────────────────┤
│                                                            │
│ Decision: _____________________________________________    │
│                                                            │
│ Assumptions I'm making:                                    │
│ 1. ________________________________________________       │
│    Source: □ Data  □ Intuition  □ Convention  □ Someone   │
│    Confidence: □ High  □ Medium  □ Low                     │
│                                                            │
│ 2. ________________________________________________       │
│    Source: □ Data  □ Intuition  □ Convention  □ Someone   │
│    Confidence: □ High  □ Medium  □ Low                     │
│                                                            │
│ 3. ________________________________________________       │
│    Source: □ Data  □ Intuition  □ Convention  □ Someone   │
│    Confidence: □ High  □ Medium  □ Low                     │
│                                                            │
│ Which assumption, if wrong, would change my decision?      │
│ ________________________________________________________  │
│                                                            │
│ How can I test that assumption quickly?                    │
│ ________________________________________________________  │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## Questions to Force First Principles

Use these when you feel stuck or when a decision feels "obvious":

1. **"What would we do if we started from scratch today?"**
   - Removes the anchor of existing systems

2. **"What would have to be true for the opposite approach to be better?"**
   - Forces you to consider alternatives seriously

3. **"Why does this rule exist? Is it still valid?"**
   - Challenges legacy thinking

4. **"If I explained this to a smart outsider, what would they question?"**
   - Exposes hidden assumptions

5. **"What are we optimizing for? Should we optimize for something else?"**
   - Checks if you're solving the right problem

---

## Common Traps

### Trap 1: Disguised Analogy
"We should do X because it's the logical thing to do"
**Reality:** "Logical" often means "conventional"

### Trap 2: False Fundamentals
"Users want faster horses"
**Reality:** That's not a fundamental truth—"users want to get places quickly" is

### Trap 3: Analysis Paralysis
Breaking everything down to first principles takes forever
**Solution:** Reserve first principles for important, stuck, or novel problems

### Trap 4: Ignoring Valid Experience
Just because something is conventional doesn't mean it's wrong
**Solution:** First principles is one tool, not the only tool

---

## Practice Exercise

Take a current project or decision and apply first principles:

**Current approach:** What are you planning to do?
```
_______________________________________________
```

**Assumption list:** What are you assuming is true?
```
1. _______________________________________________
2. _______________________________________________
3. _______________________________________________
```

**Challenge each:** Why do you believe this? What's the evidence?
```
1. _______________________________________________
2. _______________________________________________
3. _______________________________________________
```

**Fundamental truths:** What do you know FOR CERTAIN?
```
1. _______________________________________________
2. _______________________________________________
```

**New approach:** Reasoning only from fundamentals, what would you do?
```
_______________________________________________
```

---

## Integration with Daily Work

### During PRD Writing
- "What problem are we ACTUALLY solving?" (not the surface problem)
- "What assumptions is this solution based on?"
- "Would we build this if we had no existing code?"

### During Prioritization
- "Why is this important?" (keep asking until you hit bedrock)
- "What if we did the opposite?"
- "Are we copying competitors or solving our user's problem?"

### During Retrospectives
- "What assumptions did we make that turned out wrong?"
- "What should we question next time?"

---

## The First Principles Checklist

Before finalizing any major decision:

- [ ] I can list my top 3 assumptions
- [ ] I know where each assumption came from
- [ ] I've asked "why" at least 3 times on the core problem
- [ ] I've considered what a smart outsider would question
- [ ] I'm not just copying what competitors do
- [ ] I've identified what would have to be true for my decision to be wrong

---

**Remember:** First principles thinking is slow and effortful. Use it for important decisions, not every decision. The goal is to have it as a tool you can deploy when conventional thinking isn't working.
