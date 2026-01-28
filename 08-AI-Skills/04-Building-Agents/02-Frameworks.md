# Agent Frameworks

## Quick Take

You don't have to build everything from scratch. Agent frameworks provide pre-built components, patterns, and integrations. This chapter covers the major options and helps you choose.

**Remember:** Frameworks accelerate development but add complexity. Choose based on your specific needs.

---

## Framework Landscape (2024-2025)

```
┌─────────────────────────────────────────────────────────────┐
│ POPULAR AGENT FRAMEWORKS                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  FULL FRAMEWORKS                                            │
│  ────────────────                                           │
│  • LangChain/LangGraph - Most popular, comprehensive       │
│  • CrewAI - Multi-agent with roles                         │
│  • AutoGPT/BabyAGI - Autonomous agents                     │
│  • Semantic Kernel - Microsoft's framework                 │
│                                                             │
│  LIGHTWEIGHT OPTIONS                                        │
│  ───────────────────                                        │
│  • Anthropic SDK - Direct tool use                         │
│  • OpenAI SDK - Assistants API                             │
│  • Instructor - Structured outputs                         │
│                                                             │
│  SPECIALIZED                                                │
│  ───────────                                                │
│  • Autogen - Microsoft, multi-agent conversations          │
│  • Haystack - Document processing                          │
│  • LlamaIndex - Data/RAG focused                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Framework Comparison

| Framework | Best For | Complexity | Learning Curve |
|-----------|----------|------------|----------------|
| **LangGraph** | Production agents | Medium-High | Medium |
| **CrewAI** | Multi-agent teams | Medium | Low |
| **Direct SDK** | Simple agents | Low | Low |
| **AutoGPT** | Autonomous tasks | High | High |
| **Semantic Kernel** | .NET/Enterprise | Medium | Medium |

---

## Option 1: Direct SDK (Anthropic/OpenAI)

### When to Use
- Simple agents
- Maximum control
- Learning how agents work
- Minimal dependencies

### Example (Anthropic)

```python
import anthropic

client = anthropic.Anthropic()

tools = [{
    "name": "get_weather",
    "description": "Get weather for a location",
    "input_schema": {
        "type": "object",
        "properties": {
            "location": {"type": "string"}
        },
        "required": ["location"]
    }
}]

def run_agent(goal):
    messages = [{"role": "user", "content": goal}]

    while True:
        response = client.messages.create(
            model="claude-sonnet-4-20250514",
            max_tokens=1024,
            tools=tools,
            messages=messages
        )

        if response.stop_reason == "end_turn":
            return response.content[0].text

        if response.stop_reason == "tool_use":
            messages.append({"role": "assistant", "content": response.content})

            for block in response.content:
                if block.type == "tool_use":
                    # Execute tool
                    result = execute_tool(block.name, block.input)
                    messages.append({
                        "role": "user",
                        "content": [{
                            "type": "tool_result",
                            "tool_use_id": block.id,
                            "content": str(result)
                        }]
                    })
```

**Pros:** Simple, no dependencies, full control
**Cons:** Build everything yourself, no pre-built integrations

---

## Option 2: LangGraph

### When to Use
- Production-grade agents
- Complex workflows
- Need persistence and streaming
- State machines

### Example

```python
from langgraph.graph import StateGraph, END
from langchain_anthropic import ChatAnthropic
from langchain_core.messages import HumanMessage
from typing import TypedDict, Annotated
import operator

# Define state
class AgentState(TypedDict):
    messages: Annotated[list, operator.add]

# Create tools
tools = [...]  # Define your tools

# Create model with tools
model = ChatAnthropic(model="claude-sonnet-4-20250514").bind_tools(tools)

# Define nodes
def call_model(state):
    response = model.invoke(state["messages"])
    return {"messages": [response]}

def call_tools(state):
    last_message = state["messages"][-1]
    results = []
    for tool_call in last_message.tool_calls:
        result = execute_tool(tool_call)
        results.append(result)
    return {"messages": results}

# Define routing
def should_continue(state):
    last_message = state["messages"][-1]
    if last_message.tool_calls:
        return "tools"
    return END

# Build graph
workflow = StateGraph(AgentState)
workflow.add_node("agent", call_model)
workflow.add_node("tools", call_tools)
workflow.set_entry_point("agent")
workflow.add_conditional_edges("agent", should_continue, {"tools": "tools", END: END})
workflow.add_edge("tools", "agent")

# Compile and run
app = workflow.compile()
result = app.invoke({"messages": [HumanMessage(content="What's the weather?")]})
```

**Pros:** Production-ready, persistence, streaming, debugging tools
**Cons:** Learning curve, more complex setup

---

## Option 3: CrewAI

### When to Use
- Multi-agent systems
- Role-based agents
- Team collaboration
- Quick prototyping

### Example

```python
from crewai import Agent, Task, Crew

