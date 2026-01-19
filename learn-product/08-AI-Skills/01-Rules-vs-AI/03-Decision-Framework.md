# The Decision Framework

## 2-Minute Overview

Now that you understand when rules work and when AI works, you need a practical framework to make the call. This chapter gives you a step-by-step process you can use for any feature decision.

**The key insight:** The decision isn't always binary. Often the best solution combines rules and AI in a hybrid approach.

---

## The Decision Matrix

Start here for quick decisions:

```
┌─────────────────────────────────────────────────────────────┐
│ THE RULES vs AI DECISION MATRIX                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│                     │ Can define all rules │ Can't define  │
│                     │ (Deterministic)      │ all rules     │
│  ───────────────────┼──────────────────────┼──────────────  │
│                     │                      │               │
│  Speed critical     │     RULES            │  RULES +      │
│  (< 100ms)          │     (pure)           │  Caching      │
│                     │                      │               │
│  ───────────────────┼──────────────────────┼──────────────  │
│                     │                      │               │
│  Speed flexible     │     RULES            │  AI or        │
│  (> 500ms OK)       │     (still better)   │  HYBRID       │
│                     │                      │               │
│  ───────────────────┼──────────────────────┼──────────────  │
│                     │                      │               │
│  Language/          │     AI               │  AI           │
│  Creative needed    │     (required)       │  (clearly)    │
│                     │                      │               │
└─────────────────────────────────────────────────────────────┘
```

---

## The 5-Question Framework

Ask these questions in order:

### Question 1: Is it deterministic?

**Definition:** Same input must always produce the exact same output.

```
YES → Use Rules
NO  → Continue to Question 2
```

**Examples:**
- Tax calculation → YES → Rules
- Sentiment analysis → NO → Continue

---

### Question 2: Can I enumerate all cases?

**Definition:** Can you list every possible input pattern and its correct output?

```
YES → Use Rules
NO  → Continue to Question 3
```

**Examples:**
- Form validation → YES → Rules
- Customer intent → NO → Continue

---

### Question 3: Is natural language involved?

**Definition:** Does the system need to understand free-form human language?

```
YES → AI is likely needed
NO  → Continue to Question 4
```

**Examples:**
- Chatbot → YES → AI
- Data transform → NO → Continue

---

### Question 4: What accuracy is acceptable?

**Definition:** What error rate can the business tolerate?

```
Must be 100% → Rules (or AI + human review)
95-99% OK   → AI is viable
< 95% OK    → AI is definitely fine
```

**Examples:**
- Loan decisions → 100% → Rules (or AI + human approval)
- Email categorization → 95% OK → AI

---

### Question 5: What's the cost/volume math?

**Definition:** At your expected volume, is AI cost-effective?

```
Calculate: (requests/month) × (cost/request) = monthly AI cost

If monthly AI cost > value delivered → Rules or Hybrid
If monthly AI cost < value delivered → AI is fine
```

**Example calculation:**
```
Feature: AI-powered product descriptions
Requests: 1,000/month
Cost per request: $0.01
Monthly cost: $10

Value: Saves 2 hours of writing time × $50/hr = $100/month
ROI: 10x → AI makes sense
```

---

## The Hybrid Approach

Often the best solution uses both:

