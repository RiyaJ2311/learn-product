# System Architecture Fundamentals

## What This Is

A practical guide to designing software systems that scale, maintain, and evolve. These principles apply to monoliths, microservices, and AI agent systems.

**System architecture** is the art of making decisions about how software components interact, communicate, and evolve together.

---

## Why This Matters

Architecture decisions are expensive to change later. Understanding fundamentals helps you:

- Avoid common pitfalls
- Make informed trade-offs
- Communicate design decisions
- Scale when needed (not before)

Whether you're building:
- Monolithic applications
- Microservices
- Event-driven systems
- AI agent architectures

...the principles are the same.

---

## Module Contents

| File | Topic | What You'll Learn |
|------|-------|-------------------|
| [01-Fundamentals.md](01-Fundamentals.md) | Core Concepts | Coupling, cohesion, boundaries |
| [02-Patterns.md](02-Patterns.md) | Common Patterns | Microservices, events, CQRS |
| [03-Trade-offs.md](03-Trade-offs.md) | Decision Making | When to use what, CAP theorem |
| [04-Evolution.md](04-Evolution.md) | Growing Systems | From monolith to microservices |

---

## Key Concept

```
┌─────────────────────────────────────────────────────────────┐
│ THE ARCHITECTURE SPECTRUM                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  MONOLITH                                                   │
│  ────────                                                   │
│  One deployable unit                                        │
│  ✓ Simple to start                                          │
│  ✓ Easy to debug                                            │
│  ✗ Harder to scale independently                            │
│  ✗ Deploys are all-or-nothing                               │
│                                                             │
│  MODULAR MONOLITH                                           │
│  ────────────────                                           │
│  One deployable, clear internal boundaries                  │
│  ✓ Best of both worlds                                      │
│  ✓ Can extract services later                               │
│  Often the right choice!                                    │
│                                                             │
│  MICROSERVICES                                              │
│  ─────────────                                              │
│  Many deployable units                                      │
│  ✓ Independent scaling                                      │
│  ✓ Team autonomy                                            │
│  ✗ Distributed system complexity                            │
│  ✗ Network failures, eventual consistency                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Domain-Specific Applications

| Domain | Architecture Focus |
|--------|-------------------|
| **Web Applications** | Request/response, caching, CDN |
| **Microservices** | Service boundaries, communication |
| **AI Agents** | Orchestration, tool calling, state |

**AI-specific:** [Agent Patterns](../../08-AI-Skills/03-AI-Agents/02-Agent-Patterns.md)

---

## The Golden Rule

> "Make it work, make it right, make it fast." — Kent Beck

Start simple. Add complexity only when needed. Premature architecture is as dangerous as premature optimization.

**Start here:** [01-Fundamentals.md](01-Fundamentals.md)
