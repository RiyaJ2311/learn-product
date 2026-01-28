# Subagents

## Quick Take

A **subagent** is an agent spawned by another agent to handle a specific subtask. Think of it as delegation, the main agent recognizes it needs specialized help and creates a focused agent to handle that part, then continues with the results.

**Remember:** Subagents let agents decompose complex problems without losing focus or filling up their context window.

---

## Subagents vs Multi-Agent Systems

```
┌─────────────────────────────────────────────────────────────┐
│ SUBAGENTS vs MULTI-AGENT                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  MULTI-AGENT SYSTEM                                         │
│  ─────────────────                                          │
│  • Pre-defined team of agents                               │
│  • All agents exist from the start                          │
│  • Roles assigned upfront                                   │
│  • Coordination planned in advance                          │
│                                                             │
│  SUBAGENTS                                                  │
│  ─────────                                                  │
│  • Created on-demand by parent agent                        │
│  • Spawned when needed for specific subtasks               │
│  • Parent decides when delegation helps                    │
│  • Dynamic, flexible composition                            │
│                                                             │
│  KEY DIFFERENCE:                                          │
│  Multi-agent = pre-built team                               │
│  Subagents = hire specialists as needed                    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## How Subagents Work

### The Pattern

```
┌─────────────────────────────────────────────────────────────┐
│ SUBAGENT EXECUTION FLOW                                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  PARENT AGENT working on main task                          │
│       │                                                     │
│       │ "This subtask is complex, let me delegate"         │
│       │                                                     │
│       ▼                                                     │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ SPAWN SUBAGENT                                       │   │
│  │ • Clear, focused task                               │   │
│  │ • Specific context (not everything)                 │   │
│  │ • Defined output format                             │   │
│  └──────────────────────┬──────────────────────────────┘   │
│                         │                                   │
│                         ▼                                   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ SUBAGENT EXECUTES                                    │   │
│  │ • Has own loop (think → act → observe)              │   │
│  │ • Has own tools (maybe subset of parent's)          │   │
│  │ • Focused on single subtask                         │   │
│  └──────────────────────┬──────────────────────────────┘   │
│                         │                                   │
│                         ▼                                   │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ RETURN RESULT TO PARENT                              │   │
│  │ • Subagent terminates                               │   │
│  │ • Parent receives result                            │   │
│  │ • Parent continues with main task                   │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Real Example: Code Debugging

```
┌─────────────────────────────────────────────────────────────┐
│ EXAMPLE: Parent Agent Debugging Code                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  PARENT AGENT                                               │
│  Task: "Fix all bugs in this codebase"                     │
│                                                             │
│  Step 1: Runs tests, sees 3 failing                        │
│                                                             │
│  Step 2: "Test A is complex, let me spawn a subagent"      │
│                                                             │
│     ┌─────────────────────────────────────────────────┐    │
│     │ SUBAGENT 1                                       │    │
│     │ Task: "Fix the authentication test failure"      │    │
│     │ Context: Test file, auth module, error message   │    │
│     │                                                  │    │
│     │ Subagent actions:                              │    │
│     │ • Reads test file                               │    │
│     │ • Reads auth module                             │    │
│     │ • Identifies the bug                            │    │
│     │ • Writes fix                                    │    │
│     │ • Verifies fix works                            │    │
│     │                                                  │    │
│     │ Returns: "Fixed by updating token validation"   │    │
│     └─────────────────────────────────────────────────┘    │
│                                                             │
│  Step 3: Parent receives result, spawns subagent for Test B │
│                                                             │
│     ┌─────────────────────────────────────────────────┐    │
│     │ SUBAGENT 2                                       │    │
│     │ Task: "Fix the payment test failure"             │    │
│     │ [Similar process...]                             │    │
│     └─────────────────────────────────────────────────┘    │
│                                                             │
│  Step 4: Parent spawns subagent for Test C                 │
│                                                             │
│  Step 5: Parent aggregates all fixes, runs full test suite │
│                                                             │
│  Final: "All 3 bugs fixed. Here's the summary..."         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Benefits of Subagents

### 1. Context Management

```
┌─────────────────────────────────────────────────────────────┐
│ CONTEXT EFFICIENCY                                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  WITHOUT SUBAGENTS:                                       │
│  Parent keeps everything in context:                      │
│  [Task] + [File1] + [File2] + [File3] + [All results] +... │
│  → Context fills up, performance degrades                   │
│                                                             │
│  WITH SUBAGENTS:                                          │
│  Parent context: [Task] + [High-level progress]            │
│  Subagent 1: [Subtask1] + [File1] (then terminates)       │
│  Subagent 2: [Subtask2] + [File2] (then terminates)       │
│  → Each agent has focused, relevant context                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 2. Parallelization

```python
# Subagents can run in parallel
async def analyze_codebase(files):
    # Spawn subagents for each file concurrently
    tasks = [
        spawn_subagent(f"Analyze {file}", file_content)
        for file in files
    ]

    # All run in parallel
    results = await asyncio.gather(*tasks)

    return aggregate_results(results)
```

### 3. Specialization

```
┌─────────────────────────────────────────────────────────────┐
│ SPECIALIZED SUBAGENTS                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Parent: "Build this feature"                              │
│                                                             │
│  Subagent A (Research):                                  │
│  • System prompt: "You are a research specialist..."       │
│  • Tools: web_search, read_documentation                   │
│                                                             │
│  Subagent B (Coding):                                    │
│  • System prompt: "You are an expert programmer..."        │
│  • Tools: read_file, write_file, run_tests                │
│                                                             │
│  Subagent C (Testing):                                   │
│  • System prompt: "You are a QA specialist..."             │
│  • Tools: run_tests, read_coverage, write_test            │
│                                                             │
│  Each subagent optimized for its specific task            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 4. Failure Isolation

```
If Subagent 2 fails:
• Subagent 2's work is lost
• Parent can retry with different approach
• Subagent 1 and 3's work is preserved
• Partial progress maintained
```

---

## When to Spawn Subagents

### Good Delegation Candidates

| Signal | Example |
|--------|---------|
| **Distinct subtask** | "Research X, then do Y" → Research is separate |
| **Different expertise** | "Write code, then test it" → Testing is specialized |
| **Can run in parallel** | "Analyze files A, B, C" → All independent |
| **Large context needed** | "Deep dive into this module" → Will read many files |
| **Potentially risky** | "Try this approach" → Isolate the experiment |

### Keep In Parent

| Signal | Reason |
|--------|--------|
| **Quick, simple action** | Overhead not worth it |
| **Depends on recent context** | Would need to transfer too much |
| **Part of main flow** | Natural continuation |

---

## Implementation Patterns

### Pattern 1: Explicit Delegation Tool

```python
# Parent has a "delegate" tool
tools = [
    {
        "name": "delegate_task",
        "description": "Spawn a subagent to handle a complex subtask",
        "parameters": {
            "task": "Clear description of what to accomplish",
            "context": "Relevant information for the subtask",
            "tools_needed": ["list", "of", "tool", "names"]
        }
    },
    # ... other tools
]

def delegate_task(task, context, tools_needed):
    subagent = Agent(
        system_prompt=f"Complete this task: {task}",
        tools=[t for t in all_tools if t.name in tools_needed]
    )
    result = subagent.run(context)
    return result
```

### Pattern 2: Automatic Decomposition

```python
# Agent automatically identifies when to delegate
def agent_loop(task):
    while not done:
        response = llm.chat(messages, tools)

        if response.suggests_delegation:
            # Agent decided a subagent would help
            subtask = response.subtask
            result = spawn_subagent(subtask)
            messages.append({"role": "observation", "content": result})
        elif response.tool_call:
            # Normal tool use
            result = execute_tool(response.tool_call)
            messages.append({"role": "observation", "content": result})
        else:
            # Final answer
            return response.content
```

### Pattern 3: Type-Specialized Subagents

```python
SUBAGENT_TYPES = {
    "research": {
        "system_prompt": "You are a research specialist...",
        "tools": ["web_search", "read_docs"],
        "model": "gpt-4o-mini"  # Cheaper for research
    },
    "code": {
        "system_prompt": "You are an expert coder...",
        "tools": ["read_file", "write_file", "run_command"],
        "model": "claude-3-5-sonnet"  # Better for code
    },
    "review": {
        "system_prompt": "You are a code reviewer...",
        "tools": ["read_file", "search_code"],
        "model": "gpt-4o-mini"
    }
}

def spawn_subagent(type, task, context):
    config = SUBAGENT_TYPES[type]
    agent = Agent(
        system_prompt=config["system_prompt"],
        tools=config["tools"],
        model=config["model"]
    )
    return agent.run(f"{task}\n\nContext:\n{context}")
```

---

## Subagent Communication

### What to Pass Down

```
┌─────────────────────────────────────────────────────────────┐
│ PARENT → SUBAGENT HANDOFF                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  INCLUDE:                                                 │
│  ✓ Clear task description                                  │
│  ✓ Relevant context (not everything!)                      │
│  ✓ Expected output format                                  │
│  ✓ Constraints or requirements                             │
│  ✓ How result will be used                                 │
│                                                             │
│  DON'T INCLUDE:                                           │
│  ✗ Full parent conversation history                        │
│  ✗ Unrelated context                                       │
│  ✗ Implementation details parent will handle               │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### What to Return Up

```
┌─────────────────────────────────────────────────────────────┐
│ SUBAGENT → PARENT RETURN                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  INCLUDE:                                                 │
│  ✓ Task result/answer                                      │
│  ✓ Summary of approach taken                               │
│  ✓ Key findings or learnings                               │
│  ✓ Any warnings or caveats                                 │
│                                                             │
│  OPTIONAL:                                                │
│  • Detailed execution log (if needed for debugging)        │
│  • Intermediate artifacts (if parent needs them)           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Cost and Performance

### Model Selection

```
┌─────────────────────────────────────────────────────────────┐
│ MODEL STRATEGY FOR SUBAGENTS                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  PARENT AGENT: Use powerful model                          │
│  └── Needs to make complex decisions                       │
│  └── Orchestrates everything                                │
│  └── Worth the cost                                         │
│                                                             │
│  SUBAGENTS: Use appropriate model for task                 │
│  └── Simple research: GPT-4o-mini or Haiku                 │
│  └── Code generation: Claude 3.5 Sonnet                    │
│  └── Simple extraction: GPT-4o-mini                        │
│                                                             │
│  RESULT: Good quality at lower cost                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Parallelization Benefits

```
Sequential (no subagents):
Task A (5s) → Task B (5s) → Task C (5s) = 15s total

Parallel (with subagents):
Task A (5s)  ┐
Task B (5s)  ├→ 5s total (3x faster)
Task C (5s)  ┘
```

---

## Best Practices

### 1. Clear Task Boundaries
```
❌ "Handle this vaguely"
✅ "Find all usages of function X in the codebase and
    return them as a list with file paths and line numbers"
```

### 2. Appropriate Scope
```
❌ Too broad: "Build the entire feature"
❌ Too narrow: "Read line 5 of file.py"
✅ Just right: "Implement the authentication middleware"
```

### 3. Defined Success Criteria
```
✅ "Return success when all tests pass"
✅ "Complete when you've found at least 3 relevant sources"
✅ "Done when the extracted data matches the schema"
```

### 4. Resource Limits
```python
subagent = Agent(
    max_iterations=10,      # Don't run forever
    max_tokens=50000,       # Limit context growth
    timeout=300,            # 5 minute max
    model="gpt-4o-mini"     # Cost-appropriate
)
```

---

## Things to Remember

1. **Subagents = on-demand delegation** : Created when needed, not predefined
2. **Benefits: context, parallelization, specialization** : Focused agents are effective
3. **Pass minimal context** : Only what the subagent needs
4. **Return summarized results** : Don't pollute parent's context
5. **Use appropriate models** : Match power to task complexity
6. **Set limits** : Iterations, tokens, time

---

## Practice Exercise

Design a subagent strategy for this task:

**Main Task:** "Create a competitive analysis report"

**What subagents would you spawn?**
```
Subagent 1:
  Task: ________________________________
  Context needed: ______________________
  Tools: ______________________________

Subagent 2:
  Task: ________________________________
  Context needed: ______________________
  Tools: ______________________________

Subagent 3:
  Task: ________________________________
  Context needed: ______________________
  Tools: ______________________________
```

---

**Next Module:** [../04-Building-Agents/00-Index.md](../04-Building-Agents/00-Index.md) : Hands-on guide to building agents