```
┌─────────────────────────────────────────────────────────────┐
│ HYBRID ARCHITECTURE PATTERNS                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  PATTERN 1: AI for Understanding, Rules for Action          │
│  ─────────────────────────────────────────────────          │
│                                                             │
│  Customer message                                           │
│       │                                                     │
│       ▼                                                     │
│  ┌─────────┐                                               │
│  │   AI    │ → Extracts: intent, sentiment, entities       │
│  └────┬────┘                                               │
│       │                                                     │
│       ▼                                                     │
│  ┌─────────┐                                               │
│  │  RULES  │ → Routes: billing team, technical team, etc.  │
│  └────┬────┘                                               │
│       │                                                     │
│       ▼                                                     │
│  Action taken                                               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│  PATTERN 2: Rules First, AI for Exceptions                  │
│  ────────────────────────────────────────────               │
│                                                             │
│  Input                                                      │
│       │                                                     │
│       ▼                                                     │
│  ┌─────────┐     Yes                                       │
│  │ Rules   │ ────────────→ Handle with rules               │
│  │ match?  │                                               │
│  └────┬────┘                                               │
│       │ No                                                  │
│       ▼                                                     │
│  ┌─────────┐                                               │
│  │   AI    │ → Handle complex/ambiguous cases              │
│  └─────────┘                                               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│  PATTERN 3: AI Generates, Rules Validate                    │
│  ────────────────────────────────────────                   │
│                                                             │
│  Request                                                    │
│       │                                                     │
│       ▼                                                     │
│  ┌─────────┐                                               │
│  │   AI    │ → Generates content/decision                  │
│  └────┬────┘                                               │
│       │                                                     │
│       ▼                                                     │
│  ┌─────────┐     Pass                                      │
│  │ Rules   │ ──────────→ Use AI output                     │
│  │validate │                                               │
│  └────┬────┘                                               │
│       │ Fail                                                │
│       ▼                                                     │
│  Fallback or human review                                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Real-World Decision Examples

### Example 1: Customer Support Triage

**The problem:** Route support tickets to the right team

**Question walkthrough:**
1. Deterministic? No (customers phrase things many ways)
2. Enumerate all cases? No (infinite phrasing variations)
3. Natural language? Yes
4. Accuracy needed? 90% OK (humans can re-route)
5. Cost/volume? 10K tickets/month × $0.003 = $30/month

**Decision:** AI for classification, Rules for routing

```
┌─────────────┐     ┌───────────────┐     ┌─────────────┐
│   Ticket    │ ──▶ │ AI: Classify  │ ──▶ │Rules: Route │
│   arrives   │     │ intent/urgency│     │to team      │
└─────────────┘     └───────────────┘     └─────────────┘
```

---

### Example 2: Pricing Calculator

**The problem:** Show users accurate pricing based on selections

**Question walkthrough:**
1. Deterministic? Yes (price = base × quantity × discount)
2. Enumerate all cases? Yes (finite options)
3. Natural language? No
4. Accuracy needed? 100% (it's money)
5. Cost/volume? High volume, must be instant

**Decision:** Pure rules

```
function calculatePrice(basePrice, quantity, tier) {
  const discount = TIER_DISCOUNTS[tier]
  return basePrice * quantity * (1 - discount)
}
```

---

### Example 3: Product Description Generator

**The problem:** Create descriptions for 10K products

**Question walkthrough:**
1. Deterministic? No (creative writing)
2. Enumerate all cases? No (each product is unique)
3. Natural language? Yes (output is prose)
4. Accuracy needed? 95% OK (humans can review)
5. Cost/volume? 10K × $0.02 = $200 one-time

**Decision:** AI with human review

```
┌─────────────┐     ┌───────────────┐     ┌─────────────┐
│  Product    │ ──▶ │AI: Generate   │ ──▶ │Human: Quick │
│  attributes │     │description    │     │review       │
└─────────────┘     └───────────────┘     └─────────────┘
```

---

### Example 4: Fraud Detection

**The problem:** Flag potentially fraudulent transactions

**Question walkthrough:**
1. Deterministic? Partially (some rules are clear)
2. Enumerate all cases? No (fraudsters evolve)
3. Natural language? No
4. Accuracy needed? 99%+ (minimize false positives AND negatives)
5. Cost/volume? Very high volume, needs speed

**Decision:** Hybrid - Rules for known patterns, ML for anomalies

```
┌──────────────┐     ┌───────────────┐     ┌──────────────┐
│ Transaction  │ ──▶ │Rules: Known   │ ──▶ │ ML: Anomaly  │
│              │     │fraud patterns │     │ detection    │
└──────────────┘     └───────────────┘     └──────────────┘
```

---

## The Decision Worksheet

Use this for your next feature decision:

```
┌─────────────────────────────────────────────────────────────┐
│ RULES vs AI DECISION WORKSHEET                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│ Feature: _____________________________________________      │
│                                                             │
│ 1. Is it deterministic? □ Yes → Rules   □ No → Continue    │
│                                                             │
│ 2. Can enumerate all cases? □ Yes → Rules  □ No → Continue │
│                                                             │
│ 3. Natural language involved? □ Yes → AI likely  □ No      │
│                                                             │
│ 4. Accuracy required:                                       │
│    □ 100% (Rules)  □ 95-99% (AI possible)  □ <95% (AI OK) │
│                                                             │
│ 5. Cost calculation:                                        │
│    Expected volume: _______ requests/month                  │
│    AI cost per request: $______                            │
│    Monthly AI cost: $_______                                │
│    Value delivered: $_______                                │
│    ROI: ____x                                               │
│                                                             │
│ 6. Speed requirement:                                       │
│    □ <100ms (Rules)  □ 100-500ms (Rules/cached AI)         │
│    □ 500ms-5s (AI OK)  □ >5s (AI OK, maybe async)          │
│                                                             │
│ DECISION:                                                   │
│ □ Pure Rules                                                │
│ □ Pure AI                                                   │
│ □ Hybrid: AI for _________, Rules for _________            │
│                                                             │
│ Rationale: ___________________________________________     │
│ ______________________________________________________     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Anti-Patterns to Avoid

### Anti-Pattern 1: AI for Everything
"Let's use AI to validate email formats!"
**Problem:** Over-engineering simple problems

### Anti-Pattern 2: Rules for Everything
"We'll just add more regex patterns for customer intent"
**Problem:** Unbounded complexity, breaks at scale

### Anti-Pattern 3: All-or-Nothing Thinking
"We have to choose one approach"
**Problem:** Missing the hybrid sweet spot

### Anti-Pattern 4: Premature AI
"We'll build the AI-powered version first"
**Problem:** Rules MVP is often faster and cheaper to validate

---

## Key Takeaways

1. **Use the 5-question framework** for consistent decisions
2. **Hybrid approaches often win**—combine strengths of both
3. **Cost math matters**—AI at scale can be expensive
4. **Start with rules** when uncertain—you can add AI later
5. **Don't over-engineer**—simplest solution that works

---

## Practice Exercise

Apply the framework to this scenario:

**Feature:** Auto-categorize user-uploaded receipts into expense categories (meals, travel, supplies, etc.)

**Your analysis:**
```
1. Deterministic? _______________________________
2. Enumerate all cases? _________________________
3. Natural language? ____________________________
4. Accuracy required? ___________________________
5. Cost math? __________________________________

Decision: ______________________________________
Rationale: _____________________________________
```

**Suggested answer:**
```
1. Deterministic? No (receipts vary wildly)
2. Enumerate all cases? No (infinite formats)
3. Natural language? Yes (receipt text, merchant names)
4. Accuracy required? 90% OK (users can correct)
5. Cost math? Even at $0.01/receipt, manageable

Decision: AI (vision + language model)
Rationale: Receipts are unstructured, variable,
and require understanding text in context.
Rules would need thousands of merchant mappings.
```

---

**Next Module:** [../02-AI-Skills/00-Index.md](../02-AI-Skills/00-Index.md) — Advanced AI techniques
