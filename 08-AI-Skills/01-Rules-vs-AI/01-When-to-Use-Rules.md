# When to Use Rules

## Quick Take

Rules-based systems (traditional code, if-then logic, decision trees) have been solving problems for decades. They're battle-tested, reliable, and often the right choice. This chapter helps you recognize when rules are the better solution.

**Remember:** Simple, predictable, and fast usually beats smart, variable, and slow.

---

## The Case for Rules

Rules aren't outdated, they're often optimal:

```
┌─────────────────────────────────────────────────────────────┐
│ RULES ADVANTAGES                                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ✓ 100% Deterministic                                       │
│    Same input → Same output, every time                     │
│                                                             │
│  ✓ Zero Marginal Cost                                       │
│    No per-request API fees                                  │
│                                                             │
│  ✓ Millisecond Speed                                        │
│    Local computation, no network calls                      │
│                                                             │
│  ✓ Fully Explainable                                        │
│    "It did X because of rule Y"                            │
│                                                             │
│  ✓ Auditable                                                │
│    You can trace every decision                             │
│                                                             │
│  ✓ Testable                                                 │
│    Unit tests can cover all cases                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## When Rules Beat AI

### 1. Deterministic Calculations

If the same input should always produce the same output, use rules.

**Examples:**
- Tax calculations
- Pricing logic
- Interest rate computations
- Unit conversions
- Date calculations

```
// Tax calculation - Rules are perfect
function calculateTax(income, state) {
  const brackets = TAX_BRACKETS[state]
  let tax = 0
  for (const bracket of brackets) {
    if (income > bracket.min) {
      tax += Math.min(income - bracket.min, bracket.max - bracket.min) * bracket.rate
    }
  }
  return tax
}
```

**Why not AI?** AI would add variability to something that should be exact.

---

### 2. Known, Enumerable Rules

If you can list all the rules, you don't need AI to figure them out.

**Examples:**
- Form validation (email format, required fields, character limits)
- Password requirements
- Business hours calculation
- Eligibility checks
- Status transitions

```
// Form validation - Rules are perfect
function validateEmail(email) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
  return emailRegex.test(email)
}

function validatePassword(password) {
  return password.length >= 8 &&
         /[A-Z]/.test(password) &&
         /[0-9]/.test(password)
}
```

**Why not AI?** The rules are known. AI would just add latency and cost.

---

### 3. Speed-Critical Operations

If response time is measured in milliseconds, rules are your friend.

**Examples:**
- Request routing
- Cache decisions
- Rate limiting
- Load balancing
- Real-time filtering

```
┌─────────────────────────────────────────────────────────────┐
│ SPEED COMPARISON                                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Operation              Rules        AI (API)               │
│  ─────────              ─────        ────────               │
│  Form validation        < 1ms        500-2000ms             │
│  Routing decision       < 1ms        500-2000ms             │
│  Price calculation      < 1ms        500-2000ms             │
│  Data transformation    1-10ms       500-2000ms             │
│                                                             │
│  For real-time operations, this difference matters!        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

### 4. High-Volume, Low-Complexity

When you have millions of requests for simple decisions, rules are economical.

**Example cost comparison:**

