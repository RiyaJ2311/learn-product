# Multi-Agent Systems

## Quick Take

What if instead of one agent doing everything, you had specialized agents working together? **Multi-agent systems** use multiple AI agents—each with specific roles and expertise—to accomplish complex tasks collaboratively.

**Remember:** Just like human teams, AI teams can be more effective than individuals through specialization and collaboration.

---

## Why Multiple Agents?

### The Problem with Single Agents

```
┌─────────────────────────────────────────────────────────────┐
│ SINGLE AGENT LIMITATIONS                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Task: "Build a complete marketing campaign"               │
│                                                             │
│  One agent trying to:                                       │
│  ✓ Research target audience                                │
│  ✓ Write copy                                               │
│  ✓ Design graphics (not really possible)                   │
│  ✓ Analyze data                                             │
│  ✓ Manage budget                                            │
│  ✓ Coordinate timeline                                      │
│                                                             │
│  Problems:                                                  │
│  • Context window fills up                                  │
│  • Can't be expert in everything                           │
│  • Single failure point                                     │
│  • Hard to parallelize                                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### The Multi-Agent Solution

```
┌─────────────────────────────────────────────────────────────┐
│ MULTI-AGENT APPROACH                                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│                    ┌───────────────┐                        │
│                    │  COORDINATOR  │                        │
│                    │    AGENT      │                        │
│                    └───────┬───────┘                        │
│                            │                                │
│         ┌──────────────────┼──────────────────┐            │
│         │                  │                  │            │
│         ▼                  ▼                  ▼            │
│  ┌─────────────┐   ┌─────────────┐   ┌─────────────┐      │
│  │  RESEARCH   │   │   WRITER    │   │  ANALYST    │      │
│  │   AGENT     │   │   AGENT     │   │   AGENT     │      │
│  └─────────────┘   └─────────────┘   └─────────────┘      │
│                                                             │
│  Each agent:                                                │
│  • Has specialized expertise                               │
│  • Has focused context                                     │
│  • Can work in parallel                                    │
│  • Can fail independently                                  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Multi-Agent Architectures

### 1. Hierarchical (Manager → Workers)

```
┌─────────────────────────────────────────────────────────────┐
│ HIERARCHICAL ARCHITECTURE                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│                    ┌───────────────┐                        │
│                    │   MANAGER     │                        │
│                    │   AGENT       │                        │
│                    └───────┬───────┘                        │
│                            │ Assigns tasks                  │
│                            │ Receives results               │
│         ┌──────────────────┼──────────────────┐            │
│         ▼                  ▼                  ▼            │
│  ┌─────────────┐   ┌─────────────┐   ┌─────────────┐      │
│  │  WORKER 1   │   │  WORKER 2   │   │  WORKER 3   │      │
│  └─────────────┘   └─────────────┘   └─────────────┘      │
│                                                             │
│  Flow:                                                      │
│  1. Manager receives complex task                          │
│  2. Manager breaks down and assigns to workers             │
│  3. Workers complete subtasks                               │
│  4. Manager aggregates and responds                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Best for:** Complex projects with clear subtask divisions

---

### 2. Peer Collaboration

```
┌─────────────────────────────────────────────────────────────┐
│ PEER COLLABORATION ARCHITECTURE                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│     ┌─────────────┐       ┌─────────────┐                  │
│     │   AGENT A   │◄─────►│   AGENT B   │                  │
│     │  (Writer)   │       │  (Editor)   │                  │
│     └──────┬──────┘       └──────┬──────┘                  │
│            │                     │                          │
│            │    ┌───────────┐   │                          │
│            └───►│ Shared    │◄──┘                          │
│                 │ Workspace │                               │
│            ┌───►│           │◄──┐                          │
│            │    └───────────┘   │                          │
│     ┌──────┴──────┐       ┌──────┴──────┐                  │
│     │   AGENT C   │◄─────►│   AGENT D   │                  │
│     │ (Researcher)│       │ (Reviewer)  │                  │
│     └─────────────┘       └─────────────┘                  │
│                                                             │
│  Flow: Agents communicate directly, share workspace        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Best for:** Creative tasks, iterative refinement

---

### 3. Pipeline (Sequential)

```
┌─────────────────────────────────────────────────────────────┐
│ PIPELINE ARCHITECTURE                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐    │
│  │ AGENT 1 │ → │ AGENT 2 │ → │ AGENT 3 │ → │ AGENT 4 │    │
│  │Research │   │ Draft   │   │ Review  │   │ Polish  │    │
│  └─────────┘   └─────────┘   └─────────┘   └─────────┘    │
│                                                             │
│  Flow:                                                      │
│  1. Agent 1 produces output                                │
│  2. Output becomes Agent 2's input                         │
│  3. Each agent adds/refines                                │
│  4. Final agent produces result                             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Best for:** Content pipelines, data processing

---

### 4. Debate/Consensus

```
┌─────────────────────────────────────────────────────────────┐
│ DEBATE ARCHITECTURE                                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Question: "Should we launch feature X?"                   │
│                                                             │
│     ┌─────────────┐         ┌─────────────┐               │
│     │  ADVOCATE   │         │   CRITIC    │               │
│     │   AGENT     │◄───────►│   AGENT     │               │
│     │ (Pro case)  │         │ (Con case)  │               │
│     └─────────────┘         └─────────────┘               │
│              │                     │                        │
│              └──────────┬──────────┘                        │
│                         ▼                                   │
│                 ┌─────────────┐                             │
│                 │    JUDGE    │                             │
│                 │    AGENT    │                             │
│                 └─────────────┘                             │
│                         │                                   │
│                         ▼                                   │
│                   Final Decision                            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Best for:** Decisions, analysis, reducing bias

