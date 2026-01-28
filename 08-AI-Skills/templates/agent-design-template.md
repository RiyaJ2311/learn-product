# Agent Design Template

Use this template when designing a new AI agent.

---

## 1. Problem Definition

### What problem does this agent solve?
```
_________________________________________________________________
_________________________________________________________________
```

### Who is the user?
```
_________________________________________________________________
```

### What is the success criteria?
```
_________________________________________________________________
_________________________________________________________________
```

---

## 2. Approach Decision

### Can this be solved with simple rules?
- [ ] Yes → Consider rules-based approach first
- [ ] No → Continue with agent design

### Why is an agent the right solution?
```
□ Requires multi-step reasoning
□ Steps are not predetermined
□ Needs to use external tools/data
□ Requires iteration based on results
□ Natural language understanding needed
```

---

## 3. Agent Architecture

### Agent Type
- [ ] Single agent
- [ ] Multi-agent (specify roles below)
- [ ] Agent with subagents

### Agent Pattern
- [ ] ReAct (reasoning + acting)
- [ ] Plan-and-Execute
- [ ] Self-Ask (decomposition)
- [ ] Reflexion (self-improvement)
- [ ] Hybrid (describe):

```
_________________________________________________________________
```

### Autonomy Level
- [ ] Level 1: Assisted (human approves each action)
- [ ] Level 2: Supervised (human monitors)
- [ ] Level 3: Semi-autonomous (asks when stuck)
- [ ] Level 4: Fully autonomous

---

## 4. Tools Design

### Tool 1
| Field | Value |
|-------|-------|
| Name | |
| Description | |
| Parameters | |
| Returns | |
| Permission Level | Read / Write / Execute |

### Tool 2
| Field | Value |
|-------|-------|
| Name | |
| Description | |
| Parameters | |
| Returns | |
| Permission Level | Read / Write / Execute |

### Tool 3
| Field | Value |
|-------|-------|
| Name | |
| Description | |
| Parameters | |
| Returns | |
| Permission Level | Read / Write / Execute |

(Add more as needed)

---

## 5. System Prompt

```
[Role definition]


[Context]


[Behavioral rules]


[Output format]


[Special instructions]

```

---

## 6. Memory Strategy

### Conversation Memory
- [ ] Sliding window (keep last N messages)
- [ ] Summarization
- [ ] Semantic retrieval
- [ ] Hybrid

### State Management
What state needs to be tracked?
```
-
-
-
```

### Persistence
- [ ] Session only (memory cleared after)
- [ ] Persistent (survives restarts)

---

## 7. Safety & Limits

### Cost Controls
| Limit | Value |
|-------|-------|
| Max iterations | |
| Max tokens per session | |
| Daily budget | |

### Security
| Check | Implemented? |
|-------|--------------|
| Input validation | |
| Tool permissions | |
| Output filtering | |
| Prompt injection protection | |

### Confirmation Required For
```
-
-
-
```

---

## 8. Testing Plan

### Unit Tests
```
- Tool 1:
- Tool 2:
- Tool 3:
```

### Integration Tests
```
-
-
```

### Eval Cases
| Input | Expected Behavior | Max Iterations |
|-------|-------------------|----------------|
| | | |
| | | |
| | | |

---

## 9. Monitoring

### Key Metrics
```
-
-
-
```

### Alerts
| Condition | Action |
|-----------|--------|
| | |
| | |

---

## 10. Review Checklist

Before building:
- [ ] Problem clearly defined
- [ ] Agent is the right approach
- [ ] Tools are well-designed
- [ ] System prompt is clear
- [ ] Limits are set
- [ ] Security considered
- [ ] Testing planned

---

## Notes

```
Additional notes, considerations, open questions:




```
