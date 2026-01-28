# System Architecture Fundamentals

## Core Concepts

Architecture is about managing complexity through structure. These concepts apply everywhere.

---

## Coupling and Cohesion

### Coupling: How Connected Are Things?

**Tight coupling:** Changes in A require changes in B.

```
BAD (Tight Coupling):
┌─────────────┐      ┌─────────────┐
│  Service A  │─────→│  Service B  │
│  knows B's  │      │  internal   │
│  internals  │      │  details    │
└─────────────┘      └─────────────┘
```

**Loose coupling:** A and B can change independently.

```
GOOD (Loose Coupling):
┌─────────────┐      ┌─────────────┐
│  Service A  │─────→│  Service B  │
│  uses B's   │      │  public     │
│  interface  │      │  contract   │
└─────────────┘      └─────────────┘
```

### Cohesion: Do Related Things Live Together?

**Low cohesion:** Related code scattered everywhere.

```
BAD:
UserController → validates user, sends email, logs audit
OrderController → also validates user, also sends email
```

**High cohesion:** Related code lives together.

```
GOOD:
UserService → all user logic
EmailService → all email logic
AuditService → all audit logic
```

### The Goal

**Low coupling + high cohesion = maintainable systems**

---

## Boundaries and Interfaces

### What's a Boundary?

A boundary separates one part of the system from another. Good boundaries:

- Hide implementation details
- Define clear contracts
- Allow independent change
- Enable testing in isolation

### Types of Boundaries

```
┌─────────────────────────────────────────────────────────────┐
│ BOUNDARY TYPES                                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  FUNCTION/CLASS BOUNDARY                                    │
│  ────────────────────────                                   │
│  Smallest boundary                                          │
│  Example: private methods, encapsulation                    │
│                                                             │
│  MODULE/PACKAGE BOUNDARY                                    │
│  ────────────────────────                                   │
│  Group related code                                         │
│  Example: /users, /orders, /payments packages              │
│                                                             │
│  SERVICE BOUNDARY                                           │
│  ────────────────                                           │
│  Separate deployable unit                                   │
│  Example: User Service, Order Service                       │
│                                                             │
│  NETWORK BOUNDARY                                           │
│  ────────────────                                           │
│  Separate machines/processes                                │
│  Example: API ↔ Database, Service ↔ Service                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Interface Design

Good interfaces are:
- **Minimal** - Expose only what's needed
- **Stable** - Don't change often
- **Documented** - Clear contract
- **Versioned** - Plan for evolution

---

## Layers and Separation of Concerns

### Classic Three-Tier

```
┌─────────────────────────────────────────┐
│           PRESENTATION LAYER            │
│         (UI, API endpoints)             │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│            BUSINESS LAYER               │
│         (Logic, rules, flows)           │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│              DATA LAYER                 │
│         (Database, storage)             │
└─────────────────────────────────────────┘
```

### Why Layers Help

- **Testability** - Mock lower layers
- **Replaceability** - Swap implementations
- **Clarity** - Know where code belongs
- **Team boundaries** - Different skills per layer

### Layer Rules

1. Higher layers depend on lower layers
2. Lower layers don't know about higher layers
3. Skip layers only with good reason
4. Each layer has clear responsibility

---

## State Management

### Stateless vs Stateful

**Stateless:**
- Each request is independent
- Easier to scale (add more instances)
- No session affinity needed

**Stateful:**
- Server remembers previous interactions
- Harder to scale
- Needs session management

### State Location

```
┌─────────────────────────────────────────────────────────────┐
│ WHERE TO PUT STATE                                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  CLIENT STATE                                               │
│  ────────────                                               │
│  Browser localStorage, mobile app storage                   │
│  ✓ Scales infinitely (no server cost)                       │
│  ✗ Can be lost, tampered with                               │
│                                                             │
│  SESSION STATE                                              │
│  ─────────────                                              │
│  Server memory, Redis, database                             │
│  ✓ Secure, controlled                                       │
│  ✗ Costs money, scaling concerns                            │
│                                                             │
│  DATABASE STATE                                             │
│  ──────────────                                             │
│  Persistent storage                                         │
│  ✓ Durable, queryable                                       │
│  ✗ Slowest, most expensive                                  │
│                                                             │
│  CACHE STATE                                                │
│  ───────────                                                │
│  Redis, Memcached, CDN                                      │
│  ✓ Fast reads                                               │
│  ✗ Invalidation complexity                                  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Synchronous vs Asynchronous

### Synchronous

Request → Wait → Response

```
User → API → Database → API → User
         (blocking)
```

**Good for:** Simple CRUD, low latency needs
**Bad for:** Long operations, unreliable downstream

### Asynchronous

Request → Acknowledge → Process later → Notify

```
User → API → Queue → Worker → Notification
      (returns immediately)
```

**Good for:** Email, reports, batch processing
**Bad for:** Need immediate response

### When to Go Async

- Operation takes > 1 second
- Downstream is unreliable
- Order doesn't matter
- Can retry independently

---

## Applying to AI Agents

These fundamentals apply directly to agent architecture:

```
┌─────────────────────────────────────────────────────────────┐
│ AGENT ARCHITECTURE PARALLELS                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  BOUNDARIES                                                 │
│  ──────────                                                 │
│  Agent ↔ Tools: Clear interface, tool returns result       │
│  Agent ↔ User: Message API, structured responses           │
│                                                             │
│  STATE MANAGEMENT                                           │
│  ────────────────                                           │
│  Conversation history: Where to store? How much?           │
│  Working memory: What the agent "remembers"                │
│  Long-term memory: Vector stores, databases                │
│                                                             │
│  SYNC vs ASYNC                                              │
│  ─────────────                                              │
│  Tool calls: Sync (wait for result)                        │
│  Long tasks: Async (background processing)                 │
│  Streaming: Async (real-time updates)                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**See:** [Agent Architecture](../../08-AI-Skills/04-Building-Agents/01-Architecture.md)

---

## Design Principles

### YAGNI (You Aren't Gonna Need It)

Don't build for hypothetical future requirements.

```
BAD:  Build microservices "in case we scale"
GOOD: Build monolith, extract when needed
```

### KISS (Keep It Simple, Stupid)

The simplest solution that works is usually best.

```
BAD:  Event sourcing for a simple CRUD app
GOOD: Postgres + simple ORM
```

### DRY (Don't Repeat Yourself)

But don't over-abstract either.

```
BAD:  Copy-paste the same code 5 times
ALSO BAD: Create abstraction used only once
GOOD: Extract when you see the pattern 3+ times
```

---

## Red Flags

Watch for these architecture smells:

- **Circular dependencies** - A depends on B depends on A
- **God objects** - One class/service does everything
- **Shotgun surgery** - One change requires many files
- **Leaky abstractions** - Implementation details escape
- **Distributed monolith** - Microservices that must deploy together

---

## Next Steps

- **Common patterns:** [02-Patterns.md](02-Patterns.md)
- **Trade-offs:** [03-Trade-offs.md](03-Trade-offs.md)
- **Evolution:** [04-Evolution.md](04-Evolution.md)
- **Agent architecture:** [Building Agents](../../08-AI-Skills/04-Building-Agents/01-Architecture.md)

---

*Good architecture is invisible. Bad architecture is a constant tax on every change.*
