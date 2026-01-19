# Agent Patterns & Architectures

## 2-Minute Overview

Not all agents are built the same. Different patterns suit different problems. This chapter covers the most important agent architectures and when to use each.

**The key insight:** The pattern you choose determines how your agent thinks, plans, and recovers from errors.

---

## The Big Three Patterns

### 1. ReAct (Reasoning + Acting)

```
┌─────────────────────────────────────────────────────────────┐
│ REACT PATTERN                                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  The agent interleaves reasoning and action:                │
│                                                             │
│  THOUGHT: "I need to find the user's order status"         │
│  ACTION: search_orders(user_id=123)                        │
│  OBSERVATION: {order_id: 456, status: "shipped"}           │
│                                                             │
│  THOUGHT: "Order is shipped, I should get tracking"        │
│  ACTION: get_tracking(order_id=456)                        │
│  OBSERVATION: {tracking: "1Z999...", carrier: "UPS"}       │
│                                                             │
│  THOUGHT: "I have all info, can respond to user"           │
│  ACTION: respond("Your order shipped! Track at...")        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**How it works:**
1. Agent thinks out loud (reasoning)
2. Takes one action
3. Observes the result
4. Thinks about what to do next
5. Repeats until done

**Best for:**
- Tasks requiring reasoning about observations
- When you want explainable decisions
- Debugging and transparency

---

### 2. Plan-and-Execute

```
┌─────────────────────────────────────────────────────────────┐
│ PLAN-AND-EXECUTE PATTERN                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  PHASE 1: PLANNING                                          │
│  ─────────────────                                          │
│  "To complete this task, I will:                           │
│   1. Search for competitor websites                         │
│   2. Extract pricing from each site                         │
│   3. Compile into comparison table                          │
│   4. Add analysis and recommendations"                      │
│                                                             │
│  PHASE 2: EXECUTION                                         │
│  ──────────────────                                         │
│  Step 1: search_competitors() → [list of sites]            │
│  Step 2: extract_pricing(site1) → {pricing data}           │
│          extract_pricing(site2) → {pricing data}           │
│  Step 3: create_table(data) → comparison table             │
│  Step 4: analyze(table) → recommendations                  │
│                                                             │
│  PHASE 3: REPLAN (if needed)                               │
│  ───────────────────────────                                │
│  "Step 2 failed for site3. Updating plan to skip           │
│   or try alternative approach..."                          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**How it works:**
1. Agent creates a plan upfront
2. Executes steps sequentially
3. May replan if something fails

**Best for:**
- Well-defined tasks with clear steps
- When you want a predictable execution
- Tasks where planning helps avoid mistakes

---

### 3. Self-Ask (Decomposition)

```
┌─────────────────────────────────────────────────────────────┐
│ SELF-ASK PATTERN                                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  MAIN QUESTION: "Who is older, the CEO of Apple or the    │
│                  CEO of Microsoft?"                         │
│                                                             │
│  SUBQUESTION 1: "Who is the CEO of Apple?"                 │
│  → Search → "Tim Cook"                                      │
│                                                             │
│  SUBQUESTION 2: "When was Tim Cook born?"                  │
│  → Search → "November 1, 1960"                             │
│                                                             │
│  SUBQUESTION 3: "Who is the CEO of Microsoft?"             │
│  → Search → "Satya Nadella"                                │
│                                                             │
│  SUBQUESTION 4: "When was Satya Nadella born?"             │
│  → Search → "August 19, 1967"                              │
│                                                             │
│  FINAL ANSWER: "Tim Cook (Apple) is older at 64,          │
│                 compared to Satya Nadella (Microsoft) at 57"│
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**How it works:**
1. Agent identifies sub-questions needed to answer the main question
2. Answers each sub-question
3. Combines answers for final response

**Best for:**
- Research questions
- Multi-hop reasoning
- Questions requiring multiple facts

---

## Pattern Comparison

| Aspect | ReAct | Plan-Execute | Self-Ask |
|--------|-------|--------------|----------|
| **Planning** | Implicit (each step) | Explicit upfront | Decomposition |
| **Flexibility** | High | Medium | Medium |
| **Transparency** | Very high | High | High |
| **Error recovery** | Step by step | Replan | Retry subquestion |
| **Best for** | Dynamic tasks | Structured tasks | Research tasks |

---

## Other Important Patterns

### Reflexion (Self-Improvement)

```
┌─────────────────────────────────────────────────────────────┐
│ REFLEXION PATTERN                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ATTEMPT 1:                                                 │
│  Agent writes code → Tests fail                            │
│                                                             │
│  REFLECTION:                                                │
│  "My code failed because I didn't handle the edge case    │
│   of empty arrays. I should add a guard clause."          │
│                                                             │
│  ATTEMPT 2:                                                 │
│  Agent writes improved code → Tests pass                   │
│                                                             │
│  The agent learns from its mistakes within the session     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Best for:**
- Coding tasks
- Tasks with clear success criteria
- Iterative improvement scenarios

---

### CRITIC (Verify and Improve)

