# What Are AI Agents?

## Quick Take

An AI agent is a system that uses a language model as its "brain" to autonomously accomplish goals. Unlike simple AI that responds to single prompts, agents can plan, take actions, observe results, and iterate until the task is complete.

**Remember:** Agents are not a new type of AI—they're an architecture that combines LLMs with tools and a reasoning loop.

---

## The Simple Definition

```
┌─────────────────────────────────────────────────────────────┐
│ AGENT = LLM + TOOLS + LOOP                                   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  LLM (The Brain)                                            │
│  └── Understands the goal                                   │
│  └── Decides what to do                                     │
│  └── Processes results                                      │
│                                                             │
│  TOOLS (The Hands)                                          │
│  └── Search the web                                         │
│  └── Read/write files                                       │
│  └── Call APIs                                              │
│  └── Execute code                                           │
│                                                             │
│  LOOP (The Process)                                         │
│  └── Think → Act → Observe → Repeat                        │
│  └── Until goal is achieved                                 │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## How Agents Work: A Concrete Example

Let's trace through a real example:

**User request:** "Find the top 3 performing blog posts this month and create a social media plan for them."

```
┌─────────────────────────────────────────────────────────────┐
│ AGENT EXECUTION TRACE                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  TURN 1 - THINK                                             │
│  "I need to find top blog posts. I should use the          │
│   analytics tool to get traffic data."                      │
│                                                             │
│  TURN 1 - ACT                                               │
│  → Calls: get_analytics(metric="pageviews", period="month")│
│  → Returns: [{url: "/ai-guide", views: 15000},              │
│              {url: "/prompting", views: 12000},             │
│              {url: "/agents", views: 9000}, ...]            │
│                                                             │
│  TURN 1 - OBSERVE                                           │
│  "Got the data. Top 3 posts are: AI Guide, Prompting,      │
│   Agents. Now I need to read each post's content."         │
│                                                             │
│  ────────────────────────────────────────────────────────   │
│                                                             │
│  TURN 2 - THINK                                             │
│  "I'll read the first post to understand its content       │
│   for social media planning."                               │
│                                                             │
│  TURN 2 - ACT                                               │
│  → Calls: read_post(url="/ai-guide")                       │
│  → Returns: {title: "Complete AI Guide", content: "..."}   │
│                                                             │
│  TURN 2 - OBSERVE                                           │
│  "Got the content. Key themes: AI basics, practical tips.  │
│   Let me read the other two posts."                        │
│                                                             │
│  ────────────────────────────────────────────────────────   │
│                                                             │
│  TURNS 3-4: [Similar - reads other posts]                  │
│                                                             │
│  ────────────────────────────────────────────────────────   │
│                                                             │
│  TURN 5 - THINK                                             │
│  "I have all the content. Now I'll create a social media  │
│   plan with specific post suggestions."                    │
│                                                             │
│  TURN 5 - ACT                                               │
│  → No tool needed, generates the plan                       │
│                                                             │
│  TURN 5 - OUTPUT                                            │
│  "Here's your social media plan:                           │
│                                                             │
│   Post 1: AI Guide                                         │
│   - Twitter: [5 tweet thread ideas]                        │
│   - LinkedIn: [Long-form post angle]                       │
│   - Instagram: [Carousel concept]                          │
│   ..."                                                      │
│                                                             │
│  DONE - Goal achieved                                       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Agent Architecture

### Core Components

```
┌─────────────────────────────────────────────────────────────┐
│ AGENT ARCHITECTURE                                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                    ORCHESTRATOR                      │   │
│  │  (The main loop that coordinates everything)         │   │
│  └──────────────────────┬──────────────────────────────┘   │
│                         │                                   │
│         ┌───────────────┼───────────────┐                  │
│         │               │               │                  │
│         ▼               ▼               ▼                  │
│  ┌────────────┐  ┌────────────┐  ┌────────────┐           │
│  │    LLM     │  │   TOOLS    │  │   MEMORY   │           │
│  │            │  │            │  │            │           │
│  │ • Reasoning│  │ • Search   │  │ • History  │           │
│  │ • Planning │  │ • Read     │  │ • State    │           │
│  │ • Deciding │  │ • Write    │  │ • Context  │           │
│  │            │  │ • Execute  │  │            │           │
│  └────────────┘  └────────────┘  └────────────┘           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### How They Connect

```python
# Simplified agent loop (pseudocode)
class Agent:
    def __init__(self, llm, tools, system_prompt):
        self.llm = llm
        self.tools = tools
        self.memory = []
        self.system_prompt = system_prompt

    def run(self, user_goal):
        self.memory.append({"role": "user", "content": user_goal})

        while True:
            # 1. THINK: Ask LLM what to do
            response = self.llm.chat(
                system=self.system_prompt,
                messages=self.memory,
                tools=self.tools
            )

            # 2. CHECK: Is the task complete?
            if response.is_final_answer:
                return response.content

            # 3. ACT: Execute the tool
            if response.tool_call:
                result = self.execute_tool(response.tool_call)

                # 4. OBSERVE: Add result to memory
                self.memory.append({"role": "assistant", "content": response})
                self.memory.append({"role": "tool", "content": result})

            # Loop continues until done
