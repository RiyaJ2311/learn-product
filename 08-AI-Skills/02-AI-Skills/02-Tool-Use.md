# Tool Use (Function Calling)

## Quick Take

What if AI could do more than just generate text? What if it could check the weather, search a database, send emails, or book meetings? **Tool use** (also called function calling) gives AI the ability to take actions in the real world.

**Remember:** Tool use transforms AI from a text generator into an assistant that can actually do things.

---

## What Is Tool Use?

### The Basic Concept

```
┌─────────────────────────────────────────────────────────────┐
│ WITHOUT TOOLS                                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  User: "What's the weather in Tokyo?"                       │
│                                                             │
│  AI: "I don't have access to real-time weather data.       │
│       As of my knowledge cutoff, Tokyo typically has..."    │
│                                                             │
│  Problem: AI can only use training data, not live info     │
│                                                             │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ WITH TOOLS                                                   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  User: "What's the weather in Tokyo?"                       │
│                                                             │
│  AI: [Calls get_weather(location="Tokyo")]                 │
│       → API returns: {"temp": 72, "condition": "sunny"}    │
│                                                             │
│  AI: "It's currently 72°F and sunny in Tokyo!"             │
│                                                             │
│  Solution: AI can access real-time data via tools          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## How Tool Use Works

### The Flow

```
┌─────────────────────────────────────────────────────────────┐
│ TOOL USE FLOW                                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. USER REQUEST                                            │
│     "Book a meeting with Sarah tomorrow at 2pm"            │
│                                                             │
│  2. AI DECIDES TO USE A TOOL                                │
│     AI analyzes request, determines tool is needed          │
│                                                             │
│  3. AI GENERATES TOOL CALL                                  │
│     {                                                       │
│       "tool": "schedule_meeting",                          │
│       "arguments": {                                        │
│         "attendee": "sarah@company.com",                   │
│         "date": "2024-01-16",                              │
│         "time": "14:00"                                     │
│       }                                                     │
│     }                                                       │
│                                                             │
│  4. YOUR CODE EXECUTES THE TOOL                             │
│     Your system calls the actual calendar API               │
│                                                             │
│  5. RESULT RETURNED TO AI                                   │
│     {"status": "success", "meeting_id": "abc123"}          │
│                                                             │
│  6. AI GENERATES FINAL RESPONSE                             │
│     "Done! I've scheduled a meeting with Sarah              │
│      tomorrow at 2pm. You'll receive a calendar invite."   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Key Point
**The AI doesn't actually execute the tool.** It generates a structured request, and your code executes it. This keeps you in control.

---

## Defining Tools

### Tool Definition Structure

```json
{
  "name": "get_weather",
  "description": "Get current weather for a location",
  "parameters": {
    "type": "object",
    "properties": {
      "location": {
        "type": "string",
        "description": "City name, e.g., 'San Francisco, CA'"
      },
      "units": {
        "type": "string",
        "enum": ["celsius", "fahrenheit"],
        "description": "Temperature units"
      }
    },
    "required": ["location"]
  }
}
```

### Anatomy of a Tool Definition

| Component | Purpose | Example |
|-----------|---------|---------|
| `name` | Identifier for the tool | `get_weather` |
| `description` | Helps AI know when to use it | "Get current weather" |
| `parameters` | What inputs the tool needs | location, units |
| `required` | Which parameters are mandatory | ["location"] |

---

## Writing Good Tool Descriptions

The description is crucial, it's how the AI decides whether to use the tool.

### Bad vs Good Descriptions

```
❌ BAD: "weather"
   Problem: Too vague, AI doesn't know when to use it

❌ BAD: "This function retrieves meteorological data including
        temperature, humidity, wind speed, and precipitation..."
   Problem: Too verbose, clutters AI's context

✅ GOOD: "Get current weather conditions for any city.
         Returns temperature, conditions, and humidity."
   Clear, specific, appropriately detailed
```

### Description Best Practices

1. **Say what it does, not how** : AI doesn't need implementation details
2. **Mention the input type** : "for any city", "given a user ID"
3. **Mention the output** : "Returns temperature and conditions"
4. **Note limitations** : "Only works for US addresses"

---

## Common Tool Patterns

### Pattern 1: Data Retrieval

```
┌─────────────────────────────────────────────────────────────┐
│ DATA RETRIEVAL TOOLS                                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  get_user_info(user_id) → User profile data                │
│  search_products(query) → Product listings                  │
│  get_order_status(order_id) → Order details                │
│  search_knowledge_base(query) → Documentation               │
│                                                             │
│  Use case: AI needs information to answer questions        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Pattern 2: Actions

```
┌─────────────────────────────────────────────────────────────┐
│ ACTION TOOLS                                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  send_email(to, subject, body) → Sends email               │
│  create_ticket(title, priority) → Creates support ticket   │
│  update_order(order_id, status) → Updates order            │
│  schedule_meeting(attendees, time) → Books calendar        │
│                                                             │
│  Use case: AI takes actions on behalf of user              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Pattern 3: Calculations

```
┌─────────────────────────────────────────────────────────────┐
│ CALCULATION TOOLS                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  calculate_shipping(weight, destination) → Cost            │
│  convert_currency(amount, from, to) → Converted amount     │
│  calculate_tax(income, state) → Tax owed                   │
│                                                             │
│  Use case: AI needs precise calculations                   │
│  (LLMs are bad at math, tools fix this!)                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Implementation Example

### Python with Claude

```python
import anthropic

