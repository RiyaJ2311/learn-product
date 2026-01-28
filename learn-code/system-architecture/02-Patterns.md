# Architecture Patterns

## Overview

Patterns are proven solutions to recurring problems. Know when to use each.

---

## Monolith

### What It Is

All code in one deployable unit.

```
┌─────────────────────────────────────────────────────────────┐
│                        MONOLITH                              │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐               │
│  │   Users   │  │  Orders   │  │ Payments  │               │
│  └───────────┘  └───────────┘  └───────────┘               │
│  ┌─────────────────────────────────────────────────┐       │
│  │              Shared Database                     │       │
│  └─────────────────────────────────────────────────┘       │
└─────────────────────────────────────────────────────────────┘
```

### When to Use

- Starting a new project
- Small team (< 10 engineers)
- Simple domain
- Rapid iteration needed

### Pros/Cons

| Pros | Cons |
|------|------|
| Simple to develop | Hard to scale pieces independently |
| Easy to deploy | Long build times (eventually) |
| Easy to debug | Risky deployments (all or nothing) |
| No network calls | Tech stack lock-in |

---

## Modular Monolith

### What It Is

One deployable, but with clear internal boundaries.

```
┌─────────────────────────────────────────────────────────────┐
│                    MODULAR MONOLITH                          │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │   Users     │  │   Orders    │  │  Payments   │         │
│  │  Module     │  │   Module    │  │   Module    │         │
│  │ ─────────── │  │ ─────────── │  │ ─────────── │         │
│  │ Public API  │  │ Public API  │  │ Public API  │         │
│  │ Private DB  │  │ Private DB  │  │ Private DB  │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
│                                                             │
│       Modules communicate through defined interfaces        │
└─────────────────────────────────────────────────────────────┘
```

### When to Use

- Medium complexity
- Want microservice benefits without complexity
- Planning to extract services later
- **Often the right choice**

### Key Rules

1. Modules have public interfaces
2. No direct database access across modules
3. Clear ownership boundaries
4. Can extract to service later

---

## Microservices

### What It Is

Many small, independent services communicating over network.

```
┌───────────┐     ┌───────────┐     ┌───────────┐
│   User    │     │   Order   │     │  Payment  │
│  Service  │────→│  Service  │────→│  Service  │
│    DB     │     │    DB     │     │    DB     │
└───────────┘     └───────────┘     └───────────┘
```

### When to Use

- Large organization (50+ engineers)
- Need independent deployment
- Different scaling requirements
- Polyglot tech stack needed

### Pros/Cons

| Pros | Cons |
|------|------|
| Independent deployment | Distributed system complexity |
| Team autonomy | Network failures |
| Scale independently | Eventual consistency |
| Technology freedom | Operational overhead |

### The Distributed Monolith Anti-Pattern

```
BAD: Microservices that must deploy together
     = All the complexity, none of the benefits
```

---

## Event-Driven Architecture

### What It Is

Components communicate through events, not direct calls.

```
┌───────────┐   publishes   ┌───────────┐   subscribes   ┌───────────┐
│  Orders   │ ────────────→ │   Event   │ ←──────────── │ Inventory │
│  Service  │  OrderPlaced  │   Bus     │               │  Service  │
└───────────┘               └───────────┘               └───────────┘
                                 ↑
                            subscribes
                                 │
                            ┌───────────┐
                            │  Email    │
                            │  Service  │
                            └───────────┘
```

### When to Use

- Loose coupling needed
- Multiple consumers of same event
- Async processing acceptable
- Audit trail required

### Event Types

| Type | Description | Example |
|------|-------------|---------|
| **Domain Event** | Something happened | `OrderPlaced`, `UserCreated` |
| **Command** | Request to do something | `ProcessPayment`, `SendEmail` |
| **Query** | Request for data | `GetUserOrders` |

---

## CQRS (Command Query Responsibility Segregation)

### What It Is

Separate models for reading and writing data.