```
┌─────────────────────────────────────────────────────────────┐
│ CRITIC PATTERN                                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  STEP 1: GENERATE                                           │
│  Agent produces initial output                              │
│                                                             │
│  STEP 2: CRITIQUE                                           │
│  Agent (or another agent) reviews for issues:               │
│  - "Paragraph 2 makes an unsupported claim"                │
│  - "The tone is too formal for the audience"               │
│                                                             │
│  STEP 3: REVISE                                             │
│  Agent improves based on critique                           │
│                                                             │
│  STEP 4: VERIFY                                             │
│  Check if issues are resolved                               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Best for:**
- Content generation
- Ensuring quality
- Tasks requiring verification

---

### Tool-Augmented Generation

```
┌─────────────────────────────────────────────────────────────┐
│ TOOL-AUGMENTED PATTERN                                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Rather than hallucinating answers, agent retrieves facts: │
│                                                             │
│  User: "What's the current stock price of Apple?"          │
│                                                             │
│  Agent: [Calls stock_price("AAPL")]                        │
│         → Receives: $185.50                                 │
│         "Apple's current stock price is $185.50"           │
│                                                             │
│  User: "What's 15% of that?"                               │
│                                                             │
│  Agent: [Calls calculator(185.50 * 0.15)]                  │
│         → Receives: 27.825                                  │
│         "15% of $185.50 is $27.83"                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Best for:**
- Factual queries
- Calculations
- Anything requiring external data

---

## Choosing the Right Pattern

```
┌─────────────────────────────────────────────────────────────┐
│ PATTERN SELECTION GUIDE                                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  What's the nature of your task?                           │
│                                                             │
│  "I need to respond to dynamic situations"                 │
│  → ReAct (flexible, step-by-step reasoning)                │
│                                                             │
│  "I have a clear multi-step process"                       │
│  → Plan-Execute (structured, predictable)                  │
│                                                             │
│  "I need to answer complex questions"                      │
│  → Self-Ask (decomposition, research)                      │
│                                                             │
│  "I need to iterate until quality is good"                 │
│  → Reflexion or CRITIC (self-improvement)                  │
│                                                             │
│  "I need real-time data and calculations"                  │
│  → Tool-Augmented (facts over hallucination)               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Hybrid Patterns

Real-world agents often combine patterns:

### Example: Research Agent

```
┌─────────────────────────────────────────────────────────────┐
│ HYBRID RESEARCH AGENT                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. PLAN (Plan-Execute)                                    │
│     "I'll research this in 4 phases: competitors,          │
│      market size, trends, recommendations"                  │
│                                                             │
│  2. DECOMPOSE (Self-Ask)                                    │
│     "For competitors, I need to find:                      │
│      - Who are the main players?                           │
│      - What are their market shares?                       │
│      - What are their strategies?"                         │
│                                                             │
│  3. EXECUTE (ReAct)                                         │
│     Search → Read → Decide what else needed → Search →...  │
│                                                             │
│  4. VERIFY (CRITIC)                                         │
│     "Let me review my findings for accuracy and gaps..."   │
│                                                             │
│  5. SYNTHESIZE                                              │
│     Combine all findings into final report                  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Implementation Tips

### For ReAct
```python
system_prompt = """
You are a helpful assistant. For each step:
1. THOUGHT: Explain your reasoning
2. ACTION: Call a tool if needed
3. OBSERVATION: Analyze the result

Always show your thinking before acting.
"""
```

### For Plan-Execute
```python
# Phase 1: Planning
plan = llm.generate(f"Create a step-by-step plan for: {task}")

# Phase 2: Execution
for step in plan.steps:
    result = execute_step(step)
    if result.failed:
        plan = llm.generate(f"Replan, step failed: {step}")
```

### For Self-Ask
```python
system_prompt = """
Break complex questions into simpler sub-questions.
Format:
QUESTION: [main question]
SUB-Q: [first sub-question]
ANSWER: [answer from tool/search]
...
FINAL: [combined answer]
"""
```

---

## Error Handling by Pattern

| Pattern | Error Strategy |
|---------|----------------|
| **ReAct** | Next thought acknowledges error, tries different approach |
| **Plan-Execute** | Replan with knowledge of what failed |
| **Self-Ask** | Rephrase sub-question, try different search |
| **Reflexion** | Explicit reflection on what went wrong, retry |
| **CRITIC** | Revision specifically addresses identified issues |

---

## Key Takeaways

1. **ReAct is most flexible** — Good default for dynamic tasks
2. **Plan-Execute is most predictable** — Good for structured workflows
3. **Self-Ask excels at research** — Decomposes complex questions
4. **Reflexion enables learning** — Great for tasks with clear success criteria
5. **Combine patterns** — Real agents often use multiple patterns

---

## Practice Exercise

For each scenario, choose the best pattern:

1. **Building a customer support agent that handles varied requests**
   Pattern: ______________ Why: ______________

2. **Creating a report by gathering data from multiple sources**
   Pattern: ______________ Why: ______________

3. **Writing code that must pass tests**
   Pattern: ______________ Why: ______________

**Answers:**
1. ReAct — Dynamic situations, need flexible reasoning
2. Self-Ask or Hybrid — Research requiring decomposition
3. Reflexion — Clear success criteria (tests), iterative improvement

---

**Next:** [03-Tool-Calling.md](03-Tool-Calling.md) — Designing tools for agents
