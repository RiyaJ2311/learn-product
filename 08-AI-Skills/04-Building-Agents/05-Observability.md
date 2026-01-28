# Observability for AI Agents

## Quick Take

You've built an agent. It works on your laptop. But in production, when users hit edge cases or things go wrong, how do you know what happened? **Observability** is your ability to understand what's happening inside your system by looking at its outputs. For PMs, it's the difference between "it's broken" and "here's exactly why it's broken and how to fix it."

**Remember:** You can't fix what you can't see. Observability turns your black-box AI agent into a glass box you can understand and improve.

---

## What Is Observability?

### The Simple Definition

**Observability** is the ability to understand the internal state of a system by examining its external outputs.

Think of it like this:
- **Monitoring** asks: "Is it working?" (yes/no)
- **Observability** asks: "Why is it behaving this way?" (deep understanding)

```
┌─────────────────────────────────────────────────────────────┐
│ MONITORING vs OBSERVABILITY                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  MONITORING (Old Way)                                       │
│  ─────────────────────                                      │
│  "Is the server up?"                   → Yes/No            │
│  "Is response time under 2s?"          → Yes/No            │
│  "Did the agent complete the task?"    → Yes/No            │
│                                                             │
│  ✓ Good for known problems                                 │
│  ✗ Can't debug unknown issues                              │
│                                                             │
│  OBSERVABILITY (Modern Way)                                 │
│  ──────────────────────────                                 │
│  "Why did this specific request fail?"                     │
│  "What path did the agent take?"                           │
│  "Which tool call took 30 seconds?"                        │
│  "What was the LLM thinking at step 3?"                    │
│                                                             │
│  ✓ Can debug ANY problem                                   │
│  ✓ Discover unknown unknowns                               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Why PMs Need to Understand Observability

### You Don't Need to Be an Engineer

As a PM, you won't be writing observability code, but you need to:

1. **Ask the right questions** when things go wrong
2. **Understand trade-offs** between features and debuggability
3. **Prioritize observability work** alongside features
4. **Interpret dashboards** to make product decisions
5. **Communicate with engineers** about system behavior

```
┌─────────────────────────────────────────────────────────────┐
│ PM OBSERVABILITY SUPERPOWERS                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  WITHOUT OBSERVABILITY:                                    │
│  ──────────────────────                                     │
│  User: "Your AI agent gave me wrong info"                  │
│  PM: "Let me check with engineering..."                    │
│  [3 days of investigation]                                  │
│  Engineer: "Can't reproduce it"                            │
│                                                             │
│  WITH OBSERVABILITY:                                       │
│  ─────────────────────                                      │
│  User: "Your AI agent gave me wrong info"                  │
│  PM: [Opens dashboard, finds the session]                  │
│  PM: "I can see it used outdated data from cache.          │
│       The agent didn't call the refresh tool."             │
│  Engineer: "Thanks! I know exactly what to fix."           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Key PM Use Cases

| What You Want to Know | Why It Matters | What You'll Look At |
|-----------------------|----------------|---------------------|
| **Are users getting value?** | Measure product success | Success rates, completion times |
| **Where do users get stuck?** | Identify UX improvements | Agent loop patterns, failure points |
| **What's costing us money?** | Budget AI spend | Token usage, API calls per session |
| **Which features are used?** | Prioritize roadmap | Tool call frequency, user paths |
| **Is performance acceptable?** | Set SLAs, find bottlenecks | Response times, step durations |

---

## The Three Pillars of Observability

Modern observability is built on three data types:

### 1. Logs

**What they are:** Text records of events that happened.

**Example:**
```
[2026-01-28 10:23:45] Agent started task: "Find flight prices"
[2026-01-28 10:23:46] Calling tool: search_flights(LAX, NYC)
[2026-01-28 10:23:48] Tool returned: 5 results
[2026-01-28 10:23:49] LLM analyzing results...
[2026-01-28 10:23:51] Agent completed successfully
```

**Good for:**
- Understanding what happened step-by-step
- Debugging specific failures
- Auditing agent decisions

