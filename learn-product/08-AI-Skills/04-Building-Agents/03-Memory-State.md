# Memory & State Management

## 2-Minute Overview

Agents need to remember what happened—previous messages, tool results, decisions made, and facts learned. **Memory management** is how you handle the limited context window while maintaining coherent long-running conversations.

**The key insight:** Context windows are finite. Smart memory management lets agents work on complex tasks without losing important information.

---

## The Memory Problem

```
┌─────────────────────────────────────────────────────────────┐
│ THE CONTEXT WINDOW CHALLENGE                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Agent starts task...                                       │
│                                                             │
│  Turn 1: User goal (200 tokens)                            │
│  Turn 2: Tool call + result (500 tokens)                   │
│  Turn 3: Reasoning + tool call (800 tokens)                │
│  Turn 4: Large file read (5,000 tokens)                    │
│  Turn 5: Another tool call (600 tokens)                    │
│  ...                                                        │
│  Turn 20: Context is now 50,000+ tokens                    │
│                                                             │
│  PROBLEMS:                                                  │
│  • Context window fills up                                  │
│  • Cost increases with every turn                          │
│  • Important early info gets pushed out                    │
│  • Performance may degrade with very long context          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Types of Agent Memory

### 1. Conversation Memory
The message history—what was said and done.

```python
class ConversationMemory:
    def __init__(self, max_messages: int = 50):
        self.messages = []
        self.max_messages = max_messages

    def add(self, role: str, content):
        self.messages.append({"role": role, "content": content})

    def get_recent(self, n: int = None) -> list:
        n = n or self.max_messages
        return self.messages[-n:]

    def clear(self):
        self.messages = []
```

### 2. Working Memory
Short-term state for the current task.

```python
class WorkingMemory:
    def __init__(self):
        self.current_goal = None
        self.plan = []
        self.current_step = 0
        self.intermediate_results = {}

    def set_goal(self, goal: str):
        self.current_goal = goal

    def set_plan(self, steps: list):
        self.plan = steps
        self.current_step = 0

    def store_result(self, key: str, value):
        self.intermediate_results[key] = value

    def get_context(self) -> str:
        return f"""
        Current Goal: {self.current_goal}
        Plan: {self.plan}
        Progress: Step {self.current_step + 1} of {len(self.plan)}
        Results so far: {self.intermediate_results}
        """
```

### 3. Long-Term Memory
Persistent knowledge across sessions.

```python
class LongTermMemory:
    def __init__(self, db_path: str):
        self.db = Database(db_path)

    def store_fact(self, key: str, value: str, metadata: dict = None):
        self.db.upsert({
            "key": key,
            "value": value,
            "metadata": metadata,
            "timestamp": datetime.now()
        })

    def recall(self, query: str, limit: int = 5) -> list:
        # Use semantic search or keyword match
        return self.db.search(query, limit=limit)

    def forget(self, key: str):
        self.db.delete(key)
```

---

## Memory Strategies

### Strategy 1: Sliding Window

Keep only the N most recent messages.

```
┌─────────────────────────────────────────────────────────────┐
│ SLIDING WINDOW                                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Before (too long):                                         │
│  [Msg1][Msg2][Msg3][Msg4][Msg5][Msg6][Msg7][Msg8][Msg9]    │
│                                                             │
│  After (window of 5):                                       │
│  [Msg5][Msg6][Msg7][Msg8][Msg9]                            │
│                                                             │
│  ✓ Simple                                                   │
│  ✗ Loses early important context                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

```python
def apply_sliding_window(messages: list, window_size: int) -> list:
    if len(messages) <= window_size:
        return messages
    return messages[-window_size:]
```

### Strategy 2: Summarization

Periodically summarize old messages.

```
┌─────────────────────────────────────────────────────────────┐
│ SUMMARIZATION                                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Before:                                                    │
│  [Msg1][Msg2][Msg3][Msg4][Msg5][Msg6][Msg7][Msg8]         │
│                                                             │
│  After:                                                     │
│  [Summary of Msg1-5][Msg6][Msg7][Msg8]                     │
│                                                             │
│  ✓ Preserves key information                               │
│  ✗ Costs extra tokens to summarize                         │
│  ✗ May lose nuance                                          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

```python
def summarize_messages(messages: list, llm) -> str:
    content = "\n".join([
        f"{m['role']}: {m['content']}"
        for m in messages
    ])

    summary = llm.chat([{
        "role": "user",
        "content": f"Summarize this conversation concisely:\n\n{content}"
    }])

    return summary

def apply_summarization(messages: list, llm, threshold: int = 20) -> list:
    if len(messages) <= threshold:
        return messages

    # Keep recent, summarize old
    old_messages = messages[:-10]
    recent_messages = messages[-10:]

    summary = summarize_messages(old_messages, llm)

    return [
        {"role": "system", "content": f"Previous context: {summary}"},
        *recent_messages
    ]
```

### Strategy 3: Semantic Retrieval

Store everything, retrieve only what's relevant.

```
┌─────────────────────────────────────────────────────────────┐
│ SEMANTIC RETRIEVAL                                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  All messages stored in vector database                     │
│                                                             │
│  When agent needs context:                                  │
│  1. Take current message/question                          │
│  2. Search for similar past messages                       │
│  3. Include top-K relevant messages                        │
│                                                             │
│  ✓ Scales to very long histories                           │
│  ✓ Retrieves contextually relevant info                    │
│  ✗ More complex infrastructure                             │
│  ✗ May miss important sequential context                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