```

---

## Agents vs Chatbots vs Pipelines

| Aspect | Chatbot | Pipeline | Agent |
|--------|---------|----------|-------|
| **Control flow** | User drives each turn | Fixed, predetermined | AI decides dynamically |
| **Planning** | None | Hardcoded | Emergent from LLM |
| **Tool use** | Limited or none | Fixed sequence | Dynamic, as needed |
| **Iterations** | User-initiated | Fixed count | Until goal met |
| **Error handling** | Return error | Fail or skip | Retry, adapt |
| **Best for** | Conversations | Repeatable tasks | Open-ended goals |

---

## Types of Agents

### By Autonomy Level

```
┌─────────────────────────────────────────────────────────────┐
│ AUTONOMY SPECTRUM                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  LEVEL 1: ASSISTED                                          │
│  └── AI suggests, human approves each action               │
│  └── Example: Code review assistant                         │
│                                                             │
│  LEVEL 2: SUPERVISED                                        │
│  └── AI executes, human monitors and can intervene         │
│  └── Example: Customer support with escalation              │
│                                                             │
│  LEVEL 3: SEMI-AUTONOMOUS                                   │
│  └── AI executes routine tasks, asks for help when stuck   │
│  └── Example: Code generation with human review at end     │
│                                                             │
│  LEVEL 4: FULLY AUTONOMOUS                                  │
│  └── AI executes end-to-end without intervention           │
│  └── Example: Background data processing agents             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### By Specialization

| Type | Focus | Example |
|------|-------|---------|
| **Generalist** | Wide range of tasks | ChatGPT with plugins |
| **Specialist** | Single domain | Coding agent (Cursor) |
| **Researcher** | Information gathering | Perplexity |
| **Executor** | Taking actions | Zapier AI |
| **Coordinator** | Managing other agents | CrewAI orchestrator |

---

## When Agents Excel

### Complex Multi-Step Tasks

```
❌ Simple task (don't need agent):
"Translate this sentence to French"
→ One LLM call is enough

✅ Complex task (agent helps):
"Research our top 5 competitors, analyze their pricing
strategies, and create a comparison table with recommendations"
→ Multiple searches, reads, analysis, synthesis
```

### Tasks Requiring Iteration

```
❌ One-shot task (don't need agent):
"Write a function that adds two numbers"
→ Generate and done

✅ Iterative task (agent helps):
"Fix the bugs in this codebase"
→ Read code → Identify issues → Fix → Test → Repeat
```

### Dynamic Decision Making

```
❌ Fixed workflow (don't need agent):
"Send email if order > $100"
→ Simple rule

✅ Dynamic workflow (agent helps):
"Handle this customer complaint appropriately"
→ Needs to analyze, decide approach, take varied actions
```

---

## Agent Limitations

### Things Agents Struggle With

```
┌─────────────────────────────────────────────────────────────┐
│ AGENT LIMITATIONS                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. LONG-HORIZON PLANNING                                   │
│     Agents can lose track in very long tasks                │
│     → Solution: Break into subtasks, use checkpoints       │
│                                                             │
│  2. RECOVERY FROM DEEP MISTAKES                             │
│     If agent goes wrong early, hard to recover              │
│     → Solution: Human checkpoints, backtracking            │
│                                                             │
│  3. NOVEL SITUATIONS                                        │
│     Agents follow patterns; truly new scenarios are hard   │
│     → Solution: Clear fallback to human escalation         │
│                                                             │
│  4. COST AND LATENCY                                        │
│     Multiple LLM calls add up in time and money            │
│     → Solution: Use cheaper models for simple steps        │
│                                                             │
│  5. DETERMINISM                                             │
│     Same input might produce different execution paths     │
│     → Solution: Lower temperature, structured outputs      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Building Blocks You Need

To build an agent, you need:

### 1. A Good LLM
- Needs to be capable of reasoning and tool use
- GPT-4, Claude 3+, or similar

### 2. Well-Designed Tools
- Clear descriptions so AI knows when to use them
- Proper error handling
- Appropriate permissions/safety

### 3. A System Prompt
- Defines agent's role and behavior
- Sets guardrails and constraints
- Guides planning approach

### 4. An Orchestration Loop
- Manages the think-act-observe cycle
- Handles memory/context
- Implements stopping conditions

---

## Product Use Cases

| Use Case | Agent Implementation |
|----------|---------------------|
| **Code Assistant** | Reads codebase, writes code, runs tests, iterates |
| **Research Assistant** | Searches, reads, synthesizes, cites sources |
| **Customer Support** | Classifies issues, looks up info, resolves or escalates |
| **Data Analyst** | Explores data, creates visualizations, finds insights |
| **Content Creator** | Researches topics, outlines, writes, edits |
| **Personal Assistant** | Manages calendar, sends emails, coordinates tasks |

---

## Things to Remember

1. **Agents = LLM + Tools + Loop** — It's an architecture, not magic
2. **Think-Act-Observe cycle** — The fundamental pattern
3. **Autonomy is a spectrum** — From human-approved to fully autonomous
4. **Best for complex, multi-step tasks** — Not simple Q&A
5. **Limitations exist** — Long horizons, mistakes, cost
6. **Start simple** — Add complexity as needed

---

## Quick Check: Do You Need an Agent?

Ask yourself:
- [ ] Does the task require multiple steps?
- [ ] Are the steps not predetermined (dynamic)?
- [ ] Does it need to use external tools/data?
- [ ] Does it need to iterate based on results?
- [ ] Is there a clear goal/success condition?

**If you checked 3+ boxes, an agent might help.**

---

**Next:** [02-Agent-Patterns.md](02-Agent-Patterns.md) — Common agent architectures