**Limitations:**
- Hard to query across millions of events
- Can miss patterns in the noise

---

### 2. Metrics

**What they are:** Numerical measurements over time.

**Example:**
```
agent_completion_rate: 94.2%
average_response_time: 2.3s
tokens_per_session: 1,847
error_rate: 0.8%
```

**Good for:**
- High-level health monitoring
- Spotting trends over time
- Setting alerts and SLAs
- Cost tracking

**Limitations:**
- Loses individual context
- Can't tell you "why" something happened

---

### 3. Traces

**What they are:** The complete journey of a single request through your system.

**Example:**
```
Trace ID: abc123

Request received          [0ms]
  ↓
LLM call 1 (planning)    [0-450ms]
  ↓
Tool call: search_db     [450-1200ms]
  ├─ Database query      [460-1180ms]
  └─ Result parsing      [1180-1200ms]
  ↓
LLM call 2 (synthesis)   [1200-1850ms]
  ↓
Response sent            [1850ms]
```

**Good for:**
- Finding bottlenecks
- Understanding agent decision paths
- Debugging complex, multi-step flows

**Limitations:**
- More complex to set up
- Higher data volume

---

## The Observability Stack: Tools You Should Know

### Honeycomb (The Modern Pioneer)

**What it is:** A modern observability platform built for high-cardinality data (lots of unique values).

**Why it matters:**
- **Built for questions, not dashboards:** Instead of pre-built charts, you ask arbitrary questions
- **Perfect for AI agents:** Handles dynamic, unpredictable behavior
- **High-cardinality friendly:** Can slice by any dimension (user_id, prompt_type, model_version, etc.)

**Best for:**
- Startups and scale-ups
- Teams doing active debugging
- AI/ML applications with lots of variability

**Example use:**
```
"Show me all agent sessions where:
 - The user was a premium customer
 - The task took > 10 seconds
 - The agent called more than 5 tools
 - It happened in the last 24 hours"
```

Honeycomb makes this query instant, even with millions of sessions.

---

### Other Major Players

| Tool | Strength | Best For | Pricing Model |
|------|----------|----------|---------------|
| **Datadog** | All-in-one platform | Large enterprises, need everything | Per-host + data volume |
| **New Relic** | APM + observability | Traditional apps + AI | Per-user + data |
| **Grafana + Loki + Tempo** | Open source stack | Self-hosted, cost control | Free (infra costs only) |
| **Splunk** | Log aggregation powerhouse | Legacy enterprises, compliance | Data volume (expensive) |
| **Elastic (ELK Stack)** | Search + logs | Log-heavy workloads | Self-hosted or cloud |
| **AWS CloudWatch** | Native AWS integration | AWS-only infrastructure | Pay per metric/log |
| **Google Cloud Trace** | Native GCP integration | GCP-only infrastructure | Pay per trace |
| **Sentry** | Error tracking focus | Frontend + backend errors | Per event |
| **LangSmith** | Built specifically for LLM apps | LangChain users, AI-first | Per trace |

---

## A Brief History of Observability

### The Evolution

