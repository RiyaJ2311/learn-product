# Architecture Evolution

## The Reality

No architecture is permanent. Systems evolve with business needs, team size, and technology changes.

---

## The Typical Journey

```
┌─────────────────────────────────────────────────────────────┐
│ ARCHITECTURE EVOLUTION PATH                                  │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  STAGE 1: Monolith                                         │
│  ─────────────────                                         │
│  Team: 2-10 engineers                                      │
│  Focus: Product-market fit                                  │
│  Priority: Ship fast, iterate                               │
│                                                             │
│          ↓                                                  │
│                                                             │
│  STAGE 2: Modular Monolith                                 │
│  ────────────────────────                                   │
│  Team: 10-30 engineers                                     │
│  Focus: Maintainability                                     │
│  Priority: Clear boundaries, team ownership                │
│                                                             │
│          ↓                                                  │
│                                                             │
│  STAGE 3: Selective Extraction                             │
│  ─────────────────────────────                              │
│  Team: 30-100 engineers                                    │
│  Focus: Scale bottlenecks                                   │
│  Priority: Extract what hurts                              │
│                                                             │
│          ↓                                                  │
│                                                             │
│  STAGE 4: Microservices (maybe)                            │
│  ───────────────────────────────                            │
│  Team: 100+ engineers                                      │
│  Focus: Team autonomy                                       │
│  Priority: Independent deployment                          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## When to Evolve

### Signs You've Outgrown Your Architecture

**Monolith needs modularization:**
- Different teams stepping on each other's code
- Hard to understand what code does what
- Tests are slow and flaky
- Onboarding takes too long

**Modular monolith needs extraction:**
- One module needs different scaling
- One module has different deployment frequency
- One module needs different technology
- Module boundaries keep getting violated

**Don't evolve when:**
- "It would be cooler with microservices"
- "Other companies do it this way"
- "We might need it later"

---

## Strangler Fig Pattern

Replace a system piece by piece, not all at once.

```
┌─────────────────────────────────────────────────────────────┐
│ STRANGLER FIG MIGRATION                                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  PHASE 1: New code goes to new system                      │
│  ─────────────────────────────────────                      │
│                                                             │
│    Request → Router → Old System (existing)                │
│                   → New System (new features)              │
│                                                             │
│  PHASE 2: Migrate piece by piece                           │
│  ────────────────────────────────                           │
│                                                             │
│    Request → Router → Old System (shrinking)               │
│                   → New System (growing)                   │
│                                                             │
│  PHASE 3: Complete                                         │
│  ────────────────                                           │
│                                                             │
│    Request → New System                                    │
│    Old System → Decommissioned                             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Why It Works

- Low risk: Old system still handles most traffic
- Incremental: Learn as you go
- Reversible: Can stop at any point
- Continuous value: Don't wait for "big bang"

---

## Service Extraction Steps

### 1. Identify the Candidate

Good extraction candidates:
- Clear business domain
- High change frequency OR different scaling needs
- Minimal dependencies on other code
- Team already owns it logically

### 2. Define the Interface

Before extracting, define:
- What operations does this service expose?
- What data does it own?
- How will it communicate? (sync/async)

### 3. Create the Boundary

**In the monolith:**
```python
# Before: Direct database access everywhere
user = db.query("SELECT * FROM users WHERE id = ?", user_id)

# After: Go through UserModule
user = UserModule.get_user(user_id)
```

### 4. Add the Facade

Make internal calls look like external calls:

```python
class UserModule:
    @staticmethod
    def get_user(user_id):
        # Today: Direct DB call
        return db.query("SELECT * FROM users WHERE id = ?", user_id)

        # Tomorrow: HTTP call to service
        # return http.get(f"/users/{user_id}")
```

### 5. Extract Data

Move the data to the new service's database:
1. Replicate data to new DB
2. Switch writes to new DB
3. Switch reads to new DB
4. Remove old data

### 6. Cut Over

Switch traffic from monolith facade to actual service.

---

## Managing the Transition

### Feature Flags

```python
def get_user(user_id):
    if feature_flags.is_enabled("use_user_service"):
        return UserServiceClient.get_user(user_id)
    else:
        return UserModule.get_user(user_id)
```

### Parallel Running

Run both old and new systems, compare results:

```python
def get_user(user_id):
    old_result = UserModule.get_user(user_id)

    if feature_flags.is_enabled("test_user_service"):
        new_result = UserServiceClient.get_user(user_id)
        if old_result != new_result:
            log.warning(f"Mismatch for user {user_id}")

    return old_result  # Still return old
```

### Canary Deployment

Gradually increase traffic to new system:
- 1% → monitor → 10% → monitor → 50% → monitor → 100%

---

## Common Migration Mistakes

### 1. Big Bang Rewrite

```
BAD: "Let's rewrite everything in 6 months"
WHY: High risk, no value until complete, requirements change

BETTER: Strangler fig, incremental migration
```

### 2. Premature Extraction

```
BAD: "Let's extract 20 services at once"
WHY: Distributed system complexity, operational overhead

BETTER: Extract one service, learn, then proceed
```

### 3. Data Coupling

```
BAD: Services share the same database
WHY: No real independence, schema changes affect everyone

BETTER: Each service owns its data
```

### 4. Synchronous Everything

```
BAD: Every service calls every other service synchronously
WHY: Cascading failures, latency accumulation

BETTER: Async where possible, circuit breakers
```

---

## Architecture Fitness Functions

Automated tests for architecture:

```python
# Example: No circular dependencies
def test_no_circular_imports():
    import_graph = analyze_imports()
    cycles = find_cycles(import_graph)
    assert len(cycles) == 0, f"Circular imports found: {cycles}"

# Example: Module boundaries respected
def test_module_boundaries():
    for module in modules:
        external_deps = get_external_dependencies(module)
        assert all_through_public_api(external_deps)

# Example: Response time SLA
def test_response_time():
    response = api.get("/users/123")
    assert response.time < 200  # ms
```

---

## AI Agent Evolution

```
┌─────────────────────────────────────────────────────────────┐
│ AGENT ARCHITECTURE EVOLUTION                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  STAGE 1: Simple Agent                                     │
│  ─────────────────────                                      │
│  Single loop, basic tools                                  │
│  All in one file/process                                   │
│                                                             │
│  STAGE 2: Modular Agent                                    │
│  ───────────────────────                                    │
│  Separated: orchestration, tools, memory                   │
│  Clear interfaces between components                        │
│                                                             │
│  STAGE 3: Multi-Agent System                               │
│  ───────────────────────────                                │
│  Specialized agents for different tasks                    │
│  Orchestrator coordinates agents                           │
│                                                             │
│  STAGE 4: Autonomous Systems                               │
│  ───────────────────────────                                │
│  Agents spawn agents                                        │
│  Self-organizing, self-healing                             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Key Takeaways

1. **Evolve incrementally** - Big bangs fail
2. **Extract when it hurts** - Not before
3. **Define interfaces first** - Before extraction
4. **Use feature flags** - For safe transitions
5. **Measure and monitor** - Know if it's working
6. **Accept temporary messiness** - Migration is ugly

---

## Next Steps

- **Fundamentals:** [01-Fundamentals.md](01-Fundamentals.md)
- **Patterns:** [02-Patterns.md](02-Patterns.md)
- **Trade-offs:** [03-Trade-offs.md](03-Trade-offs.md)
- **Back to index:** [00-Index.md](00-Index.md)

---

*The best time to improve your architecture was when you started. The second best time is when the pain is clear.*
