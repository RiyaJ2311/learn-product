# Module 4: Building AI Agents

## Quick Take

You understand what agents are and how they work. Now it's time to build them. This module is hands-on—covering architecture decisions, frameworks, memory management, and production considerations.

**Your Context:** You want to go from understanding agents to actually building them.

**Your Goal:** Be able to design, implement, and deploy a working AI agent.

---

## What You'll Build

By the end of this module, you'll understand how to create:

```
┌─────────────────────────────────────────────────────────────┐
│ YOUR AGENT TOOLKIT                                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. SIMPLE AGENT                                            │
│     └── Basic loop with tools                               │
│     └── Handle common tasks                                 │
│                                                             │
│  2. PRODUCTION AGENT                                        │
│     └── Memory management                                   │
│     └── Error handling                                      │
│     └── Logging and monitoring                              │
│     └── Cost controls                                       │
│                                                             │
│  3. SPECIALIZED AGENTS                                      │
│     └── Research agent                                      │
│     └── Coding agent                                        │
│     └── Customer support agent                              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## What's Covered

| Part | Title | What to Focus On |
|------|-------|-------------------|
| 01 | Architecture | Core components and how to structure an agent |
| 02 | Frameworks | Popular tools and when to use them |
| 03 | Memory & State | Managing context and conversation history |
| 04 | Production Ready | Logging, monitoring, error handling, cost control |

---

## The Build vs Buy Decision

Before building, consider:

```
┌─────────────────────────────────────────────────────────────┐
│ BUILD vs USE EXISTING                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  USE EXISTING AGENT (ChatGPT, Claude, etc.)                 │
│  ─────────────────────────────────────────                  │
│  ✓ Fastest to start                                         │
│  ✓ No infrastructure needed                                 │
│  ✗ Limited customization                                    │
│  ✗ Can't integrate with your systems                       │
│                                                             │
│  USE FRAMEWORK (LangChain, CrewAI, etc.)                    │
│  ──────────────────────────────────────                     │
│  ✓ Pre-built components                                     │
│  ✓ Active community                                         │
│  ✗ Learning curve                                           │
│  ✗ Framework lock-in                                        │
│                                                             │
│  BUILD FROM SCRATCH                                         │
│  ─────────────────                                          │
│  ✓ Full control                                             │
│  ✓ Optimized for your needs                                 │
│  ✗ More development time                                    │
│  ✗ Maintenance burden                                       │
│                                                             │
│  RECOMMENDATION: Start with framework or scratch for       │
│  learning, then decide based on production needs           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Prerequisites

Before starting:
- Understand agent concepts (Module 3)
- Basic programming (Python recommended)
- Access to an LLM API (OpenAI, Anthropic, etc.)

---

## Quick Start: Minimal Agent

Here's the simplest possible agent to show the core pattern:

```python
import anthropic

def simple_agent(goal: str) -> str:
    """A minimal agent that uses tools to achieve a goal."""

    client = anthropic.Anthropic()

    tools = [
        {
            "name": "search",
            "description": "Search for information",
            "input_schema": {
                "type": "object",
                "properties": {
                    "query": {"type": "string"}
                },
                "required": ["query"]
            }
        }
    ]

    messages = [{"role": "user", "content": goal}]

    # The agent loop
    while True:
        response = client.messages.create(
            model="claude-sonnet-4-20250514",
            max_tokens=1024,
            tools=tools,
            messages=messages
        )

        # Check if done
        if response.stop_reason == "end_turn":
            # Extract final text response
            for block in response.content:
                if hasattr(block, 'text'):
                    return block.text
            return "Done"

        # Handle tool use
        if response.stop_reason == "tool_use":
            # Add assistant's response to messages
            messages.append({
                "role": "assistant",
                "content": response.content
            })

            # Process each tool call
            tool_results = []
            for block in response.content:
                if block.type == "tool_use":
                    # Execute the tool (simplified)
                    result = f"Search results for: {block.input['query']}"
                    tool_results.append({
                        "type": "tool_result",
                        "tool_use_id": block.id,
                        "content": result
                    })

            messages.append({
                "role": "user",
                "content": tool_results
            })

# Run it
result = simple_agent("Find information about AI agents")
print(result)
```

This is ~50 lines and demonstrates the core loop. The rest of this module expands on making this production-ready.

---

## Learning Path

```
┌─────────────────────────────────────────────────────────────┐
│ RECOMMENDED ORDER                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. Architecture (understand the pieces)                    │
│     ↓                                                       │
│  2. Build minimal agent (hands-on)                         │
│     ↓                                                       │
│  3. Explore frameworks (see what's available)              │
│     ↓                                                       │
│  4. Add memory management (handle real conversations)      │
│     ↓                                                       │
│  5. Production hardening (ready for real users)            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Start Here

**Go to:** [01-Architecture.md](01-Architecture.md)

Or based on your needs:
- "How do I structure an agent?" → [01-Architecture.md](01-Architecture.md)
- "What frameworks exist?" → [02-Frameworks.md](02-Frameworks.md)
- "How do I handle memory?" → [03-Memory-State.md](03-Memory-State.md)
- "How do I make it production-ready?" → [04-Production-Ready.md](04-Production-Ready.md)