```
┌─────────────────────────────────────────────────────────────┐
│ OBSERVABILITY TIMELINE                                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1990s: THE DARK AGES                                       │
│  ────────────────────                                       │
│  "Check the server logs manually"                          │
│  Tools: grep, tail -f, print statements                     │
│                                                             │
│  2000s: MONITORING EMERGES                                  │
│  ──────────────────────                                     │
│  "Set up alerts for known failures"                        │
│  Tools: Nagios, Zabbix                                      │
│  Focus: Is it up or down?                                   │
│                                                             │
│  2010s: APM (Application Performance Monitoring)            │
│  ────────────────────────────────────────────               │
│  "Track request flows and performance"                     │
│  Tools: New Relic, AppDynamics                              │
│  Focus: How fast? Where are bottlenecks?                    │
│                                                             │
│  2016: OBSERVABILITY COINED                                 │
│  ───────────────────────                                    │
│  Charity Majors + team create Honeycomb                     │
│  Focus: Answer ANY question about your system               │
│  Key insight: Modern systems are too complex for            │
│               pre-defined dashboards                        │
│                                                             │
│  2020s: AI-NATIVE OBSERVABILITY                             │
│  ───────────────────────────                                │
│  "Understand what the LLM decided and why"                 │
│  Tools: LangSmith, Honeycomb for AI                         │
│  Focus: Agent behavior, token usage, decision paths         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Why the Shift Happened

**Old systems (2000s):**
- Monolithic apps
- Predictable code paths
- Known failure modes
- Can pre-define all metrics

**Modern systems (2020s):**
- Microservices, serverless
- Dynamic behavior (especially with AI)
- Infinite possible paths
- Can't predict what will break

**AI agents (now):**
- Non-deterministic decisions
- External API dependencies
- User intent varies wildly
- Every session is unique

**Traditional monitoring can't handle this.** You need observability.

---

## Observability for AI Agents: What to Track

### Essential Data Points

```
┌─────────────────────────────────────────────────────────────┐
│ WHAT TO INSTRUMENT IN YOUR AI AGENT                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  AGENT LEVEL                                                │
│  ───────────                                                │
│  • Session ID (unique per user interaction)                │
│  • Task description (what user asked for)                  │
│  • Final outcome (success/failure/partial)                 │
│  • Total duration                                           │
│  • Total tokens used                                        │
│  • Total cost ($)                                           │
│  • Number of loop iterations                                │
│                                                             │
│  LOOP ITERATION LEVEL                                       │
│  ─────────────────────                                      │
│  • Iteration number (1, 2, 3...)                           │
│  • LLM's reasoning/thought                                  │
│  • Action chosen (tool call or final answer)               │
│  • Tool called (if any)                                     │
│  • Tool result (success/failure, data returned)            │
│  • Duration of this step                                    │
│  • Tokens used in this step                                │
│                                                             │
│  LLM CALL LEVEL                                             │
│  ───────────────                                            │
│  • Model used (gpt-4, claude-3.5-sonnet, etc.)             │
│  • Temperature setting                                      │
│  • Prompt (input to LLM)                                    │
│  • Completion (output from LLM)                             │
│  • Token counts (input/output)                              │
│  • Latency                                                  │
│                                                             │
│  TOOL CALL LEVEL                                            │
│  ────────────────                                           │
│  • Tool name                                                │
│  • Input parameters                                         │
│  • Output result                                            │
│  • Success/failure                                          │
│  • Error message (if failed)                                │
│  • Duration                                                 │
│                                                             │
│  METADATA (Context)                                         │
│  ────────────────────                                       │
│  • User ID                                                  │
│  • User tier (free/pro/enterprise)                         │
│  • Feature flags active                                     │
│  • Environment (prod/staging)                               │
│  • Agent version                                            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Example: Instrumented Agent Session

```json
{
  "session_id": "sess_xyz789",
  "user_id": "user_123",
  "user_tier": "enterprise",
  "task": "Book a flight from LAX to NYC for next Tuesday",
  "started_at": "2026-01-28T10:23:45Z",
  "completed_at": "2026-01-28T10:24:12Z",
  "duration_ms": 27000,
  "outcome": "success",
  "total_tokens": 2847,
  "total_cost_usd": 0.043,
  "iterations": [
    {
      "iteration": 1,
      "thought": "I need to search for available flights",
      "action": "tool_call",
      "tool": "search_flights",
      "tool_input": {"from": "LAX", "to": "NYC", "date": "2026-02-04"},
      "tool_output": {"flights": [...], "count": 5},
      "duration_ms": 1200,
      "tokens": 234
    },
    {
      "iteration": 2,
      "thought": "User hasn't specified preferences, I should ask",
      "action": "final_answer",
      "response": "I found 5 flights. Do you prefer morning or evening?",
      "duration_ms": 450,
      "tokens": 89
    }
  ]
}
```

