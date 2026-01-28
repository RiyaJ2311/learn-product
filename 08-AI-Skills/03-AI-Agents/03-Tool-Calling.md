# Tool Calling for Agents (Deep Dive)

## Quick Take

You learned tool basics in Module 2. For agents, tool design becomes critical, tools are what give agents their power to interact with the real world. This chapter covers advanced tool design specifically for agent systems.

**Remember:** Agent tool design is different from simple tool use. Agents need tools that support exploration, recovery, and chained operations.

---

## Agent Tool Requirements

### What's Different for Agents?

```
┌─────────────────────────────────────────────────────────────┐
│ SIMPLE TOOL USE vs AGENT TOOL USE                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  SIMPLE (Single call):                                    │
│  User: "What's the weather?"                               │
│  AI: [calls get_weather] → "It's sunny"                    │
│  Done.                                                      │
│                                                             │
│  AGENT (Multiple calls, decisions):                       │
│  Agent: "I need to explore the codebase"                   │
│  [calls list_files] → sees 500 files                       │
│  [calls search_code("error handling")] → finds 20 matches  │
│  [calls read_file("handlers/errors.py")] → reads content   │
│  [calls read_file("tests/test_errors.py")] → reads tests   │
│  [calls run_tests("test_errors.py")] → tests fail          │
│  [calls edit_file("handlers/errors.py", changes)] → fixes  │
│  [calls run_tests("test_errors.py")] → tests pass          │
│  Done.                                                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Tool Categories for Agents

### 1. Exploration Tools
Help agents understand their environment.

```
┌─────────────────────────────────────────────────────────────┐
│ EXPLORATION TOOLS                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  list_files(directory, pattern)                            │
│  └── "What files exist?"                                   │
│                                                             │
│  search_code(query, file_types)                            │
│  └── "Where is this mentioned?"                            │
│                                                             │
│  read_file(path, line_range)                               │
│  └── "What does this contain?"                             │
│                                                             │
│  get_structure(directory)                                  │
│  └── "How is this organized?"                              │
│                                                             │
│  search_web(query)                                         │
│  └── "What information exists about X?"                    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 2. Action Tools
Let agents make changes.

```
┌─────────────────────────────────────────────────────────────┐
│ ACTION TOOLS                                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  write_file(path, content)                                 │
│  └── Create or replace a file                              │
│                                                             │
│  edit_file(path, changes)                                  │
│  └── Make specific modifications                           │
│                                                             │
│  run_command(command)                                      │
│  └── Execute shell commands                                │
│                                                             │
│  send_message(to, content)                                 │
│  └── Communicate externally                                │
│                                                             │
│  create_record(type, data)                                 │
│  └── Add to database/system                                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 3. Verification Tools
Let agents check their work.

```
┌─────────────────────────────────────────────────────────────┐
│ VERIFICATION TOOLS                                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  run_tests(test_path)                                      │
│  └── "Did my changes work?"                                │
│                                                             │
│  check_syntax(file_path)                                   │
│  └── "Is this valid code?"                                 │
│                                                             │
│  validate_schema(data, schema)                             │
│  └── "Is this data correct?"                               │
│                                                             │
│  compare_files(path1, path2)                               │
│  └── "What changed?"                                       │
│                                                             │
│  get_status(resource_id)                                   │
│  └── "What's the current state?"                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Designing Agent-Friendly Tools

### Principle 1: Return Rich Context

```
❌ BAD: Returns minimal info
search_code("handleError")
→ Returns: ["file1.py:15", "file2.py:23"]

✅ GOOD: Returns actionable context
search_code("handleError")
→ Returns: [
    {
      "file": "file1.py",
      "line": 15,
      "context": "def handleError(e):\n    logging...",
      "match_type": "function_definition"
    },
    {
      "file": "file2.py",
      "line": 23,
      "context": "    handleError(exception)",
      "match_type": "function_call"
    }
  ]

Agent doesn't need another call to understand the matches.
```

### Principle 2: Support Incremental Operations

```
❌ BAD: All-or-nothing
read_file(path)
→ Returns entire 10,000 line file

✅ GOOD: Supports incremental access
read_file(path, start_line=100, end_line=200)
→ Returns just the relevant section

Agent can explore large files efficiently.
```

### Principle 3: Include Helpful Metadata

```
❌ BAD: Just the data
get_order(order_id)
→ Returns: {items: [...], total: 50.00}

✅ GOOD: Data + useful metadata
get_order(order_id)
→ Returns: {
    items: [...],
    total: 50.00,
    _meta: {
      status: "shipped",
      can_modify: false,
      can_refund: true,
      related_actions: ["get_tracking", "request_refund"]
    }
  }

Agent knows what actions are possible.
```

### Principle 4: Graceful Error Information

```
❌ BAD: Opaque errors
update_user(user_id, data)
→ Error: "Operation failed"

✅ GOOD: Actionable error context
update_user(user_id, data)
→ Error: {
    "code": "VALIDATION_FAILED",
    "message": "Email format invalid",
    "field": "email",
    "provided": "not-an-email",
    "expected": "valid email format",
    "suggestion": "Use format: user@domain.com"
  }

Agent can understand and fix the issue.
```

---

## Tool Permission Levels

For safety, implement permission levels:

