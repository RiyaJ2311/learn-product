# AI Skills Cheatsheet

Quick reference for everything in this module.

---

## AI Fundamentals

### What is what?
```
AI → Machine Learning → Deep Learning → LLMs
         (learns from data)  (neural nets)   (text prediction)
```

### Key Numbers
| Concept | Rule of Thumb |
|---------|---------------|
| 1 token | ~0.75 words or ~4 characters |
| 1 page of text | ~500-700 tokens |
| GPT-4o input cost | ~$2.50 per 1M tokens |
| GPT-4o output cost | ~$10 per 1M tokens |
| Claude Sonnet input | ~$3 per 1M tokens |

### Temperature
```
0.0-0.3 → Deterministic (factual tasks)
0.5-0.7 → Balanced (general use)
0.8-1.0 → Creative (brainstorming)
```

---

## Rules vs AI Decision

### Use Rules When:
- [x] Deterministic (same input → same output)
- [x] Can enumerate all cases
- [x] Speed critical (<100ms)
- [x] High volume, low complexity
- [x] Must be 100% accurate
- [x] Needs audit trail

### Use AI When:
- [x] Natural language understanding needed
- [x] Can't enumerate all cases
- [x] Content generation required
- [x] 95%+ accuracy acceptable
- [x] Judgment/interpretation required

### Quick Test
```
Can I write it as a flowchart with no "analyze and decide" steps?
YES → Use rules
NO  → Consider AI
```

---

## Prompting Quick Reference

### The Formula
```
ROLE + CONTEXT + TASK + FORMAT + CONSTRAINTS
```

### System vs User Prompt
| System Prompt | User Prompt |
|---------------|-------------|
| Role/persona | Specific question |
| Behavioral rules | Current context |
| Output format | Input data |
| Always included | Changes each time |

### Few-Shot Template
```
[Task description]

Examples:
Input: [example 1]
Output: [output 1]

Input: [example 2]
Output: [output 2]

Now process:
Input: [actual input]
```

### Magic Phrases
- "Let's think step by step" → Better reasoning
- "Return only JSON" → Structured output
- "If unsure, say 'I don't know'" → Reduces hallucination

---

## Tool Use

### Tool Definition
```json
{
  "name": "tool_name",
  "description": "What it does (AI reads this!)",
  "input_schema": {
    "type": "object",
    "properties": { ... },
    "required": [...]
  }
}
```

### Tool Design Tips
1. Rich context in results (don't make AI call twice)
2. Support incremental operations (line ranges, pagination)
3. Include metadata (what actions are possible next)
4. Graceful errors (what went wrong, how to fix)

---

## Agent Patterns

### ReAct (Most Common)
```
THOUGHT → ACTION → OBSERVATION → THOUGHT → ...
```
Best for: Dynamic tasks, debugging, exploration

### Plan-Execute
```
PLAN (all steps) → EXECUTE (one by one) → REPLAN (if needed)
```
Best for: Structured tasks, predictable workflows

### Self-Ask
```
QUESTION → SUB-QUESTIONS → ANSWERS → COMBINE
```
Best for: Research, multi-hop reasoning

---

## Agent Loop (Core Pattern)

```python
while not done:
    # 1. THINK: Get LLM response
    response = llm.chat(messages, tools)

    # 2. CHECK: Are we done?
    if response.stop_reason == "end_turn":
        return response.text

    # 3. ACT: Execute tools
    if response.tool_calls:
        for tool in response.tool_calls:
            result = execute(tool)
            messages.append(result)

    # 4. OBSERVE: Loop continues
```

---

## Multi-Agent Architectures

```
HIERARCHICAL:    Manager → Workers
PEER:            Agent ↔ Agent ↔ Agent
PIPELINE:        Agent → Agent → Agent
DEBATE:          Advocate vs Critic → Judge
```

---

## Subagent Checklist

**Spawn subagent when:**
- [x] Distinct subtask
- [x] Different expertise needed
- [x] Can run in parallel
- [x] Large context needed
- [x] Risky/experimental

**Keep in parent when:**
- [x] Quick, simple action
- [x] Depends on recent context
- [x] Natural continuation

---

## Memory Strategies

| Strategy | How | Best For |
|----------|-----|----------|
| **Sliding Window** | Keep last N messages | Simple tasks |
| **Summarization** | Compress old messages | Long conversations |
| **Semantic Retrieval** | Search relevant past | Very long histories |
| **Hybrid** | Combine above | Production systems |

---

## Production Checklist

```
□ Error handling (retry, timeout, graceful degradation)
□ Logging (LLM calls, tool executions, errors)
□ Cost controls (token limits, budget caps)
□ Security (input validation, permissions)
□ Testing (unit, integration, evals)
□ Monitoring (metrics, alerts)
```

### Essential Limits
```python
max_iterations = 50        # Don't loop forever
max_tokens_per_session = 200000  # ~$5-10 max
timeout = 30               # Seconds per LLM call
```

---

## Cost Estimation Formula

```
Cost = (Input Tokens × Input Rate) + (Output Tokens × Output Rate)

Example (GPT-4o):
1000 input + 500 output =
(1000 × $0.0000025) + (500 × $0.00001) = $0.0025 + $0.005 = $0.0075
```

---

## Quick Debugging

### Agent Not Using Tools
- Check tool descriptions (AI decides from these)
- Make descriptions clearer about when to use
- Add examples to system prompt

### Agent Looping
- Add max_iterations limit
- Check stopping conditions
- Look for conflicting instructions

### Poor Quality Output
- Add chain-of-thought ("think step by step")
- Provide examples (few-shot)
- Be more specific in instructions

### High Costs
- Use cheaper model for simple steps
- Reduce context (summarization)
- Add token limits

---

## Framework Quick Pick

| Need | Choice |
|------|--------|
| Learning/Simple | Direct SDK |
| Production/Complex | LangGraph |
| Multi-agent | CrewAI |
| Maximum control | Custom build |

---

## Links to Deep Dives

| Topic | Location |
|-------|----------|
| AI Basics | [00-AI-Fundamentals/](00-AI-Fundamentals/) |
| Rules vs AI | [01-Rules-vs-AI/](01-Rules-vs-AI/) |
| Prompting | [02-AI-Skills/01-Prompt-Engineering.md](02-AI-Skills/01-Prompt-Engineering.md) |
| Tool Use | [02-AI-Skills/02-Tool-Use.md](02-AI-Skills/02-Tool-Use.md) |
| Chain-of-Thought | [02-AI-Skills/03-Chain-of-Thought.md](02-AI-Skills/03-Chain-of-Thought.md) |
| What Are Agents | [03-AI-Agents/01-What-are-Agents.md](03-AI-Agents/01-What-are-Agents.md) |
| Agent Patterns | [03-AI-Agents/02-Agent-Patterns.md](03-AI-Agents/02-Agent-Patterns.md) |
| Subagents | [03-AI-Agents/05-Subagents.md](03-AI-Agents/05-Subagents.md) |
| Building Agents | [04-Building-Agents/](04-Building-Agents/) |