# Define agents
researcher = Agent(
    role="Research Analyst",
    goal="Find comprehensive information on topics",
    backstory="Expert at gathering and analyzing information",
    tools=[search_tool, read_tool]
)

writer = Agent(
    role="Content Writer",
    goal="Create engaging content from research",
    backstory="Skilled at transforming research into readable content",
    tools=[write_tool]
)

# Define tasks
research_task = Task(
    description="Research the topic: {topic}",
    agent=researcher,
    expected_output="Comprehensive research findings"
)

writing_task = Task(
    description="Write a blog post based on the research",
    agent=writer,
    expected_output="A complete blog post"
)

# Create crew
crew = Crew(
    agents=[researcher, writer],
    tasks=[research_task, writing_task],
    verbose=True
)

# Run
result = crew.kickoff(inputs={"topic": "AI agents"})
```

**Pros:** Intuitive multi-agent, role-based, easy to get started
**Cons:** Less control over details, abstracts away the loop

---

## Option 4: Building Minimal Custom

### When to Use
- Need specific behavior
- Don't want framework dependencies
- Educational purposes
- Simple use cases

### Example

```python
from dataclasses import dataclass
from typing import List, Dict, Callable
import anthropic

@dataclass
class Tool:
    name: str
    description: str
    schema: Dict
    func: Callable

class SimpleAgent:
    def __init__(self, tools: List[Tool], system_prompt: str = ""):
        self.client = anthropic.Anthropic()
        self.tools = {t.name: t for t in tools}
        self.system_prompt = system_prompt

    def _get_tool_schemas(self):
        return [{
            "name": t.name,
            "description": t.description,
            "input_schema": t.schema
        } for t in self.tools.values()]

    def run(self, goal: str, max_turns: int = 10) -> str:
        messages = [{"role": "user", "content": goal}]

        for _ in range(max_turns):
            response = self.client.messages.create(
                model="claude-sonnet-4-20250514",
                max_tokens=4096,
                system=self.system_prompt,
                tools=self._get_tool_schemas(),
                messages=messages
            )

            if response.stop_reason == "end_turn":
                for block in response.content:
                    if hasattr(block, 'text'):
                        return block.text
                return "Done"

            messages.append({"role": "assistant", "content": response.content})

            tool_results = []
            for block in response.content:
                if block.type == "tool_use":
                    tool = self.tools[block.name]
                    result = tool.func(**block.input)
                    tool_results.append({
                        "type": "tool_result",
                        "tool_use_id": block.id,
                        "content": str(result)
                    })

            messages.append({"role": "user", "content": tool_results})

        return "Max turns reached"
```

**Pros:** Full control, minimal code, no dependencies
**Cons:** Missing features (persistence, streaming, etc.)

---

## Choosing a Framework

```
┌─────────────────────────────────────────────────────────────┐
│ FRAMEWORK DECISION TREE                                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Is this a simple, single-agent task?                      │
│  │                                                          │
│  ├── YES → Direct SDK or minimal custom                    │
│  │                                                          │
│  └── NO ↓                                                   │
│                                                             │
│  Do you need multiple agents working together?             │
│  │                                                          │
│  ├── YES → CrewAI or LangGraph                             │
│  │                                                          │
│  └── NO ↓                                                   │
│                                                             │
│  Do you need persistence, streaming, debugging?            │
│  │                                                          │
│  ├── YES → LangGraph                                       │
│  │                                                          │
│  └── NO ↓                                                   │
│                                                             │
│  Minimize dependencies and maximize control?               │
│  │                                                          │
│  ├── YES → Direct SDK + custom code                        │
│  │                                                          │
│  └── NO → LangGraph (most features)                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Framework Trade-offs

| Consideration | Direct SDK | LangGraph | CrewAI |
|--------------|------------|-----------|--------|
| Setup time | Minutes | Hours | Minutes |
| Control | Full | High | Medium |
| Features | Minimal | Comprehensive | Multi-agent |
| Dependencies | Minimal | Many | Medium |
| Learning curve | Low | Medium | Low |
| Community | Large | Large | Growing |
| Production-ready | DIY | Yes | Growing |

---

## Recommendation

**For learning:** Start with direct SDK to understand fundamentals.

**For production:** Consider LangGraph for serious applications.

**For multi-agent:** CrewAI is quickest to get started.

**For maximum control:** Build minimal custom.

---

## Things to Remember

1. **Start simple** : Direct SDK teaches fundamentals
2. **Match framework to need** : Don't over-engineer
3. **Consider production needs** : Persistence, monitoring, debugging
4. **Evaluate dependencies** : More framework = more complexity
5. **Try before committing** : Build a prototype with each option

---

**Next:** [03-Memory-State.md](03-Memory-State.md) - Managing conversation memory