---

## Communication Patterns

### Direct Messaging

```python
# Agent A sends message to Agent B
agent_b.receive({
    "from": "agent_a",
    "type": "request",
    "content": "Please review this draft",
    "attachment": draft_content
})
```

### Shared Memory/Blackboard

```python
# All agents read/write to shared space
workspace = SharedWorkspace()

# Agent A writes
workspace.write("research_findings", findings)

# Agent B reads
findings = workspace.read("research_findings")
workspace.write("draft", draft_based_on_findings)

# Agent C reads both
findings = workspace.read("research_findings")
draft = workspace.read("draft")
workspace.write("review", review_comments)
```

### Message Queue

```python
# Agents communicate via queue
task_queue = Queue()

# Manager adds tasks
task_queue.put({"task": "research", "topic": "AI agents"})
task_queue.put({"task": "write", "section": "intro"})

# Workers pull and complete
while task := task_queue.get():
    result = agent.process(task)
    results_queue.put(result)
```

---

## Practical Example: Content Creation Team

```
┌─────────────────────────────────────────────────────────────┐
│ CONTENT TEAM MULTI-AGENT SYSTEM                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  TASK: "Create a blog post about AI agents"                │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ EDITOR-IN-CHIEF (Coordinator)                        │   │
│  │ "Orchestrates the process, ensures quality"          │   │
│  └──────────────────────┬──────────────────────────────┘   │
│                         │                                   │
│  ┌──────────────────────┼──────────────────────┐           │
│  │                      │                      │           │
│  ▼                      ▼                      ▼           │
│  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐        │
│  │ RESEARCHER   │ │ WRITER       │ │ SEO          │        │
│  │              │ │              │ │ SPECIALIST   │        │
│  │ • Finds      │ │ • Drafts     │ │ • Keywords   │        │
│  │   sources    │ │   content    │ │ • Meta tags  │        │
│  │ • Gathers    │ │ • Structures │ │ • Readability│        │
│  │   facts      │ │   story      │ │              │        │
│  └──────────────┘ └──────────────┘ └──────────────┘        │
│                                                             │
│  FLOW:                                                      │
│  1. Editor assigns: "Research AI agent trends"             │
│  2. Researcher → Findings to Writer                        │
│  3. Writer → Draft to SEO Specialist                       │
│  4. SEO → Optimized draft back to Editor                   │
│  5. Editor → Final review and approval                     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Benefits and Challenges

### Benefits

| Benefit | Explanation |
|---------|-------------|
| **Specialization** | Each agent excels at one thing |
| **Parallelization** | Multiple agents work simultaneously |
| **Scalability** | Add more agents for more capacity |
| **Fault tolerance** | One agent failing doesn't kill everything |
| **Focused context** | Each agent has relevant context only |

### Challenges

| Challenge | Mitigation |
|-----------|------------|
| **Coordination overhead** | Well-designed communication protocols |
| **Inconsistency** | Shared context, review agents |
| **Debugging difficulty** | Logging, tracing, clear agent IDs |
| **Cost multiplication** | Use cheaper models for simple agents |
| **Latency** | Parallelize where possible |

---

## When to Use Multi-Agent

### Good Fit

- Complex tasks requiring multiple types of expertise
- Tasks that naturally parallelize
- Workflows with distinct phases
- Tasks benefiting from different perspectives

### Not Worth It

- Simple tasks one agent handles well
- When coordination overhead exceeds benefit
- Tight latency requirements
- Limited budget (more agents = more cost)

---

## Implementation Approaches

### Manual Orchestration

```python
class SimpleMultiAgent:
    def __init__(self):
        self.researcher = Agent("researcher", research_prompt)
        self.writer = Agent("writer", writer_prompt)
        self.reviewer = Agent("reviewer", reviewer_prompt)

    def create_content(self, topic):
        # Sequential pipeline
        research = self.researcher.run(f"Research: {topic}")
        draft = self.writer.run(f"Write about: {topic}\n\nResearch: {research}")
        final = self.reviewer.run(f"Review and improve: {draft}")
        return final
```

### Framework-Based (e.g., CrewAI, AutoGen)

```python
from crewai import Crew, Agent, Task

researcher = Agent(
    role="Researcher",
    goal="Find comprehensive information",
    backstory="Expert research analyst"
)

writer = Agent(
    role="Writer",
    goal="Create engaging content",
    backstory="Experienced content creator"
)

crew = Crew(
    agents=[researcher, writer],
    tasks=[
        Task(description="Research AI agents", agent=researcher),
        Task(description="Write blog post", agent=writer)
    ]
)

result = crew.kickoff()
```

---

## Things to Remember

1. **Specialize agents** — Each agent does one thing well
2. **Choose the right architecture** — Hierarchical, peer, pipeline, or debate
3. **Design clear communication** — Messages, shared memory, or queues
4. **Balance complexity** — Only use multi-agent when it helps
5. **Monitor and trace** — Debugging multi-agent is harder

---

**Next:** [05-Subagents.md](05-Subagents.md) — Delegating to specialized subagents