```
┌─────────────────────────────────────────────────────────────┐
│ PERMISSION LEVELS                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  LEVEL 1: READ-ONLY                                         │
│  └── search, read, list, get                               │
│  └── No confirmation needed                                 │
│                                                             │
│  LEVEL 2: LOW-IMPACT WRITE                                  │
│  └── create draft, log, add comment                        │
│  └── Minimal confirmation or auto-approved                  │
│                                                             │
│  LEVEL 3: STANDARD WRITE                                    │
│  └── edit file, send message, create record                │
│  └── May require confirmation                               │
│                                                             │
│  LEVEL 4: HIGH-IMPACT                                       │
│  └── delete, financial transactions, publish               │
│  └── Always require explicit confirmation                   │
│                                                             │
│  LEVEL 5: IRREVERSIBLE                                      │
│  └── delete account, production deploy                     │
│  └── Require multi-step confirmation                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Implementation

```python
def execute_tool(tool_name, args, permission_level):
    tool = tools[tool_name]

    if tool.level >= LEVEL_4_HIGH_IMPACT:
        # Require explicit user confirmation
        confirmed = await ask_user_confirmation(
            f"Agent wants to: {tool_name}({args})"
        )
        if not confirmed:
            return {"status": "blocked", "reason": "User declined"}

    return tool.execute(args)
```

---

## Tool Composition Patterns

### Pattern 1: Search → Read → Act

```
┌─────────────────────────────────────────────────────────────┐
│ SEARCH → READ → ACT                                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. SEARCH: Find relevant items                             │
│     search_files("*.py") → ["a.py", "b.py", "c.py"]        │
│                                                             │
│  2. READ: Understand content                                │
│     read_file("a.py") → content                            │
│                                                             │
│  3. ACT: Make changes                                       │
│     edit_file("a.py", changes)                             │
│                                                             │
│  4. VERIFY: Check result                                    │
│     run_tests() → pass/fail                                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Pattern 2: Gather → Analyze → Report

```
┌─────────────────────────────────────────────────────────────┐
│ GATHER → ANALYZE → REPORT                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. GATHER: Collect data from multiple sources             │
│     get_metrics("revenue") → data1                         │
│     get_metrics("users") → data2                           │
│     get_competitors() → data3                               │
│                                                             │
│  2. ANALYZE: Process and interpret                         │
│     [LLM analyzes the combined data]                       │
│                                                             │
│  3. REPORT: Generate output                                │
│     create_document(analysis_result)                       │
│     send_notification(summary)                              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Pattern 3: Try → Check → Retry

```
┌─────────────────────────────────────────────────────────────┐
│ TRY → CHECK → RETRY (Reflexion)                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ATTEMPT 1:                                               │
│  write_code(solution1) → run_tests() → FAIL                │
│                                                             │
│  REFLECT:                                                 │
│  "Tests failed because of edge case X"                     │
│                                                             │
│  ATTEMPT 2:                                               │
│  write_code(solution2) → run_tests() → PASS                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Real-World Tool Set Example

### For a Coding Agent

```json
{
  "tools": [
    {
      "name": "list_directory",
      "description": "List files and folders in a directory",
      "level": "READ"
    },
    {
      "name": "search_code",
      "description": "Search for patterns in codebase. Returns matching lines with context.",
      "level": "READ"
    },
    {
      "name": "read_file",
      "description": "Read contents of a file. Can specify line range for large files.",
      "level": "READ"
    },
    {
      "name": "write_file",
      "description": "Create or overwrite a file with new content",
      "level": "WRITE"
    },
    {
      "name": "edit_file",
      "description": "Make specific edits to a file (search and replace)",
      "level": "WRITE"
    },
    {
      "name": "run_command",
      "description": "Execute a shell command. Returns stdout and stderr.",
      "level": "EXECUTE"
    },
    {
      "name": "run_tests",
      "description": "Run test suite. Returns pass/fail status and output.",
      "level": "EXECUTE"
    }
  ]
}
```

---

## Common Mistakes

### Mistake 1: Too Many Granular Tools

```
❌ BAD: 50 specific tools
get_user_name(), get_user_email(), get_user_address()...

✅ GOOD: Flexible tools with parameters
get_user(fields=["name", "email", "address"])
```

### Mistake 2: Not Enough Context in Results

```
❌ BAD: Agent needs multiple calls
file_exists("config.py") → true
read_file("config.py") → content

✅ GOOD: Combined when useful
find_and_read("config.py") → {exists: true, content: "..."}
```

### Mistake 3: No Recovery Path

```
❌ BAD: Tool fails, agent stuck
delete_user(id) → Error: "User has active subscription"

✅ GOOD: Error includes recovery options
delete_user(id) → Error: {
  message: "User has active subscription",
  recovery_options: [
    "cancel_subscription(user_id) first",
    "use force_delete(user_id) to delete anyway"
  ]
}
```

---

## Things to Remember

1. **Agent tools need rich context** : Return enough for the agent to decide next steps
2. **Support incremental operations** : Don't force all-or-nothing
3. **Include metadata** : What actions are possible from here?
4. **Graceful errors** : Tell agent what went wrong and how to fix it
5. **Permission levels** : Protect against unintended actions
6. **Design for composition** : Tools should work together

---

**Next:** [04-Multi-Agent-Systems.md](04-Multi-Agent-Systems.md) - Multiple agents working together