```python
from sentence_transformers import SentenceTransformer
import numpy as np

class SemanticMemory:
    def __init__(self):
        self.encoder = SentenceTransformer('all-MiniLM-L6-v2')
        self.messages = []
        self.embeddings = []

    def add(self, message: dict):
        self.messages.append(message)
        content = str(message.get('content', ''))
        embedding = self.encoder.encode(content)
        self.embeddings.append(embedding)

    def retrieve(self, query: str, top_k: int = 5) -> list:
        query_embedding = self.encoder.encode(query)

        # Calculate similarities
        similarities = [
            np.dot(query_embedding, emb) /
            (np.linalg.norm(query_embedding) * np.linalg.norm(emb))
            for emb in self.embeddings
        ]

        # Get top-k indices
        top_indices = np.argsort(similarities)[-top_k:][::-1]

        return [self.messages[i] for i in top_indices]
```

---

## Hybrid Memory System

Combine strategies for best results:

```python
class HybridMemory:
    def __init__(self, llm):
        self.llm = llm

        # Different memory types
        self.conversation = []  # Full conversation
        self.summary = ""       # Summarized history
        self.working = {}       # Current task state
        self.semantic = SemanticMemory()  # For retrieval

        # Thresholds
        self.summary_threshold = 20
        self.window_size = 10

    def add_message(self, role: str, content):
        message = {"role": role, "content": content}
        self.conversation.append(message)
        self.semantic.add(message)

        # Check if we need to summarize
        if len(self.conversation) > self.summary_threshold:
            self._update_summary()

    def _update_summary(self):
        # Summarize older messages
        old = self.conversation[:-self.window_size]
        self.summary = summarize_messages(old, self.llm)
        self.conversation = self.conversation[-self.window_size:]

    def get_context(self, current_query: str) -> list:
        """Get relevant context for current query."""

        context = []

        # Add summary if exists
        if self.summary:
            context.append({
                "role": "system",
                "content": f"Previous context summary: {self.summary}"
            })

        # Add semantically relevant past messages
        relevant = self.semantic.retrieve(current_query, top_k=3)
        for msg in relevant:
            if msg not in self.conversation[-self.window_size:]:
                context.append({
                    "role": "system",
                    "content": f"Relevant past context: {msg['content']}"
                })

        # Add recent conversation
        context.extend(self.conversation)

        return context
```

---

## State Management

Beyond messages, agents need to track state:

```python
from enum import Enum
from dataclasses import dataclass, field
from typing import Dict, List, Any

class AgentStatus(Enum):
    IDLE = "idle"
    PLANNING = "planning"
    EXECUTING = "executing"
    WAITING = "waiting_for_user"
    COMPLETED = "completed"
    FAILED = "failed"

@dataclass
class AgentState:
    status: AgentStatus = AgentStatus.IDLE
    current_goal: str = ""
    plan: List[str] = field(default_factory=list)
    current_step: int = 0
    results: Dict[str, Any] = field(default_factory=dict)
    errors: List[str] = field(default_factory=list)
    iteration_count: int = 0

    def to_context_string(self) -> str:
        return f"""
Current Status: {self.status.value}
Goal: {self.current_goal}
Plan: {self.plan}
Progress: Step {self.current_step + 1} of {len(self.plan)}
Iterations: {self.iteration_count}
Results: {self.results}
Errors: {self.errors}
"""

    def advance_step(self):
        self.current_step += 1
        if self.current_step >= len(self.plan):
            self.status = AgentStatus.COMPLETED

    def record_error(self, error: str):
        self.errors.append(error)

    def record_result(self, step: str, result: Any):
        self.results[step] = result
```

---

## Persistence

For long-running agents, persist state:

```python
import json
from pathlib import Path

class PersistentMemory:
    def __init__(self, session_id: str, storage_path: str = "./agent_memory"):
        self.session_id = session_id
        self.storage_path = Path(storage_path)
        self.storage_path.mkdir(exist_ok=True)
        self.file_path = self.storage_path / f"{session_id}.json"

        # Load existing or create new
        if self.file_path.exists():
            self.data = json.loads(self.file_path.read_text())
        else:
            self.data = {
                "messages": [],
                "state": {},
                "created_at": datetime.now().isoformat()
            }

    def save(self):
        self.file_path.write_text(json.dumps(self.data, indent=2))

    def add_message(self, role: str, content):
        self.data["messages"].append({
            "role": role,
            "content": content,
            "timestamp": datetime.now().isoformat()
        })
        self.save()

    def get_messages(self) -> list:
        return self.data["messages"]

    def set_state(self, key: str, value):
        self.data["state"][key] = value
        self.save()

    def get_state(self, key: str, default=None):
        return self.data["state"].get(key, default)
```

---

## Best Practices

### 1. Start with Sliding Window
Simple and often sufficient.

### 2. Add Summarization for Long Tasks
When context fills up, summarize don't truncate.

### 3. Separate Working Memory from History
Current task state shouldn't fill the context.

### 4. Persist for Reliability
Agents can crash; state should survive.

### 5. Monitor Context Usage
Track token counts to predict issues.

---

## Key Takeaways

1. **Memory is finite** — Plan for context limits
2. **Multiple strategies** — Sliding window, summarization, retrieval
3. **Hybrid works best** — Combine approaches
4. **State ≠ Messages** — Track task state separately
5. **Persist important state** — Survive crashes and restarts

---

**Next:** [04-Production-Ready.md](04-Production-Ready.md) — Making agents production-ready
