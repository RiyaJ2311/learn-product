# Observability Quick Reference

## One-Sentence Summary

**Observability** is the ability to understand what's happening inside a system by examining its outputs (logs, metrics, traces).

---

## The Essential Concepts

### 1. Observability vs Monitoring

| | Monitoring | Observability |
|---|---|---|
| **Question** | "Is it working?" | "Why is it behaving this way?" |
| **Approach** | Check predefined metrics | Ask arbitrary questions |
| **Best for** | Known problems | Unknown problems |
| **Example** | "Is error rate < 1%?" | "Why did session X fail?" |

### 2. The Three Pillars

```
┌─────────────────────────────────────────────────────────────┐
│ THE THREE PILLARS                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  LOGS         → What happened, when, why                   │
│  METRICS      → How much, how fast, how many               │
│  TRACES       → The complete journey of one request        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Logs:** Text records of events
- Example: `[2026-01-28 10:23:45] Agent started task`
- Good for: Step-by-step debugging

**Metrics:** Numerical measurements over time
- Example: `error_rate: 0.8%`, `avg_latency: 2.3s`
- Good for: Trends, alerts, dashboards

**Traces:** Full path of one request through your system
- Example: Request → LLM call → Tool execution → Response
- Good for: Finding bottlenecks, understanding flows

---

## Timeline: When to Learn This

```
┌─────────────────────────────────────────────────────────────┐
│ YOUR LEARNING JOURNEY                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  PHASE 1: Building                                          │
│  └─ Build your first agent                                 │
│  └─ Get it working on your laptop                          │
│  └─ Observability: Not needed yet                          │
│                                                             │
│  PHASE 2: Debugging                                         │
│  └─ Agent fails in unexpected ways                         │
│  └─ Can't reproduce issues                                  │
│  └─ Observability: Add basic logging                       │
│                                                             │
│  PHASE 3: Production                                        │
│  └─ Multiple users, real traffic                           │
│  └─ Need to understand costs and behavior                  │
│  └─ Observability: Full instrumentation ← YOU ARE HERE      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Key Insight: Not AI-Specific

**Observability has been used for decades:**
- 1990s: Monitoring web servers
- 2000s: Tracking microservices
- 2010s: Distributed tracing
- 2020s: Applied to AI systems

**What's different with AI:**
- Non-deterministic behavior (same input ≠ same output)
- Costs per request (token tracking matters)
- Quality is subjective (need evaluation, not just success/fail)

**Bottom line:** You're learning how to apply existing observability principles to AI.

---

## Tools Cheat Sheet

### Traditional Tools (existed before AI)

| Tool | What It Does | When to Use |
|------|--------------|-------------|
| **Datadog** | All-in-one observability platform | Large teams, need everything |
| **Honeycomb** | Modern observability, high-cardinality | Question-driven debugging |
| **Grafana** | Metrics visualization | Open source dashboards |
| **Prometheus** | Time-series metrics collection | Open source metrics |
| **ELK Stack** | Log aggregation and search | Log-heavy workloads |
| **New Relic** | APM + observability | Traditional apps + AI |

### AI-Specific Tools (2023+)

| Tool | What It Does | When to Use |
|------|--------------|-------------|
| **LangSmith** | LLM app observability | Using LangChain |
| **LangFuse** | Open source LLM tracing | Open source preference |
| **Helicone** | LLM cost tracking | Focus on cost optimization |
| **Weights & Biases** | ML experiment tracking | Training + inference monitoring |

---

## What to Track in AI Agents

### Minimum Viable Instrumentation

```python
# At minimum, log these for every agent session:
{
  "session_id": "unique_id",
  "user_id": "who_used_it",
  "task": "what_they_asked",
  "outcome": "success/failure",
  "duration_ms": 2500,
  "total_tokens": 1847,
  "total_cost_usd": 0.023,
  "iterations": 3
}
```

### Full Instrumentation

Track at multiple levels:
1. **Session level**: Overall task, duration, cost, outcome
2. **Iteration level**: Each agent loop step, reasoning, actions
3. **LLM call level**: Model, prompt, completion, tokens, latency
4. **Tool call level**: Which tool, inputs, outputs, duration

---

## Essential Metrics for PMs

### Health Metrics
- Success rate (target: > 95%)
- P50 latency (target: < 3s)
- P95 latency (target: < 10s)
- Error rate (target: < 1%)

### Business Metrics
- Cost per session (budget management)
- Sessions per user (engagement)
- Time to resolution (satisfaction)
- Tool usage patterns (feature usage)

### AI-Specific Metrics
- Average loop iterations (efficiency)
- Token efficiency (cost optimization)
- Tool call diversity (feature discovery)
- Retry rate (reliability)

---

## Common Mistakes

1. **Logging everything** → Too expensive, hard to search
   - Fix: Sample low-value events, trace all errors

2. **Building dashboards too early** → Don't know what matters yet
   - Fix: Start with ad-hoc queries

3. **No trace IDs** → Can't connect related logs
   - Fix: Generate trace_id at request start, pass everywhere

4. **Observability as afterthought** → 10x harder to add later
   - Fix: Instrument from day 1

---

## For PMs: Your Observability Superpowers

With good observability, you can:

✓ **Answer user complaints** - "Here's exactly what the agent did"
✓ **Make budget decisions** - "Feature X costs $0.50/session, Feature Y costs $0.05"
✓ **Prioritize improvements** - "60% of failures happen at step 3"
✓ **Understand usage** - "Power users call Tool A 80% of time"
✓ **Set realistic SLAs** - "P95 latency is 8s, we can promise < 10s"

Without observability:
✗ "Let me check with engineering..."
✗ "Can't reproduce the issue"
✗ "Not sure what's causing that"

---

## Vocabulary You Should Know

| Term | Meaning | Example |
|------|---------|---------|
| **Trace** | Full journey of one request | One agent session from start to finish |
| **Span** | Single operation within a trace | One LLM call or tool execution |
| **Cardinality** | Number of unique values | user_id (high), user_tier (low) |
| **SLI** | Service Level Indicator | "P95 latency" |
| **SLO** | Service Level Objective | "P95 latency < 5s" |
| **SLA** | Service Level Agreement | "99.9% uptime" |
| **MTTD** | Mean Time To Detect | "Detect outages in 2 min" |
| **MTTR** | Mean Time To Resolution | "Resolve incidents in 30 min" |

---

## Next Steps

1. **Start simple**: Add structured logging to your agent
2. **Track sessions**: Generate unique session IDs
3. **Log key decisions**: What did the agent choose and why?
4. **Add metrics**: Track success rate, latency, cost
5. **Build dashboards**: Once you know what questions you ask
6. **Set alerts**: When key metrics cross thresholds

---

## Further Reading

**Books:**
- ["Observability Engineering"](https://www.oreilly.com/library/view/observability-engineering/9781492076438/) by Charity Majors - The bible of modern observability

**Blogs:**
- [Honeycomb Blog](https://www.honeycomb.io/blog) - Best practices and case studies
- [Charity Majors' Blog](https://charity.wtf/) - Engineering insights

**Courses:**
- [Honeycomb University](https://www.honeycomb.io/university/) - Free hands-on courses
- [OpenTelemetry Getting Started](https://opentelemetry.io/docs/getting-started/) - Official tutorials

**Tools:**
- [LangSmith Docs](https://docs.smith.langchain.com/) - For LLM apps
- [Datadog Learning Center](https://learn.datadoghq.com/) - Full platform training

---

**For full details:** See [05-Observability.md](05-Observability.md)