**With this data, you can answer:**
- "Why did it take 27 seconds?" (See step durations)
- "Did it call the right tools?" (See tool sequence)
- "What did the LLM think?" (See reasoning)
- "How much did this cost?" (See token usage)
- "Are enterprise users slower?" (Group by user_tier)

---

## Practical Observability Patterns

### Pattern 1: The Session Trace

**Goal:** See the entire agent conversation as a timeline.

**Implementation:**
```python
import honeycomb

def run_agent_session(user_id, task):
    with honeycomb.start_trace("agent_session") as trace:
        trace.add_field("user_id", user_id)
        trace.add_field("task", task)

        for i, step in enumerate(agent_loop(task)):
            with trace.start_span(f"iteration_{i}"):
                trace.add_field("thought", step.thought)
                trace.add_field("action", step.action)

                if step.tool_call:
                    result = execute_tool(step.tool_call)
                    trace.add_field("tool_result", result)
```

**PM View:** Click on any user session, see the full decision tree.

---

### Pattern 2: The Cost Dashboard

**Goal:** Track AI spending by feature, user tier, and time.

**Metrics to track:**
- Total tokens per day
- Cost per session (average)
- Cost by user tier
- Cost by agent feature
- Cost trends over time

**PM View:** "Pro users cost us $0.12/session, Free users $0.03. Is this sustainable?"

---

### Pattern 3: The Success Funnel

**Goal:** Understand where users drop off or agents fail.

**Stages:**
1. Task received
2. Tools called successfully
3. LLM generated response
4. User accepted result
5. Task completed

**PM View:** "60% of failures happen at 'tools called' step. We need better error handling."

---

### Pattern 4: The Latency Breakdown

**Goal:** Find what's slow.

**Breakdown:**
- Queue time
- LLM call time
- Tool execution time
- Total agent loop time

**PM View:** "Database queries take 70% of session time. We should cache common queries."

---

## Key Metrics to Monitor

### Health Metrics

| Metric | What It Tells You | Good Threshold |
|--------|-------------------|----------------|
| **Success Rate** | % of tasks completed successfully | > 95% |
| **P50 Latency** | Median response time | < 3s |
| **P95 Latency** | 95th percentile response time | < 10s |
| **Error Rate** | % of sessions that errored | < 1% |
| **Tool Success Rate** | % of tool calls that succeed | > 98% |

### Business Metrics

| Metric | What It Tells You | Why It Matters |
|--------|-------------------|----------------|
| **Cost per Session** | Average $ spent on LLM/tools | Budget management |
| **Sessions per User** | Engagement level | Product stickiness |
| **Time to Resolution** | How long tasks take | User satisfaction |
| **Tools per Session** | Agent complexity | Efficiency indicator |
| **Retry Rate** | How often agents retry | Reliability signal |

### AI-Specific Metrics

| Metric | What It Tells You | Why It Matters |
|--------|-------------------|----------------|
| **Avg Loop Iterations** | How many steps agents take | Efficiency |
| **Tool Call Diversity** | Which tools are used most | Feature usage |
| **Token Efficiency** | Tokens per successful task | Cost optimization |
| **Model Mix** | Which LLMs are used | Cost vs quality trade-off |

---

## Setting Up Observability: A Practical Guide

### Step 1: Choose Your Tools

**For startups/small teams:**
- Honeycomb (traces + metrics + logs)
- Or: Grafana + Loki + Tempo (open source)
- Or: LangSmith (if using LangChain)

**For enterprises:**
- Datadog or New Relic (full platform)
- Plus: Sentry for error tracking

**For solo developers:**
- Start with structured logging
- Add LangSmith or Weights & Biases

---

### Step 2: Instrument Your Agent

**Minimum viable instrumentation:**
```python
def agent_session(task):
    session_id = generate_id()
    log_event("session_started", {
        "session_id": session_id,
        "task": task,
        "timestamp": now()
    })

    try:
        result = run_agent(task)
        log_event("session_completed", {
            "session_id": session_id,
            "result": result,
            "duration_ms": elapsed_time()
        })
        return result
    except Exception as e:
        log_event("session_failed", {
            "session_id": session_id,
            "error": str(e)
        })
        raise
```

