# Module 3: AI Agents

## Quick Take

Everything you've learned so far, prompting, tools, reasoning, comes together in **AI Agents**. An agent is an AI that can autonomously plan and execute multi-step tasks, using tools to take actions and adapting based on results.

**Your Context:** You've mastered individual AI capabilities. Now you're ready to understand how to combine them into autonomous systems.

**Your Goal:** Understand what agents are, when to use them, common patterns, and how multi-agent systems work (including subagents).

---

## What Makes an Agent Different

```
┌─────────────────────────────────────────────────────────────┐
│ SIMPLE AI vs AGENT                                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  SIMPLE AI (What you've used so far)                        │
│  ───────────────────────────────────                        │
│  User prompt → AI response                                  │
│  One turn, one output, done                                 │
│                                                             │
│  Example: "Summarize this document" → Summary               │
│                                                             │
│  ═══════════════════════════════════════════════════════   │
│                                                             │
│  AI AGENT                                                   │
│  ────────                                                   │
│  User goal → AI plans → AI acts → AI observes → Repeat     │
│  Multiple turns, autonomous execution, goal completion      │
│                                                             │
│  Example: "Find and fix the bug in my code"                │
│           1. AI reads error message                         │
│           2. AI searches codebase for relevant files        │
│           3. AI reads those files                           │
│           4. AI identifies the bug                          │
│           5. AI writes a fix                               │
│           6. AI runs tests to verify                        │
│           7. AI reports completion                          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## The Agent Loop

Every agent follows this fundamental pattern:

```
┌─────────────────────────────────────────────────────────────┐
│ THE AGENT LOOP                                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│              ┌──────────────┐                               │
│              │   OBSERVE    │ ← What's the current state?  │
│              │   (Perceive) │                               │
│              └──────┬───────┘                               │
│                     │                                       │
│                     ▼                                       │
│              ┌──────────────┐                               │
│              │    THINK     │ ← What should I do next?     │
│              │   (Reason)   │                               │
│              └──────┬───────┘                               │
│                     │                                       │
│                     ▼                                       │
│              ┌──────────────┐                               │
│              │     ACT      │ ← Execute tool/action        │
│              │   (Execute)  │                               │
│              └──────┬───────┘                               │
│                     │                                       │
│                     ▼                                       │
│              ┌──────────────┐                               │
│          ┌───│   EVALUATE   │ ← Am I done? Did it work?    │
│          │   │   (Check)    │                               │
│          │   └──────────────┘                               │
│          │         │                                        │
│          │    Not done                                      │
│          │         │                                        │
│          └─────────┘                                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## What's Covered

| Part | Title | What to Focus On |
|------|-------|-------------------|
| 01 | What Are Agents | Core concepts, architecture, when to use |
| 02 | Agent Patterns | ReAct, Plan-Execute, and other architectures |
| 03 | Tool Calling Deep Dive | Advanced tool design for agents |
| 04 | Multi-Agent Systems | Multiple agents working together |
| 05 | Subagents | Delegating subtasks to specialized agents |

---

## Agent Capabilities

What can agents do?

```
┌─────────────────────────────────────────────────────────────┐
│ AGENT SUPERPOWERS                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ✓ AUTONOMOUS EXECUTION                                     │
│    Work without constant human input                        │
│                                                             │
│  ✓ DYNAMIC PLANNING                                         │
│    Figure out steps based on the situation                  │
│                                                             │
│  ✓ TOOL USE                                                 │
│    Search, read files, call APIs, execute code              │
│                                                             │
│  ✓ ERROR RECOVERY                                           │
│    Handle failures and try alternative approaches           │
│                                                             │
│  ✓ CONTEXT RETENTION                                        │
│    Remember what was done and learned                       │
│                                                             │
│  ✓ GOAL DECOMPOSITION                                       │
│    Break big tasks into manageable steps                    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Real-World Agent Examples

### Coding Agent (like Claude Code, Cursor, GitHub Copilot)
```
Goal: "Add a dark mode feature to the app"

Agent actions:
1. Reads current codebase structure
2. Identifies theme/styling patterns
3. Creates color variables for dark theme
4. Modifies components to support themes
5. Adds theme toggle component
6. Runs tests
7. Reports completion with summary
```

### Research Agent
```
Goal: "Analyze competitors' pricing strategies"

Agent actions:
1. Searches for competitor list
2. Visits each competitor's pricing page
3. Extracts pricing information
4. Compares to our pricing
5. Identifies patterns and gaps
6. Generates competitive analysis report
```

### Customer Support Agent
```
Goal: "Help customer with refund request"

Agent actions:
1. Reads customer message
2. Looks up order in database
3. Checks refund policy eligibility
4. Determines if auto-approve or escalate
5. Either processes refund or escalates to human
6. Sends response to customer
```

---

## When to Use Agents

### Good Use Cases

| Use Case | Why Agents Help |
|----------|-----------------|
| Complex research | Multiple search/read/synthesize cycles |
| Code generation | Read context, write, test, iterate |
| Data analysis | Explore data, form hypotheses, verify |
| Process automation | Multi-step workflows with decisions |
| Customer support | Handle varied requests dynamically |

### Not-So-Good Use Cases

| Use Case | Why Agents Are Overkill |
|----------|------------------------|
| Simple Q&A | One turn is enough |
| Translations | Deterministic, no iteration needed |
| Summarization | Single task, no planning |
| Form filling | Fixed workflow, use rules |

---

## Agent Risks and Guardrails

```
┌─────────────────────────────────────────────────────────────┐
│ AGENT RISKS                                                  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ⚠️ RUNAWAY EXECUTION                                       │
│     Agent loops infinitely or runs up costs                 │
│     → Set max iterations and cost limits                   │
│                                                             │
│  ⚠️ WRONG ACTIONS                                           │
│     Agent misunderstands and does something bad             │
│     → Require confirmation for destructive actions         │
│                                                             │
│  ⚠️ HALLUCINATED PLANS                                      │
│     Agent creates plausible but wrong approaches            │
│     → Validate agent's reasoning, add checkpoints          │
│                                                             │
│  ⚠️ SECURITY VULNERABILITIES                                │
│     Agent can be tricked via prompt injection               │
│     → Validate inputs, limit tool permissions              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Prerequisites

Before diving in, ensure you understand:
- Tool use (Module 2)
- Chain-of-thought reasoning (Module 2)
- When AI vs rules (Module 1)

---

## Start Here

**Go to:** [01-What-are-Agents.md](01-What-are-Agents.md)

Or jump to your interest:
- "What exactly is an agent?" → [01-What-are-Agents.md](01-What-are-Agents.md)
- "What patterns do agents use?" → [02-Agent-Patterns.md](02-Agent-Patterns.md)
- "How do I design tools for agents?" → [03-Tool-Calling.md](03-Tool-Calling.md)
- "Can agents work together?" → [04-Multi-Agent-Systems.md](04-Multi-Agent-Systems.md)
- "What are subagents?" → [05-Subagents.md](05-Subagents.md)
