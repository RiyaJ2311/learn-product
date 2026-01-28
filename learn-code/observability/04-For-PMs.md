# Observability for Product Managers

## Why You Should Care

Observability isn't just an engineering concern. As a PM, understanding observability gives you:

1. **Data for decisions** - Real user behavior, not assumptions
2. **Incident context** - Know what happened when things break
3. **Feature validation** - See if what you built actually works
4. **Stakeholder communication** - Speak the same language as engineering

---

## The PM Perspective

```
┌─────────────────────────────────────────────────────────────┐
│ OBSERVABILITY FOR PMs                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  WHAT ENGINEERS SEE                                         │
│  ──────────────────                                         │
│  "Request latency P95 is 2.3s, traced to database          │
│   connection pooling issue in the search service"          │
│                                                             │
│  WHAT PMs SHOULD ASK                                        │
│  ───────────────────                                        │
│  "How many users are affected? Enterprise or free tier?    │
│   What's the business impact? What's the fix timeline?"    │
│                                                             │
│  BRIDGING THE GAP                                           │
│  ────────────────                                           │
│  Good observability lets you answer both questions         │
│  with the same data.                                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## What You Don't Need to Know

You don't need to:
- Configure observability tools
- Write instrumentation code
- Interpret raw log files
- Understand distributed tracing internals

---

## What You DO Need to Know

### 1. The Three Pillars (High-Level)

| Pillar | What It Is | PM Use Case |
|--------|-----------|-------------|
| **Logs** | Event records | "What exactly happened when user X reported an issue?" |
| **Metrics** | Numbers over time | "What's our success rate? How does it trend?" |
| **Traces** | Request journey | "Where is the bottleneck slowing down checkout?" |

### 2. Key Questions to Ask

**During incidents:**
- "What's the blast radius?" (how many users affected)
- "Is this affecting specific user segments?" (enterprise vs free)
- "When did this start?" (correlate with deploys/changes)
- "What's the session ID?" (find specific user issues)

**For feature launches:**
- "Can we see adoption metrics for the new feature?"
- "What's the error rate for users trying feature X?"
- "Are there performance differences between user segments?"

**For prioritization:**
- "Which errors affect the most users?"
- "What features have the highest failure rates?"
- "Where do users drop off in the funnel?"

---

## Practical PM Scenarios

### Scenario 1: User Reports a Bug

**Without observability:**
```
User: "The app crashed when I tried to checkout"
You: "Can you reproduce it? What browser? What time?"
Result: Days of back-and-forth, maybe never fixed
```

**With observability:**
```
User: "The app crashed when I tried to checkout"
You: "What's your session ID or email?"
Engineering: [Looks up session, sees exact error]
Result: Root cause found, fixed
```

**What to ask:** "Can we look up this user's session trace?"

---

### Scenario 2: Feature Launch Validation

**Without observability:**
```
Launch new feature
Wait for support tickets
Assume it's working if no complaints
```

**With observability:**
```
Launch new feature
Check: Adoption rate, error rate, latency
See: 15% of users hitting edge case error
Fix before it becomes a support ticket
```

**What to ask:** "What are the success/error rates for the new feature?"

---

### Scenario 3: Performance Prioritization

**Without observability:**
```
"Users say the app is slow"
Engineering: "It's complicated"
You: "Should we prioritize this?"
[Guessing game ensues]
```

**With observability:**
```
"Users say the app is slow"
Check: P95 latency is 4.2s (target: 2s)
Trace: 80% of time spent in image loading
Decision: Prioritize image optimization
```

**What to ask:** "What's our P95 latency and where is the time spent?"

---

## Key Metrics PMs Should Track

### User Experience Metrics

| Metric | What It Tells You | Target (Typical) |
|--------|-------------------|------------------|
| **Success Rate** | % of requests that succeed | > 99.5% |
| **P50 Latency** | Typical response time | < 500ms |
| **P95 Latency** | Worst-case (non-outlier) | < 2s |
| **Error Rate by Feature** | Which features are flaky | < 0.5% |

### Business Metrics

| Metric | What It Tells You | Why It Matters |
|--------|-------------------|----------------|
| **Feature Adoption** | Who's using new features | Validates PM decisions |
| **Funnel Drop-off** | Where users abandon | Prioritization signal |
| **Power User Behavior** | What successful users do | Product direction |

---

## Talking to Engineering

### Questions That Get Results

Instead of:
- "Is the app working?"
- "Why is it slow?"
- "Can you fix the bug?"

Try:
- "What's the success rate for checkout this week?"
- "What's the P95 latency for search, and what's causing it?"
- "Can we trace session X to see what happened?"

### Vocabulary Cheat Sheet

| Term | Meaning | Example |
|------|---------|---------|
| **P50/P95/P99** | Percentile latency | "P95 is 2s" = 95% of requests under 2s |
| **Trace** | Full request journey | "Show me the trace for this session" |
| **High cardinality** | Lots of unique values | User IDs, session IDs, etc. |
| **Instrumentation** | Adding observability to code | "Is this feature instrumented?" |
| **Dashboard** | Visual display of metrics | "Can I see the checkout dashboard?" |
| **Alert** | Automatic notification | "What alerts fire for this?" |

---

## What to Request from Engineering

### Must-Haves

1. **User-level visibility**
   - "Given a user ID, can we see their sessions?"
   - Enables: Debugging user-reported issues

2. **Feature-level metrics**
   - "Success/error rate per feature"
   - Enables: Prioritization, launch validation

3. **Business dashboards**
   - Conversion funnels, adoption rates
   - Enables: Data-driven decisions

### Nice-to-Haves

4. **Segment breakdowns**
   - Enterprise vs free, mobile vs desktop
   - Enables: Targeted improvements

5. **Cost visibility** (for AI products)
   - Token usage, API costs per feature
   - Enables: Unit economics analysis

---

## Red Flags: Signs of Poor Observability

Watch for these in your organization:

```
┌─────────────────────────────────────────────────────────────┐
│ RED FLAGS                                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  "We can't reproduce that bug"                              │
│  → No session tracing                                       │
│                                                             │
│  "We don't know how many users are affected"                │
│  → No user-level correlation                                │
│                                                             │
│  "We'll know if the feature works by support tickets"       │
│  → No proactive monitoring                                  │
│                                                             │
│  "The dashboard doesn't have that metric"                   │
│  → Inflexible observability (can't query arbitrary data)   │
│                                                             │
│  "It works on my machine"                                   │
│  → No production visibility                                 │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## AI Products: Special Considerations

If you're a PM for AI products, observability is even more critical:

### Why AI Is Different

| Traditional Software | AI Systems |
|---------------------|------------|
| Deterministic: same input = same output | Non-deterministic: same prompt ≠ same response |
| Binary success/failure | Quality is subjective |
| Fixed costs | Costs scale with usage (tokens) |

### What to Track for AI

1. **Quality metrics** - User satisfaction, thumbs up/down
2. **Cost per task** - Tokens used, dollars spent
3. **Decision paths** - What tools did the agent use?
4. **Failure modes** - Why did the AI give wrong answers?

**See:** [AI Agent Observability](../../08-AI-Skills/04-Building-Agents/05-Observability.md)

---

## Action Items

### Immediate

1. **Get access** - Ask for read access to observability dashboards
2. **Learn the vocabulary** - Use the cheat sheet above
3. **Start asking** - Use specific questions, not vague ones

### Ongoing

4. **Review metrics weekly** - Make it part of your routine
5. **Correlate releases with metrics** - Did the change help?
6. **Advocate for observability** - Push for user-level visibility

---

## Next Steps

- **Fundamentals:** [01-Fundamentals.md](01-Fundamentals.md)
- **Tool options:** [02-Tools-Overview.md](02-Tools-Overview.md)
- **History context:** [03-History.md](03-History.md)
- **AI-specific:** [../../08-AI-Skills/04-Building-Agents/05-Observability.md](../../08-AI-Skills/04-Building-Agents/05-Observability.md)

---

*Observability isn't about understanding the technical details. It's about having the data you need to make better product decisions.*
