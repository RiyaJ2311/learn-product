# Observability for AI Agents

## Prerequisites

This guide assumes you understand observability fundamentals. If you're new to observability, **start here first:**

**→ [Generic Observability Guide](../../../learn-code/observability/)**

(Or on GitHub: https://github.com/RiyaJ2311/learn/tree/main/learn-code/observability)

That guide covers:
- What observability is (vs monitoring)
- The three pillars: logs, metrics, traces
- Tools overview: Honeycomb, Datadog, Grafana, etc.
- History and context

**This document focuses exclusively on what makes AI agent observability unique.**

---

## Quick Take

AI agents are harder to observe than traditional software because they're non-deterministic. The same input can produce different outputs, failures are probabilistic, and "performance" includes subjective quality metrics, not just speed.

**Key challenge:** You can't just check if it "worked." You need to understand *why* it made each decision and *how good* the outcome was.

---

## What Makes AI Observability Different

```
┌─────────────────────────────────────────────────────────────┐
│ TRADITIONAL vs AI OBSERVABILITY                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  TRADITIONAL SOFTWARE                                       │
│  ──────────────────────────                                 │
│  Deterministic: same input → same output                   │
│  Reproducible bugs: can replay and fix                     │
│  Performance = speed + memory                               │
│  Logs capture everything                                    │
│                                                             │
│  ✓ Tools: Prometheus, Grafana, Datadog, New Relic          │
│  ✓ Focus: Uptime, latency, errors, throughput              │
│                                                             │
│  AI/LLM SYSTEMS                                             │
│  ──────────────                                             │
│  Non-deterministic: same prompt ≠ same response            │
│  Probabilistic failures: hard to reproduce                 │
│  Performance = quality + relevance + cost                   │
│  Need to capture: prompts, responses, reasoning            │
│                                                             │
│  ✓ Tools: Same ones + LangSmith, specialized AI tools      │
│  ✓ Focus: Above + token usage, decision quality, costs     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### The New Challenges

1. **Non-Determinism**: Same prompt, different responses
2. **Cost Tracking**: Every API call costs money (tokens matter)
3. **Quality Metrics**: Not just "did it work?" but "was it good?"
4. **Decision Paths**: Which tools did the agent call and why?
5. **Context Windows**: What information was available at each step?

---

## What to Track in AI Agents

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

---

## Key Metrics to Monitor

### Agent Performance Metrics

| Metric | What It Tells You | Target | Alert If |
|--------|-------------------|--------|----------|
| **Success Rate** | % of tasks completed successfully | > 95% | < 90% |
| **Average Iterations** | How many steps agents take | 2-5 | > 10 |
| **Time to First Token** | Agent responsiveness perception | < 2s | > 5s |
| **Total Duration** | End-to-end task completion | < 30s | > 60s |

### Cost & Usage Metrics

| Metric | What It Tells You | Why It Matters |
|--------|-------------------|----------------|
| **Tokens Per Session** | How "chatty" your agent is | Direct cost impact |
| **Cost Per Successful Task** | Unit economics | Profitability |
| **Model Distribution** | Which models are used | Cost optimization opportunities |
| **Peak Usage Times** | When load is highest | Capacity planning |

### Quality Metrics

| Metric | What It Tells You | How to Measure |
|--------|-------------------|----------------|
| **Tool Call Accuracy** | Agent picks right tools | Manual review or user feedback |
| **Response Relevance** | Answers match user intent | User ratings, thumbs up/down |
| **Hallucination Rate** | Agent invents false info | Fact-checking, ground truth comparison |
| **User Satisfaction** | Overall experience | Direct user feedback, NPS |

---

## AI-Specific Observability Patterns

### Pattern 1: The Token Cost Dashboard

**Purpose:** Track and optimize LLM API costs

**What to show:**
```
Total Spend: $1,247.32 (this month)
├─ By Model
│  ├─ GPT-4: $892.10 (71%)
│  └─ Claude Sonnet: $355.22 (29%)
├─ By Feature
│  ├─ Search Agent: $678.45
│  └─ Summary Agent: $568.87
└─ Trend: ↑ 23% vs last month
```

**Key questions this answers:**
- Which models/features cost the most?
- Are costs growing faster than users?
- Where can we optimize?

---

### Pattern 2: The Agent Decision Trace

**Purpose:** Understand why the agent made specific decisions

**What to capture:**
```
Session: sess_abc123
Task: "Find cheapest hotel in Paris for March 15-20"

[Iteration 1]
Thought: "Need to search for Paris hotels in date range"
Action: tool_call(search_hotels)
Input: {city: "Paris", check_in: "2026-03-15", check_out: "2026-03-20"}
Result: 47 hotels found
Duration: 1.2s, Tokens: 234

[Iteration 2]
Thought: "Too many results, filter by price"
Action: tool_call(filter_hotels)
Input: {sort_by: "price_asc", limit: 10}
Result: 10 hotels returned
Duration: 0.3s, Tokens: 89

[Iteration 3]
Thought: "Present options to user"
Action: final_answer
Response: "Here are the 10 cheapest hotels..."
Duration: 0.5s, Tokens: 156
```

**Key questions this answers:**
- Why did the agent call these specific tools?
- What information was available at each step?
- Where did the agent get stuck or loop?

---

### Pattern 3: The Quality Monitoring Dashboard

**Purpose:** Track subjective quality metrics

**What to show:**
```
Last 24 Hours:
├─ User Satisfaction: 4.2/5 ⭐
├─ Thumbs Up Rate: 78%
├─ Task Completion: 94%
└─ Hallucination Reports: 3

By Agent Type:
├─ Search Agent: 4.5/5 ⭐
├─ Summary Agent: 4.1/5 ⭐
└─ Research Agent: 3.8/5 ⭐ ⚠️ (needs attention)
```

**Key questions this answers:**
- Are users happy with agent outputs?
- Which agents need quality improvements?
- Is quality degrading over time?

---

## Practical Implementation

### Quick Start: Minimal Instrumentation

```python
import json
from datetime import datetime

class ObservableAgent:
    def __init__(self, session_id, user_id):
        self.session_id = session_id
        self.user_id = user_id
        self.start_time = datetime.now()
        self.iterations = []
        self.total_tokens = 0
        self.total_cost = 0.0

    def log_iteration(self, iteration_num, thought, action, result, tokens, cost):
        """Log each agent loop iteration"""
        self.iterations.append({
            "iteration": iteration_num,
            "thought": thought,
            "action": action,
            "result": result,
            "tokens": tokens,
            "cost": cost,
            "timestamp": datetime.now().isoformat()
        })
        self.total_tokens += tokens
        self.total_cost += cost

    def log_completion(self, outcome):
        """Log final session outcome"""
        duration = (datetime.now() - self.start_time).total_seconds()

        session_data = {
            "session_id": self.session_id,
            "user_id": self.user_id,
            "outcome": outcome,
            "duration_seconds": duration,
            "total_tokens": self.total_tokens,
            "total_cost_usd": self.total_cost,
            "iterations": self.iterations
        }

        # Send to observability platform
        print(json.dumps(session_data, indent=2))
        # In production: send_to_honeycomb(session_data)
```

**Usage:**
```python
agent = ObservableAgent(session_id="sess_123", user_id="user_456")

# Iteration 1
agent.log_iteration(
    iteration_num=1,
    thought="Need to search for flights",
    action="tool_call: search_flights",
    result={"flights": 5},
    tokens=234,
    cost=0.012
)

# Iteration 2
agent.log_iteration(
    iteration_num=2,
    thought="Present options to user",
    action="final_answer",
    result={"response": "Here are 5 flights..."},
    tokens=89,
    cost=0.005
)

# Complete
agent.log_completion(outcome="success")
```

---

## AI-Specific Tools

While generic observability platforms work for AI (see [Tools Overview](../../../learn-code/observability/02-Tools-Overview.md) or [on GitHub](https://github.com/RiyaJ2311/learn/blob/main/learn-code/observability/02-Tools-Overview.md)), some tools specialize in LLM/AI observability:

| Tool | Focus | Best For |
|------|-------|----------|
| **LangSmith** | LangChain integration | Teams using LangChain |
| **Braintrust** | AI product evaluation | Quality-focused teams |
| **Arize** | ML observability | Production ML systems |
| **Weights & Biases** | Experiment tracking | Research teams |

**For most teams:** Start with general observability tools (Honeycomb, Datadog) and only add AI-specific tools when you need specialized features.

---

## Common AI Observability Mistakes

### Mistake 1: Not Logging Prompts and Responses

**Why it's bad:** Can't debug agent decisions without seeing what the LLM actually said.

**Fix:** Always log full prompts and completions (with PII redaction if needed).

---

### Mistake 2: Ignoring Token Costs

**Why it's bad:** Costs can spiral out of control quickly.

**Fix:** Track tokens per session, set alerts, monitor trends.

---

### Mistake 3: Only Tracking Success/Failure

**Why it's bad:** Misses quality issues (agent "succeeds" but gives bad answers).

**Fix:** Add user feedback mechanisms (thumbs up/down, ratings).

---

### Mistake 4: No Session-Level Tracing

**Why it's bad:** Can't follow agent decision paths across multiple tool calls.

**Fix:** Use trace IDs to connect all events in a session.

---

## PM Perspective: What to Ask For

As a PM, here's what you should request from your eng team:

### Must-Haves
1. **Cost dashboard** - How much are we spending? Trending up/down?
2. **Success rate tracking** - What % of tasks complete successfully?
3. **Quality feedback loop** - Can users rate agent responses?
4. **Session traces** - Can we replay specific user sessions?

### Nice-to-Haves
5. Tool usage breakdown - Which tools get called most?
6. Latency percentiles - P50, P95, P99 response times
7. A/B test infrastructure - Compare agent versions

### Questions to Ask When Things Go Wrong

```
User reports: "The agent gave me wrong info"

Instead of: "Can you look into it?"

Ask:
1. "What's the session ID?" (find the exact interaction)
2. "What did the agent's reasoning say?" (see decision path)
3. "Which tools did it call?" (understand behavior)
4. "Did other users hit this?" (check if it's widespread)
5. "What's our quality metric for this agent?" (baseline)
```

---

## Key Takeaways

1. **AI observability builds on generic observability** - Same principles (logs, metrics, traces), new dimensions (tokens, quality, decisions)

2. **Instrument at multiple levels** - Agent session, loop iteration, LLM call, tool call

3. **Track costs obsessively** - Tokens = money, and costs can grow fast

4. **Quality metrics matter** - Success/failure isn't enough; capture user satisfaction

5. **Use generic tools first** - Honeycomb, Datadog work great; only add AI-specific tools when needed

---

## Next Steps

- **Generic observability basics:** [Learn the fundamentals](../../../learn-code/observability/00-Index.md) ([GitHub](https://github.com/RiyaJ2311/learn/blob/main/learn-code/observability/00-Index.md))
- **Tools comparison:** [Choose your observability platform](../../../learn-code/observability/02-Tools-Overview.md) ([GitHub](https://github.com/RiyaJ2311/learn/blob/main/learn-code/observability/02-Tools-Overview.md))
- **PM perspective:** [Why PMs care about observability](../../../learn-code/observability/04-For-PMs.md) ([GitHub](https://github.com/RiyaJ2311/learn/blob/main/learn-code/observability/04-For-PMs.md))
- **Build your agent:** [Agent Architecture](01-Architecture.md)

---

*Remember: Observability isn't just for debugging - it's how you understand if your AI agent is actually providing value to users.*
