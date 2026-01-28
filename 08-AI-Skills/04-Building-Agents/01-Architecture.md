# Agent Architecture

## Quick Take

A well-architected agent is modular, testable, and maintainable. This chapter covers the key components and how to structure them.

**Remember:** Good architecture separates concerns. the LLM, tools, memory, and orchestration are distinct components that work together.

---

## Core Components

```
┌─────────────────────────────────────────────────────────────┐
│ AGENT ARCHITECTURE                                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                   ORCHESTRATOR                       │   │
│  │ (Main loop, coordination, stopping conditions)       │   │
│  └──────────────────────┬──────────────────────────────┘   │
│                         │                                   │
│     ┌───────────────────┼───────────────────┐              │
│     │                   │                   │              │
│     ▼                   ▼                   ▼              │
│  ┌────────┐      ┌────────────┐      ┌────────────┐       │
│  │  LLM   │      │   TOOLS    │      │   MEMORY   │       │
│  │        │      │            │      │            │       │
│  │ •Model │      │ •Registry  │      │ •Messages  │       │
│  │ •Config│      │ •Executor  │      │ •State     │       │
│  │        │      │ •Validator │      │ •Summaries │       │
│  └────────┘      └────────────┘      └────────────┘       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Component 1: The LLM Client

Handles communication with the language model.

```python
from dataclasses import dataclass
from typing import List, Dict, Any
import anthropic

@dataclass
class LLMConfig:
    model: str = "claude-sonnet-4-20250514"
    max_tokens: int = 4096
    temperature: float = 0.7

class LLMClient:
    def __init__(self, config: LLMConfig = None):
        self.config = config or LLMConfig()
        self.client = anthropic.Anthropic()

    def chat(
        self,
        messages: List[Dict],
        tools: List[Dict] = None,
        system: str = None
    ) -> Any:
        """Send messages to LLM and get response."""

        kwargs = {
            "model": self.config.model,
            "max_tokens": self.config.max_tokens,
            "messages": messages,
        }

        if system:
            kwargs["system"] = system
        if tools:
            kwargs["tools"] = tools

        return self.client.messages.create(**kwargs)
```

**Key decisions:**
- Which model to use
- Temperature and other parameters
- Retry logic for API errors
- Token budget management

---

## Component 2: Tool Registry

Manages available tools and their execution.

```python
from typing import Callable, Dict, Any
from dataclasses import dataclass

@dataclass
class Tool:
    name: str
    description: str
    parameters: Dict
    function: Callable
    requires_confirmation: bool = False

class ToolRegistry:
    def __init__(self):
        self.tools: Dict[str, Tool] = {}

    def register(self, tool: Tool):
        """Add a tool to the registry."""
        self.tools[tool.name] = tool

    def get_schemas(self) -> List[Dict]:
        """Get tool schemas for LLM."""
        return [
            {
                "name": tool.name,
                "description": tool.description,
                "input_schema": tool.parameters
            }
            for tool in self.tools.values()
        ]

    def execute(self, name: str, args: Dict) -> Any:
        """Execute a tool by name."""
        if name not in self.tools:
            return {"error": f"Unknown tool: {name}"}

        tool = self.tools[name]

        try:
            result = tool.function(**args)
            return {"success": True, "result": result}
        except Exception as e:
            return {"success": False, "error": str(e)}

# Example tool registration
registry = ToolRegistry()

registry.register(Tool(
    name="search_web",
    description="Search the web for information",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "Search query"
            }
        },
        "required": ["query"]
    },
    function=lambda query: f"Results for: {query}"
))
```

---

## Component 3: Memory Manager

Handles conversation history and state.

```python
from typing import List, Dict, Optional
from dataclasses import dataclass, field

@dataclass
class Memory:
    messages: List[Dict] = field(default_factory=list)
    state: Dict = field(default_factory=dict)
    max_messages: int = 50

    def add_user_message(self, content: str):
        self.messages.append({"role": "user", "content": content})
        self._trim_if_needed()

    def add_assistant_message(self, content):
        self.messages.append({"role": "assistant", "content": content})
        self._trim_if_needed()

    def add_tool_result(self, tool_use_id: str, result: str):
        self.messages.append({
            "role": "user",
            "content": [{
                "type": "tool_result",
                "tool_use_id": tool_use_id,
                "content": result
            }]
        })

    def get_messages(self) -> List[Dict]:
        return self.messages.copy()

    def set_state(self, key: str, value: any):
        self.state[key] = value

    def get_state(self, key: str, default=None):
        return self.state.get(key, default)

    def _trim_if_needed(self):
        """Keep memory under limit by removing old messages."""
        if len(self.messages) > self.max_messages:
            # Keep system context + recent messages
            self.messages = self.messages[-self.max_messages:]
