# Architecture Trade-offs

## The Fundamental Truth

Every architecture decision is a trade-off. There are no "best practices" without context.

---

## CAP Theorem

You can only have 2 of 3:

```
┌─────────────────────────────────────────────────────────────┐
│ CAP THEOREM                                                  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│              Consistency                                    │
│                  /\                                         │
│                 /  \                                        │
│                /    \                                       │
│               / CA   \  CP                                  │
│              /________\                                     │
│         Availability ── Partition                           │
│                    AP   Tolerance                           │
│                                                             │
│  In practice: Network partitions happen                    │
│  So you choose: Consistency OR Availability                │
│                                                             │
│  CP: Refuse to respond if can't guarantee consistency      │
│      Example: Banks, inventory systems                      │
│                                                             │
│  AP: Always respond, may have stale data                   │
│      Example: Social feeds, caches                          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Real-World Translation

| Need | Choose | Accept |
|------|--------|--------|
| Banking transactions | Consistency | Temporary unavailability |
| Social media feed | Availability | Stale posts |
| Shopping cart | Availability | May show sold-out items |
| Payment processing | Consistency | Timeouts, retries |

---

## Consistency Models

### Strong Consistency

All reads see the most recent write.

```
Write: X = 5
Read: X → Always 5
```

**Cost:** Slower, more complex, less available

### Eventual Consistency

Reads may see old data, but will eventually be consistent.

```
Write: X = 5
Read: X → Might be 4 (old value)
Wait...
Read: X → Eventually 5
```

**Cost:** Application complexity, user confusion

### When to Use Each

| Use Strong Consistency | Use Eventual Consistency |
|----------------------|-------------------------|
| Financial transactions | Social feeds |
| Inventory reservations | Recommendation updates |
| User authentication | Analytics |
| Critical business data | Caches |

---

## Performance Trade-offs

### Latency vs Throughput

```
OPTIMIZE FOR LATENCY:
- Single fast server
- In-memory caching
- Sync operations
- Example: Real-time gaming

OPTIMIZE FOR THROUGHPUT:
- Batch processing
- Queues
- Async operations
- Example: Data pipelines
```

### Memory vs Computation

```
MORE MEMORY (Caching):
- Faster reads
- Higher costs
- Stale data risk
- Example: CDN, Redis

MORE COMPUTATION:
- Always fresh data
- Slower responses
- CPU-bound scaling
- Example: On-demand processing
```

---

## Complexity Trade-offs

### Simple Now vs Flexible Later

```
┌─────────────────────────────────────────────────────────────┐
│ THE COMPLEXITY CURVE                                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  YAGNI: Build for today                                    │
│  ─────────────────────                                     │
│  ✓ Ship faster now                                          │
│  ✓ Less code to maintain                                    │
│  ✗ May need rewrite later                                   │
│                                                             │
│  "Future-Proof": Build for tomorrow                        │
│  ───────────────────────────────────                       │
│  ✓ Easier to extend later                                   │
│  ✗ Slower to ship now                                       │
│  ✗ May solve wrong problems                                 │
│                                                             │
│  RECOMMENDATION: Bias toward simplicity                    │
│  Complexity is easy to add, hard to remove                 │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Monolith vs Microservices

| Factor | Monolith | Microservices |
|--------|----------|---------------|
| **Development speed** | Faster initially | Slower initially |
| **Operational complexity** | Lower | Higher |
| **Team scaling** | Harder | Easier |
| **Technology flexibility** | Less | More |
| **Debugging** | Easier | Harder |
| **Deployment risk** | Higher (all at once) | Lower (one service) |

**Rule of thumb:** Start monolith, extract when pain is clear.

---

## Security Trade-offs

### Security vs Usability

```
MORE SECURE:
- 2FA required
- Short session timeouts
- Strict password rules
- = More user friction

MORE USABLE:
- Remember me forever
- Simple passwords OK
- Auto-login
- = Less secure
```

### Security vs Performance

```
MORE SECURE:
- Encrypt everything
- Validate every request
- Log all access
- = Slower, more expensive

MORE PERFORMANT:
- Trust internal network
- Skip some validation
- Less logging
- = More attack surface
```

---

## Cost Trade-offs

### Build vs Buy

```
BUILD:
- Full control
- Fits exactly
- Maintenance burden
- Time to market slower

BUY/USE SaaS:
- Faster start
- Less control
- Vendor lock-in
- Monthly cost forever
```

### Compute vs Storage

```
STORE MORE:
- Pre-compute results
- Faster reads
- Storage costs
- Example: Materialized views

COMPUTE MORE:
- Calculate on demand
- Always fresh
- CPU costs
- Example: Real-time aggregation
```

---

## Making Trade-off Decisions

### Framework for Decision

```
1. What problem are we solving?
   (Not "what's the best architecture")

2. What are the constraints?
   - Team size/skills
   - Timeline
   - Budget
   - Regulatory

3. What are we optimizing for?
   - Speed to market
   - Scalability
   - Maintainability
   - Cost

4. What are we willing to sacrifice?
   (Everything has a cost)

5. How reversible is this decision?
   (Prefer reversible)
```

### Document Decisions

Use Architecture Decision Records (ADRs):

```markdown
# ADR 001: Use PostgreSQL for primary database

## Status: Accepted

## Context
We need a database for our user and order data.

## Decision
Use PostgreSQL.

## Consequences
- Team already knows PostgreSQL
- Gives up NoSQL flexibility
- May need to shard later at scale
```

---

## AI Agent Trade-offs

```
┌─────────────────────────────────────────────────────────────┐
│ AI AGENT TRADE-OFFS                                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  COST vs QUALITY                                            │
│  ──────────────                                             │
│  GPT-4: Better quality, expensive                          │
│  GPT-3.5: Cheaper, less capable                            │
│  → Route by task complexity                                │
│                                                             │
│  AUTONOMY vs CONTROL                                        │
│  ───────────────────                                        │
│  More autonomy: Faster, may make mistakes                  │
│  More control: Slower, safer                               │
│  → Human-in-the-loop for high stakes                       │
│                                                             │
│  CONTEXT vs COST                                            │
│  ──────────────                                             │
│  More context: Better decisions, more tokens               │
│  Less context: Cheaper, may miss important info            │
│  → Summarize, prioritize relevant context                  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Next Steps

- **Evolution:** [04-Evolution.md](04-Evolution.md)
- **Patterns:** [02-Patterns.md](02-Patterns.md)
- **Fundamentals:** [01-Fundamentals.md](01-Fundamentals.md)

---

*The best architects don't have all the answers—they ask the right questions.*