**Key principle:** Log structured data (JSON), not text.

❌ BAD: `print("User 123 started task")`
✅ GOOD: `log({"event": "task_started", "user_id": 123})`

---

### Step 3: Build Core Dashboards

**Dashboard 1: System Health**
- Success rate (last 24h)
- Error rate (last 24h)
- P50/P95 latency
- Active sessions

**Dashboard 2: Cost**
- Total tokens (today, this week, this month)
- Cost per session (average)
- Cost by user tier
- Cost trend

**Dashboard 3: Agent Behavior**
- Avg iterations per session
- Most-used tools
- Tool success rates
- Common failure patterns

---

### Step 4: Set Alerts

**Critical alerts:**
- Error rate > 5% for 5 minutes → Page on-call
- P95 latency > 30s → Notify team
- Success rate < 90% → Investigate

**Warning alerts:**
- Daily cost > $500 → Notify PM
- Unusual tool failure rate → Notify eng
- Session volume spike → Monitor capacity

---

## Common Observability Mistakes

### Mistake 1: Logging Everything

**Problem:** Too much data is expensive and hard to search.

**Solution:** Sample low-value events, trace all errors and slow requests.

---

### Mistake 2: Pre-mature Dashboard Building

**Problem:** You build dashboards before you know what questions matter.

**Solution:** Start with ad-hoc queries, build dashboards for questions you ask repeatedly.

---

### Mistake 3: Ignoring Cardinality

**Problem:** Tagging with high-cardinality fields (like full prompts) explodes costs.

**Solution:** Hash or truncate high-cardinality data, or use specialized tools like Honeycomb.

---

### Mistake 4: No Trace IDs

**Problem:** Can't connect logs across services.

**Solution:** Generate a trace_id at the start of every request, pass it everywhere.

---

### Mistake 5: Observability as an Afterthought

**Problem:** Adding observability after launch is 10x harder.

**Solution:** Instrument from day 1, even if you don't have fancy tools yet.

---

## Observability Vocabulary for PMs

| Term | Meaning | Example |
|------|---------|---------|
| **Trace** | The full journey of one request | One agent session from start to finish |
| **Span** | A single operation within a trace | One LLM call or tool execution |
| **Cardinality** | Number of unique values for a field | user_id has high cardinality, user_tier has low |
| **SLI** | Service Level Indicator (what you measure) | "P95 latency" |
| **SLO** | Service Level Objective (your goal) | "P95 latency < 5s" |
| **SLA** | Service Level Agreement (promise to users) | "99.9% uptime" |
| **MTTD** | Mean Time To Detect (how fast you notice issues) | "We detect outages in 2 minutes" |
| **MTTR** | Mean Time To Resolution (how fast you fix) | "We resolve incidents in 30 minutes" |

---

## Things to Remember

1. **Observability ≠ Monitoring**: Monitoring checks known issues, observability debugs unknown ones
2. **Three pillars**: Logs (what happened), Metrics (how much), Traces (full journey)
3. **Honeycomb pioneered modern observability**: High-cardinality, question-driven approach
4. **PMs benefit hugely**: Understand costs, user behavior, and where to improve
5. **Instrument early**: Adding observability after launch is much harder
6. **AI agents need special care**: Track decisions, tools, tokens, and costs
7. **Start simple**: Structured logging is better than nothing

---

## For Deeper Learning

### Books
- **"Observability Engineering"** by Charity Majors, Liz Fong-Jones, George Miranda (the definitive guide)

### Blogs
- Honeycomb Blog (honeycomb.io/blog)
- Charity Majors' blog (charity.wtf)

### Courses
- Honeycomb University (free courses on observability)
- O'Reilly: "Observability for Modern Applications"

---

**Next:** [../03-AI-Agents/00-Index.md](../03-AI-Agents/00-Index.md) - Or return to [00-Index.md](00-Index.md)