```
┌─────────────────────────────────────────────────────────────┐
│ CQRS PATTERN                                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  WRITES (Commands)           READS (Queries)               │
│  ─────────────────           ───────────────               │
│  ┌───────────┐               ┌───────────┐                 │
│  │  Command  │               │   Query   │                 │
│  │  Handler  │               │  Handler  │                 │
│  └─────┬─────┘               └─────┬─────┘                 │
│        ↓                           ↓                        │
│  ┌───────────┐               ┌───────────┐                 │
│  │   Write   │ ──events──→   │   Read    │                 │
│  │   Model   │               │   Model   │                 │
│  └───────────┘               └───────────┘                 │
│                                                             │
│  Optimized for           Optimized for                     │
│  consistency             query performance                  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### When to Use

- Read/write patterns differ significantly
- Complex queries slow down writes
- Need different scaling for reads vs writes
- Event sourcing in use

### Caution

CQRS adds complexity. Only use when the benefits outweigh costs.

---

## API Gateway

### What It Is

Single entry point for all client requests.

```
┌─────────┐     ┌─────────────┐     ┌───────────┐
│ Mobile  │────→│             │────→│  User     │
│  App    │     │     API     │     │  Service  │
└─────────┘     │   Gateway   │     └───────────┘
                │             │     ┌───────────┐
┌─────────┐     │  - Auth     │────→│  Order    │
│   Web   │────→│  - Routing  │     │  Service  │
│   App   │     │  - Rate     │     └───────────┘
└─────────┘     │    Limit    │     ┌───────────┐
                │             │────→│  Search   │
                └─────────────┘     │  Service  │
                                    └───────────┘
```

### Responsibilities

- Authentication/authorization
- Rate limiting
- Request routing
- Response caching
- Request/response transformation
- Monitoring and logging

---

## Saga Pattern

### What It Is

Manage transactions across multiple services.

```
┌─────────────────────────────────────────────────────────────┐
│ SAGA: Order Processing                                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. Create Order → 2. Reserve Inventory → 3. Process Payment│
│        ↓                    ↓                     ↓         │
│    (success)            (success)             (success)    │
│        ↓                    ↓                     ↓         │
│  Order Created      Inventory Reserved      Payment Done    │
│                                                             │
│  IF FAILURE:                                                │
│  3. Payment fails → Compensate: Release inventory,         │
│                     Cancel order                            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### When to Use

- Distributed transactions needed
- No 2-phase commit available
- Long-running processes
- Need to maintain consistency across services

---

## Patterns for AI Agents

These patterns apply to agent architecture:

```
┌─────────────────────────────────────────────────────────────┐
│ AGENT ARCHITECTURE PATTERNS                                  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ORCHESTRATION (like API Gateway)                           │
│  ────────────────────────────────                           │
│  Agent orchestrates tool calls sequentially                 │
│  Agent decides next step based on results                   │
│                                                             │
│  EVENT-DRIVEN                                               │
│  ────────────                                               │
│  Tool completion triggers next action                       │
│  Async tool execution with callbacks                        │
│                                                             │
│  SAGA-LIKE                                                  │
│  ─────────                                                  │
│  Multi-step tasks with rollback                             │
│  "If booking fails, cancel the hotel reservation"          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**See:** [Agent Patterns](../../08-AI-Skills/03-AI-Agents/02-Agent-Patterns.md)

---

## Pattern Selection Guide

```
┌─────────────────────────────────────────────────────────────┐
│ WHICH PATTERN?                                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  "We're starting a new project"                            │
│     → Modular Monolith                                     │
│                                                             │
│  "We have 100 engineers, need team autonomy"               │
│     → Microservices                                        │
│                                                             │
│  "Changes in A shouldn't require changes in B"             │
│     → Event-Driven                                         │
│                                                             │
│  "Reads are 100x more frequent than writes"                │
│     → CQRS                                                 │
│                                                             │
│  "We need to coordinate multiple services"                 │
│     → Saga                                                 │
│                                                             │
│  "Clients need one endpoint"                               │
│     → API Gateway                                          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Next Steps

- **Trade-offs:** [03-Trade-offs.md](03-Trade-offs.md)
- **Evolution:** [04-Evolution.md](04-Evolution.md)
- **Fundamentals:** [01-Fundamentals.md](01-Fundamentals.md)

---

*Patterns are tools, not rules. Use the right tool for the job.*