```
┌─────────────────────────────────────────────────────────────┐
│ COST AT SCALE                                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Scenario: 1 million form validations per month             │
│                                                             │
│  RULES APPROACH                                             │
│  ───────────────                                            │
│  Server cost: ~$50/month (handles easily)                   │
│  Total: $50/month                                           │
│                                                             │
│  AI APPROACH (GPT-4o)                                       │
│  ───────────────────                                        │
│  Per validation: ~100 tokens in, ~50 tokens out             │
│  Cost: $0.00025 + $0.0005 = $0.00075 per validation        │
│  Total: $750/month                                          │
│                                                             │
│  Rules are 15x cheaper for this use case                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

### 5. Compliance and Auditability

When you need to explain exactly why a decision was made, rules provide clear audit trails.

**Examples:**
- Loan approval decisions
- Insurance underwriting
- Access control
- Regulatory compliance
- Healthcare eligibility

```
// Audit-friendly decision
function assessLoanEligibility(applicant) {
  const reasons = []

  if (applicant.creditScore < 600) {
    reasons.push("Credit score below 600 threshold")
  }
  if (applicant.debtToIncome > 0.43) {
    reasons.push("Debt-to-income ratio exceeds 43%")
  }
  if (applicant.employmentYears < 2) {
    reasons.push("Less than 2 years at current employer")
  }

  return {
    approved: reasons.length === 0,
    reasons: reasons  // Clear explanation
  }
}
```

**Why not AI?** "The AI said no" isn't acceptable for regulated decisions.

---

### 6. State Machines

When your system has defined states and transitions, rules model this perfectly.

**Examples:**
- Order status workflows
- User account states
- Document approval processes
- Subscription lifecycle
- Support ticket states

```
┌─────────────────────────────────────────────────────────────┐
│ STATE MACHINE EXAMPLE: ORDER STATUS                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────┐    pay    ┌─────────┐   ship   ┌───────────┐  │
│  │ PENDING │ ────────► │  PAID   │ ───────► │  SHIPPED  │  │
│  └────┬────┘           └────┬────┘          └─────┬─────┘  │
│       │                     │                     │        │
│       │ cancel              │ refund              │ deliver│
│       │                     │                     │        │
│       ▼                     ▼                     ▼        │
│  ┌─────────┐           ┌─────────┐          ┌───────────┐  │
│  │CANCELLED│           │REFUNDED │          │ DELIVERED │  │
│  └─────────┘           └─────────┘          └───────────┘  │
│                                                             │
│  Each transition has clear rules. AI isn't needed.         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Real Product Examples

### Example 1: E-commerce Cart

**Task:** Calculate cart total with discounts

```
✅ RULES APPROACH:
- Subtotal = sum of (item price × quantity)
- Apply percentage discount if coupon valid
- Apply free shipping if subtotal > $50
- Calculate tax based on shipping state
- Total = subtotal - discount + shipping + tax

This is 100% deterministic. Rules are perfect.
```

### Example 2: User Permission Check

**Task:** Determine if user can perform action

```
✅ RULES APPROACH:
- Check user role
- Check resource ownership
- Check action permissions for role
- Return yes/no

Permissions are explicit rules. No AI needed.
```

### Example 3: Notification Scheduling

**Task:** Decide when to send notifications

```
✅ RULES APPROACH:
- Don't send between 10pm-8am user time
- Don't send more than 3/day per user
- Batch non-urgent notifications
- Send urgent immediately

These are explicit business rules.
```

---

## Warning Signs You Should Use Rules

| If you're doing this... | You probably need rules |
|-------------------------|-------------------------|
| Looking up values in a table | Database query, not AI |
| Applying formulas | Mathematical computation |
| Following explicit policies | Business rules engine |
| Checking conditions | If-then logic |
| Transforming data formats | Data mapping/ETL |
| Validating against patterns | Regex or schema validation |

---

## The Rules Implementation Toolkit

### For Simple Logic
```
// Plain if-else
if (condition) {
  action()
}
```

### For Complex Conditions
```
// Decision tables
const rules = [
  { when: {age: '>65', income: '<50000'}, then: 'eligible' },
  { when: {age: '<65', veteran: true}, then: 'eligible' },
  { otherwise: 'not_eligible' }
]
```

### For Workflows
```
// State machines
const orderStateMachine = {
  pending: { pay: 'paid', cancel: 'cancelled' },
  paid: { ship: 'shipped', refund: 'refunded' },
  shipped: { deliver: 'delivered' }
}
```

### For Validation
```
// JSON Schema
{
  "type": "object",
  "required": ["email", "name"],
  "properties": {
    "email": { "type": "string", "format": "email" },
    "name": { "type": "string", "minLength": 1 }
  }
}
```

---

## Things to Remember

1. **If you can enumerate all cases, use rules**
2. **If it must be deterministic, use rules**
3. **If speed matters (<100ms), use rules**
4. **If scale matters (millions of requests), use rules for cost**
5. **If auditability matters, use rules**
6. **Don't use AI as a fancy if-statement**

---

## Decision Checklist

Before reaching for AI, check these boxes:

- [ ] I cannot enumerate all the rules
- [ ] Some inputs require judgment/interpretation
- [ ] Slight variation in outputs is acceptable
- [ ] Response time of 500ms+ is acceptable
- [ ] Cost per request is acceptable at scale
- [ ] "The AI decided" is an acceptable explanation

**If you can't check most of these, use rules.**

---

**Next:** [02-When-to-Use-AI.md](02-When-to-Use-AI.md) - When AI is the right choice