# Define the tools
tools = [
    {
        "name": "get_order_status",
        "description": "Get the current status of a customer order by order ID",
        "input_schema": {
            "type": "object",
            "properties": {
                "order_id": {
                    "type": "string",
                    "description": "The order ID, e.g., ORD-12345"
                }
            },
            "required": ["order_id"]
        }
    },
    {
        "name": "update_shipping_address",
        "description": "Update the shipping address for an order that hasn't shipped yet",
        "input_schema": {
            "type": "object",
            "properties": {
                "order_id": {"type": "string"},
                "new_address": {"type": "string"}
            },
            "required": ["order_id", "new_address"]
        }
    }
]

# Tool execution function
def execute_tool(tool_name, tool_input):
    if tool_name == "get_order_status":
        # In reality, query your database
        return {"status": "shipped", "tracking": "1Z999AA10123"}
    elif tool_name == "update_shipping_address":
        return {"success": True, "message": "Address updated"}

# Main conversation loop
client = anthropic.Anthropic()

messages = [
    {"role": "user", "content": "Where is my order ORD-12345?"}
]

# First API call
response = client.messages.create(
    model="claude-sonnet-4-20250514",
    max_tokens=1024,
    tools=tools,
    messages=messages
)

# Check if AI wants to use a tool
if response.stop_reason == "tool_use":
    for block in response.content:
        if block.type == "tool_use":
            # Execute the tool
            result = execute_tool(block.name, block.input)

            # Send result back to AI
            messages.append({"role": "assistant", "content": response.content})
            messages.append({
                "role": "user",
                "content": [{
                    "type": "tool_result",
                    "tool_use_id": block.id,
                    "content": str(result)
                }]
            })

            # Get final response
            final_response = client.messages.create(
                model="claude-sonnet-4-20250514",
                max_tokens=1024,
                tools=tools,
                messages=messages
            )
            print(final_response.content[0].text)
```

---

## Tool Use Best Practices

### 1. Keep Tools Focused
```
❌ BAD: One giant "do_everything" tool
✅ GOOD: Specific tools for specific actions

get_user() + update_user() + delete_user()
  vs
manage_user(action, data)
```

### 2. Return Useful Information
```
❌ BAD: {"success": true}
✅ GOOD: {"success": true, "order_id": "12345", "estimated_delivery": "Jan 20"}
```

### 3. Handle Errors Gracefully
```python
def execute_tool(name, args):
    try:
        result = actually_do_the_thing(args)
        return {"success": True, "data": result}
    except NotFoundError:
        return {"success": False, "error": "Order not found"}
    except Exception as e:
        return {"success": False, "error": "Something went wrong"}
```

### 4. Implement Confirmation for Dangerous Actions
```
Tools that modify data should require confirmation:

User: "Delete my account"
AI: "I can delete your account, but this cannot be undone.
     Please confirm by typing 'DELETE MY ACCOUNT'"
User: "DELETE MY ACCOUNT"
AI: [Calls delete_account tool]
```

---

## Security Considerations

### Never Trust AI Input Blindly

```
┌─────────────────────────────────────────────────────────────┐
│ SECURITY LAYERS                                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. VALIDATION                                              │
│     Validate all tool inputs before execution               │
│     - Check data types                                      │
│     - Check allowed values                                  │
│     - Sanitize for injection                                │
│                                                             │
│  2. AUTHORIZATION                                           │
│     Check if the user has permission                        │
│     - Can this user access this order?                      │
│     - Can this user perform this action?                    │
│                                                             │
│  3. RATE LIMITING                                           │
│     Prevent abuse                                           │
│     - Limit tool calls per minute                           │
│     - Limit expensive operations                            │
│                                                             │
│  4. AUDIT LOGGING                                           │
│     Log all tool executions                                 │
│     - Who, what, when                                       │
│     - Results and errors                                    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Product Use Cases

| Use Case | Tools Needed |
|----------|--------------|
| Customer support bot | get_order, update_order, create_ticket, search_faq |
| Meeting assistant | get_calendar, schedule_meeting, send_invite |
| E-commerce helper | search_products, get_inventory, calculate_shipping |
| Internal knowledge bot | search_docs, get_policy, submit_request |
| Code assistant | search_codebase, run_tests, create_pr |

---

## Things to Remember

1. **Tools give AI superpowers** : Access to data and actions
2. **AI suggests, you execute** : Keep control of actual actions
3. **Descriptions matter** : AI decides tool use based on descriptions
4. **Security first** : Validate, authorize, and log everything
5. **Start simple** : Begin with read-only tools before actions

---

## Practice Exercise

Design tools for an AI-powered expense reporting assistant:

**User story:** "As an employee, I want to submit expenses by describing them in natural language."

**Design your tools:**
```
Tool 1: _______________________
  Parameters: ___________________
  Returns: _____________________

Tool 2: _______________________
  Parameters: ___________________
  Returns: _____________________

Tool 3: _______________________
  Parameters: ___________________
  Returns: _____________________
```

**Example answer:**
```
Tool 1: create_expense_report
  Parameters: description, amount, category, date
  Returns: report_id, status

Tool 2: get_expense_categories
  Parameters: none
  Returns: list of valid categories

Tool 3: attach_receipt
  Parameters: report_id, image_url
  Returns: success, extracted_data
```

---

**Next:** [03-Chain-of-Thought.md](03-Chain-of-Thought.md) - Making AI reason step by step
