# Observability Quick Cheatsheet

---

## The Analogies

| Tool | Analogy | What It Stores |
|------|---------|----------------|
| **Database** | Your app's **memory** | Business data (users, orders) |
| **Observability** | Your app's **diary** | How things happened, why they failed |
| **Product Analytics** | Your app's **report card** | User behavior, feature adoption |

---

## Who Asks What?

| Question | Who Asks | Tool |
|----------|----------|------|
| "Why did this request fail?" | **Engineer** | Observability |
| "What's causing the 2% error rate?" | **PM** (using observability data) | Observability |
| "What features do users click?" | **PM** | Product Analytics |
| "How many users drop off at step 3?" | **PM** | Product Analytics |

**Key insight:** Technical "why" questions = observability. User behavior "what" questions = product analytics.

---

## Impact Calculation (Critical for PMs!)

### Formula
```
Affected Users = Total Users × Error Rate
```

### Example
| Feature | Users | Error Rate | Affected/Day | Priority |
|---------|-------|------------|--------------|----------|
| A | 100 | 0.5% | 100 × 0.005 = **0.5** | Lower |
| B | 10,000 | 0.1% | 10,000 × 0.001 = **10** | **Higher** |

**Gotcha:** Don't just look at error rate! Feature B has a lower error rate (0.1% vs 0.5%) but affects **20x more users**.

### Quick Math Shortcuts
| Error Rate | Multiply Users By |
|------------|-------------------|
| 0.1% | ÷ 1000 |
| 0.5% | ÷ 200 |
| 1% | ÷ 100 |
| 2% | ÷ 50 |
| 5% | ÷ 20 |
| 10% | ÷ 10 |

---

## P95 vs Average

| Metric | Meaning | Example |
|--------|---------|---------|
| **Average** | Sum ÷ Count | If 99 requests take 100ms and 1 takes 10s, average = 199ms |
| **P95** | 95% of requests are faster than this | Same example: P95 might be ~100ms |
| **P99** | 99% of requests are faster than this | Same example: P99 = 10s |

**Why P95 matters:** Average hides outliers. P95 shows what your worst (non-extreme) users experience.

---

## Tool Selection Quick Guide

| Need | Best Tool | Why |
|------|-----------|-----|
| Debug specific user's request | **Honeycomb** | High-cardinality queries |
| All-in-one enterprise monitoring | **Datadog** | Comprehensive platform |
| Log search + compliance | **Splunk** | SIEM capabilities |
| Kubernetes metrics | **Prometheus** | Built for K8s |
| User behavior tracking | **PostHog/Amplitude** | Product analytics |

**Gotcha:** Splunk is for logs/compliance, not for debugging specific user requests. Use Honeycomb for high-cardinality debugging.

---

## Three Pillars Quick Reference

| Pillar | What It Is | Example |
|--------|-----------|---------|
| **Logs** | Event records | `ERROR: Payment failed for user 123` |
| **Metrics** | Numbers over time | `error_rate: 2.5%`, `latency_p95: 1.2s` |
| **Traces** | Request journey | `User → Auth → Product → Payment (FAILED)` |

**Not a pillar:** Dashboards (they visualize pillars, but aren't data themselves)

---

## Questions to Ask Engineering

### Bad Questions (Vague)
- "Is the app working?"
- "Why is it slow?"
- "Can you fix the bug?"

### Good Questions (Specific)
- "What's the P95 latency for /checkout this week?"
- "What's the error rate for enterprise users vs free users?"
- "Can we look up session ID xyz123 to see what happened?"

---

## Incident Response Checklist

When engineering says "we have elevated errors":

1. **Blast radius** - How many users affected?
2. **Segments** - Enterprise vs free? Mobile vs web? Region?
3. **Timeline** - When did it start? Recent deploys?
4. **Trend** - Getting better or worse?
5. **Root cause** - Which service is failing?

---

## Common Mistakes

| Mistake | Correction |
|---------|------------|
| Prioritizing by error rate alone | Calculate **total affected users** |
| Thinking "request failed" is a PM question | It's an **engineering** question |
| Confusing P95 with average | P95 = 95% of requests are **faster** than this |
| Using Splunk for user debugging | Use **Honeycomb** for high-cardinality |
| Thinking dashboards are a "pillar" | The 3 pillars are **logs, metrics, traces** |

---

## One-Liner Definitions

- **Observability:** Ability to understand system state from outputs
- **Monitoring:** Checking if known things are working
- **Trace:** A request's journey through all services
- **High cardinality:** Lots of unique values (user IDs, session IDs)
- **P95:** 95% of requests are faster than this number

---
