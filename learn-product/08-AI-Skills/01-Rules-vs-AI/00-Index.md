# Module 1: Rules vs AI

## 2-Minute Overview

The most important AI skill isn't prompt engineering or knowing the latest models. It's knowing **when NOT to use AI**. This module teaches you the decision framework for choosing between traditional code/rules and AI—potentially saving you months of wasted effort.

**Your Context:** AI is exciting, but not every problem needs it. In fact, many AI projects fail because AI was the wrong solution.

**Your Goal:** Develop a gut instinct for when AI adds value vs. when simpler solutions win.

---

## Why This Matters

The #1 mistake companies make with AI:

```
┌─────────────────────────────────────────────────────────────┐
│ THE AI HAMMER PROBLEM                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  "When you have a hammer, everything looks like a nail"     │
│                                                             │
│  ❌ Common pattern:                                         │
│     1. Team gets excited about AI                           │
│     2. Builds complex AI solution                           │
│     3. Realizes simple rules would have worked              │
│     4. Months wasted, budget blown                          │
│                                                             │
│  ✅ Better pattern:                                         │
│     1. Define the problem clearly                           │
│     2. Ask: "Would simple rules work?"                      │
│     3. If yes: Use rules                                    │
│     4. If no: Consider AI                                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Module Contents

| Part | Title | What You'll Learn |
|------|-------|-------------------|
| 01 | When to Use Rules | Situations where code/rules beat AI |
| 02 | When to Use AI | Situations where AI is the right choice |
| 03 | Decision Framework | A practical framework for any decision |

---

## The Quick Decision Guide

Ask yourself these questions:

```
┌─────────────────────────────────────────────────────────────┐
│ QUICK DECISION FLOWCHART                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Is the process deterministic?                              │
│  (Same input always gives same output)                      │
│     │                                                        │
│     ├── YES → Use Rules                                     │
│     │                                                        │
│     └── NO ↓                                                │
│                                                             │
│  Can you define all the rules explicitly?                   │
│     │                                                        │
│     ├── YES → Use Rules                                     │
│     │                                                        │
│     └── NO ↓                                                │
│                                                             │
│  Does it require understanding natural language?            │
│     │                                                        │
│     ├── YES → Consider AI                                   │
│     │                                                        │
│     └── NO ↓                                                │
│                                                             │
│  Is there a pattern you can't articulate?                   │
│     │                                                        │
│     ├── YES → Consider AI                                   │
│     │                                                        │
│     └── NO → Use Rules                                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## The Spectrum

It's not always either/or—there's a spectrum:

```
RULES                              HYBRID                              AI
───────────────────────────────────────────────────────────────────────────
 ◄────────────────────────────────────────────────────────────────────────►

 • Deterministic                   • Rules + AI                    • Ambiguous
 • Known inputs                    • AI for routing                • Natural language
 • Explicit logic                  • Rules for action              • Pattern recognition
 • Speed critical                  • Best of both                  • Creative tasks

 Examples:                         Examples:                        Examples:
 • Tax calculation                 • Smart routing                 • Content generation
 • Form validation                 • Intent + action               • Sentiment analysis
 • Data transformation             • Triage + workflow             • Code generation
```

---

## Common Scenarios

### Definitely Use Rules

| Scenario | Why Rules Win |
|----------|---------------|
| Calculating prices | Math is deterministic |
| Form validation | Known rules (email format, required fields) |
| Workflow routing | If X, then Y logic |
| Data transformation | Predictable mappings |
| Compliance checks | Explicit regulations |
| State machines | Defined states and transitions |

### Definitely Use AI

| Scenario | Why AI Wins |
|----------|-------------|
| Summarizing documents | Requires understanding |
| Sentiment analysis | Subtle patterns |
| Writing content | Creative generation |
| Natural language search | Understanding intent |
| Image analysis | Pattern recognition |
| Code generation | Complex reasoning |

### Consider Hybrid

| Scenario | How Hybrid Works |
|----------|------------------|
| Customer support | AI understands intent → Rules route to team |
| Document processing | AI extracts data → Rules validate format |
| Recommendations | Rules filter candidates → AI ranks them |
| Content moderation | AI flags content → Rules enforce policy |

---

## Cost Comparison

```
┌─────────────────────────────────────────────────────────────┐
│ TOTAL COST COMPARISON                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│               RULES                    AI                   │
│               ─────                    ──                   │
│                                                             │
│  Dev cost     Higher upfront          Lower upfront         │
│               (write all logic)       (use existing models) │
│                                                             │
│  Run cost     Near zero               Per-request cost      │
│               (CPU only)              ($0.001-$0.10 each)   │
│                                                             │
│  Maintenance  Updates = new code      Updates = new prompts │
│               Slower to change        Faster to change      │
│                                                             │
│  Scaling      Cheap                   Expensive             │
│               (1M requests ~ $0)      (1M requests ~ $1K+)  │
│                                                             │
│  Accuracy     100% if coded right     95-99% (varies)       │
│               Fails predictably       Fails unpredictably   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## The Key Questions

Before choosing AI, ask:

1. **Can I write down all the rules?**
   - If yes → Use rules
   - If there are too many edge cases to enumerate → Consider AI

2. **How important is 100% accuracy?**
   - Critical (financial, legal) → Lean toward rules
   - 95%+ acceptable → AI is an option

3. **What's the volume?**
   - High volume, simple decisions → Rules (cost-effective)
   - Low volume, complex decisions → AI (acceptable cost)

4. **How fast does it need to be?**
   - Milliseconds → Rules
   - Seconds acceptable → AI is okay

5. **Does it need to understand language?**
   - Yes → AI likely needed
   - No → Rules probably sufficient

---

## Success Metrics

### When Rules Are Working

- Consistent, predictable behavior
- Zero cost per additional request
- Fast response times
- Easy to audit and explain

### When AI Is Working

- Handles edge cases gracefully
- Reduces manual work significantly
- Users find it "intelligent"
- Accuracy meets business requirements

### When You Chose Wrong

- AI: Costs exploding with scale
- AI: Too many errors in production
- Rules: Endless edge case handling
- Rules: Can't keep up with variations

---

## Start Here

**Go to:** [01-When-to-Use-Rules.md](01-When-to-Use-Rules.md)

Or based on your situation:
- "I have a straightforward process to automate" → [01-When-to-Use-Rules.md](01-When-to-Use-Rules.md)
- "I need to understand natural language" → [02-When-to-Use-AI.md](02-When-to-Use-AI.md)
- "I need help deciding" → [03-Decision-Framework.md](03-Decision-Framework.md)