```

---

## Component 4: The Orchestrator

The main loop that coordinates everything.

```python
from dataclasses import dataclass
from typing import Optional

@dataclass
class AgentConfig:
    max_iterations: int = 20
    system_prompt: str = "You are a helpful assistant."

class Agent:
    def __init__(
        self,
        llm: LLMClient,
        tools: ToolRegistry,
        memory: Memory,
        config: AgentConfig = None
    ):
        self.llm = llm
        self.tools = tools
        self.memory = memory
        self.config = config or AgentConfig()

    def run(self, goal: str) -> str:
        """Execute the agent loop until goal is achieved."""

        self.memory.add_user_message(goal)
        iteration = 0

        while iteration < self.config.max_iterations:
            iteration += 1

            # 1. Get LLM response
            response = self.llm.chat(
                messages=self.memory.get_messages(),
                tools=self.tools.get_schemas(),
                system=self.config.system_prompt
            )

            # 2. Check for completion
            if response.stop_reason == "end_turn":
                return self._extract_text(response)

            # 3. Handle tool calls
            if response.stop_reason == "tool_use":
                self._handle_tool_calls(response)

        return "Max iterations reached"

    def _handle_tool_calls(self, response):
        """Process tool calls from LLM response."""

        # Add assistant message
        self.memory.add_assistant_message(response.content)

        # Execute each tool
        for block in response.content:
            if block.type == "tool_use":
                result = self.tools.execute(block.name, block.input)
                self.memory.add_tool_result(
                    block.id,
                    str(result)
                )

    def _extract_text(self, response) -> str:
        """Extract text from response."""
        for block in response.content:
            if hasattr(block, 'text'):
                return block.text
        return ""
```

---

## Putting It Together

```python
# Initialize components
llm = LLMClient(LLMConfig(model="claude-sonnet-4-20250514"))
tools = ToolRegistry()
memory = Memory()

# Register tools
tools.register(Tool(
    name="search",
    description="Search for information",
    parameters={
        "type": "object",
        "properties": {
            "query": {"type": "string"}
        },
        "required": ["query"]
    },
    function=search_function
))

tools.register(Tool(
    name="read_file",
    description="Read a file's contents",
    parameters={
        "type": "object",
        "properties": {
            "path": {"type": "string"}
        },
        "required": ["path"]
    },
    function=read_file_function
))

# Create and run agent
config = AgentConfig(
    max_iterations=10,
    system_prompt="You are a research assistant. Use tools to find information."
)

agent = Agent(llm, tools, memory, config)
result = agent.run("Find information about AI agents and summarize it")
print(result)
```

---

## Architecture Patterns

### Pattern 1: Pipeline Agent

```
┌────────┐   ┌────────┐   ┌────────┐   ┌────────┐
│ Input  │ → │Research│ → │ Draft  │ → │ Review │ → Output
│        │   │ Phase  │   │ Phase  │   │ Phase  │
└────────┘   └────────┘   └────────┘   └────────┘
```

### Pattern 2: Router Agent

```
          ┌────────────┐
          │  ROUTER    │
          │  decides   │
          └─────┬──────┘
      ┌─────────┼─────────┐
      ▼         ▼         ▼
┌──────────┐┌──────────┐┌──────────┐
│ Handler A││ Handler B││ Handler C│
└──────────┘└──────────┘└──────────┘
```

### Pattern 3: Supervisor Agent

```
          ┌────────────┐
          │ SUPERVISOR │
          │ (oversees) │
          └─────┬──────┘
                │
    ┌───────────┼───────────┐
    ▼           ▼           ▼
┌────────┐ ┌────────┐ ┌────────┐
│Worker 1│ │Worker 2│ │Worker 3│
└────────┘ └────────┘ └────────┘
```

---

## Best Practices

### 1. Separation of Concerns
```
✅ Each component has one job
✅ Components can be tested independently
✅ Easy to swap implementations
```

### 2. Configuration Over Code
```
✅ Behavior controlled by config, not hardcoded
✅ Easy to adjust without code changes
✅ Different configs for different environments
```

### 3. Observability
```
✅ Log every LLM call and tool execution
✅ Track token usage and costs
✅ Measure iteration counts and latency
```

### 4. Graceful Degradation
```
✅ Handle API errors gracefully
✅ Fallback strategies when tools fail
✅ Clear error messages for debugging
```

---

## Things to Remember

1. **Four core components:** LLM, Tools, Memory, Orchestrator
2. **Separation matters:** Each component has a single responsibility
3. **The loop is central:** Think → Act → Observe → Repeat
4. **Config over code:** Make behavior adjustable
5. **Plan for failure:** Things will go wrong; handle it gracefully

---

**Next:** [02-Frameworks.md](02-Frameworks.md) - Popular agent frameworks
