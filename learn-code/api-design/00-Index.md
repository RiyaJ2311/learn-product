# API Design Fundamentals

## What This Is

A practical guide to designing APIs that developers love to use. These principles apply to REST APIs, GraphQL, gRPC, and AI tool interfaces.

**API design** is the art of creating interfaces that are intuitive, consistent, and reliable.

---

## Why This Matters

Bad APIs create friction. Every confusing endpoint, inconsistent naming, or missing error message costs developer time and creates bugs.

Whether you're building:
- REST APIs for web/mobile apps
- GraphQL interfaces for flexible queries
- gRPC services for microservices
- Tool schemas for AI agents

...the principles are the same.

---

## Module Contents

| File | Topic | What You'll Learn |
|------|-------|-------------------|
| [01-Fundamentals.md](01-Fundamentals.md) | Core Concepts | REST principles, naming, versioning |
| [02-Error-Handling.md](02-Error-Handling.md) | Errors | Status codes, error formats, messages |
| [03-Authentication.md](03-Authentication.md) | Security | Auth patterns, tokens, API keys |
| [04-Documentation.md](04-Documentation.md) | Documentation | OpenAPI, examples, developer experience |

---

## Key Concept

```
┌─────────────────────────────────────────────────────────────┐
│ GOOD API vs BAD API                                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  BAD API                                                    │
│  ───────                                                    │
│  GET /getUser?id=123                                        │
│  POST /createNewUser                                        │
│  DELETE /deleteUserFromSystem/123                           │
│                                                             │
│  ✗ Inconsistent naming (get vs create vs delete)            │
│  ✗ Verbs in URLs (already have HTTP methods)                │
│  ✗ Unclear resource structure                               │
│                                                             │
│  GOOD API                                                   │
│  ────────                                                   │
│  GET    /users/123                                          │
│  POST   /users                                              │
│  DELETE /users/123                                          │
│                                                             │
│  ✓ Consistent resource naming                               │
│  ✓ HTTP methods indicate action                             │
│  ✓ Predictable structure                                    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Domain-Specific Applications

| Domain | Special Considerations |
|--------|----------------------|
| **Web/Mobile Apps** | Pagination, filtering, rate limiting |
| **Microservices** | Service discovery, circuit breakers |
| **AI Tool Calling** | Clear descriptions, constrained inputs |

**AI-specific:** [Tool Calling Guide](../../08-AI-Skills/03-AI-Agents/03-Tool-Calling.md)

---

## The Bottom Line

API design is communication design. You're designing a conversation between systems. Make it clear, consistent, and hard to misuse.

**Start here:** [01-Fundamentals.md](01-Fundamentals.md)
