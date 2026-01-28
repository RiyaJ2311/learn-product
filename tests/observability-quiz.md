# Observability Quiz for PMs

Test your understanding of observability concepts with diverse question types. Answers are at the bottom - no peeking!

---

## Section 1: True or False

Mark each statement as True (T) or False (F):

### Q1
Observability and monitoring are the same thing.
```
Your answer: [ ]
```

### Q2
Product analytics tools like PostHog track system behavior (errors, latency).
```
Your answer: [ ]
```

### Q3
The three pillars of observability are: Logs, Metrics, and Traces.
```
Your answer: [ ]
```

### Q4
P95 latency of 2 seconds means the average request takes 2 seconds.
```
Your answer: [ ]
```

### Q5
You need both product analytics AND observability for a complete picture.
```
Your answer: [ ]
```

---

## Section 2: Fill in the Blanks

### Q6
Complete the comparison:
- Database = your application's **____________** (stores business data)
- Observability = your application's **____________** (records how things happened)

### Q7
The key difference between monitoring and observability:
- Monitoring answers **____________** questions
- Observability lets you ask **____________** questions

### Q8
Product analytics tells you "users are abandoning checkout."
Observability tells you "**____________**"

---

## Section 3: Matching

### Q9
Match the tool to its primary purpose:

| Tool | Purpose |
|------|---------|
| 1. Honeycomb | A. Product analytics - user behavior tracking |
| 2. PostHog | B. High-cardinality debugging queries |
| 3. Prometheus | C. Log aggregation and SIEM |
| 4. Splunk | D. Metrics collection for Kubernetes |

```
Your answers:
1 → [ ]
2 → [ ]
3 → [ ]
4 → [ ]
```

### Q10
Match the question to who asks it:

| Question | Who Asks |
|----------|----------|
| 1. "Why did this request fail?" | A. PM using product analytics |
| 2. "What features do users click most?" | B. Engineer using observability |
| 3. "What's causing the 2% error rate?" | C. PM using observability data |
| 4. "How many users drop off at step 3?" | |

```
Your answers:
1 → [ ]
2 → [ ]
3 → [ ]
4 → [ ]
```

---

## Section 4: Scenario-Based (Short Answer)

### Q11: The Support Ticket

**Scenario:** A user emails: "I tried to checkout but got an error. This happened around 2pm."

Without observability, you would: _________________________________

With good observability, you would: _________________________________

### Q12: The Launch Review

**Scenario:** You launched a new "quick checkout" feature yesterday. Your manager asks: "How's it going?"

What 3 metrics would you check in your observability dashboard?

1. _________________________________
2. _________________________________
3. _________________________________

### Q13: The Incident

**Scenario:** Engineering says "We're seeing elevated error rates." You have a stakeholder meeting in 30 minutes.

Write 3 questions you'd ask engineering to prepare:

1. _________________________________
2. _________________________________
3. _________________________________

---

## Section 5: Diagram Interpretation

### Q14
Look at this simplified trace:

```
User Request
    │
    ├── Auth Service (50ms) ✓
    │
    ├── Product Service (100ms) ✓
    │
    ├── Inventory Service (150ms) ✓
    │
    └── Payment Service (4500ms) ✗ TIMEOUT

Total time: 4800ms (FAILED)
```

Answer these questions:
1. Which service caused the failure? _________________________________
2. What percentage of time was spent in the failing service? _________________________________
3. As a PM, what would you prioritize investigating? _________________________________

---

## Section 6: Choose the Better Question

### Q15
You need to understand why users are complaining about slowness. Which question to engineering is better?

**Option A:** "The app is slow, can you fix it?"

**Option B:** "What's the P95 latency for the /checkout endpoint this week, and has it changed since the last deploy?"

Your choice: [ ] and explain why: _________________________________

### Q16
A bug was reported. Which is the better first step?

**Option A:** Ask the user to "try again and let us know if it happens again"

**Option B:** Ask for the user's session ID or email to look up their specific request trace

Your choice: [ ] and explain why: _________________________________

---

## Section 7: Categorization

### Q17
Put each item in the correct category:

Items:
- Error rate per endpoint
- User funnel drop-off
- Request latency P95
- Feature adoption rate
- Database query time
- A/B test conversion
- Service dependency map
- User session recordings

| Observability | Product Analytics |
|---------------|-------------------|
| | |
| | |
| | |
| | |

---

## Section 8: Multiple Choice (Complex)

### Q18
Your observability dashboard shows:
- Feature A: 0.5% error rate, 100 daily users
- Feature B: 0.1% error rate, 10,000 daily users

Calculate the daily affected users and decide which to prioritize:

Feature A affects: _______ users/day
Feature B affects: _______ users/day
Priority: Feature [ ] because _________________________________

### Q19
Which combination of tools would give you the MOST complete picture?

- A) PostHog + Google Analytics
- B) Datadog + PostHog
- C) Honeycomb + Honeycomb
- D) Splunk + Prometheus

Your answer: [ ] and explain: _________________________________

---

## Section 9: Real-World Application

### Q20
You're a PM for an AI chatbot product. List one thing you'd track in each category:

| Category | What to Track | Why |
|----------|---------------|-----|
| **Observability** | | |
| **Product Analytics** | | |
| **AI-Specific** | | |

---

# Answer Key

**Don't scroll down until you've completed all sections!**

.
.
.
.
.
.
.
.
.
.

## Answers

### Section 1: True or False

| Q | Answer | Explanation |
|---|--------|-------------|
| Q1 | **False** | Monitoring checks known things; observability lets you explore unknowns |
| Q2 | **False** | PostHog tracks user behavior, not system behavior |
| Q3 | **True** | Logs, Metrics, Traces are the three pillars |
| Q4 | **False** | P95 means 95% of requests are UNDER 2 seconds (not average) |
| Q5 | **True** | Analytics finds the what, observability finds the why |

### Section 2: Fill in the Blanks

| Q | Answer |
|---|--------|
| Q6 | **memory** / **diary** (or journal/record) |
| Q7 | **pre-defined** (or known) / **arbitrary** (or any) |
| Q8 | **"checkout is timing out for X% of requests"** (or similar system-level explanation) |

### Section 3: Matching

| Q9 | Q10 |
|----|-----|
| 1→B | 1→B |
| 2→A | 2→A |
| 3→D | 3→C |
| 4→C | 4→A |

### Section 4: Scenario-Based

**Q11:**
- Without: "Can you reproduce it? What browser? When exactly?" (back-and-forth)
- With: "What's your email/session ID?" → Look up their exact trace → Find root cause

**Q12:** Good answers include:
1. Error rate for quick checkout
2. Latency (P50, P95) for quick checkout
3. Success rate / completion rate
4. Comparison to regular checkout performance

**Q13:** Good questions:
1. "What's the blast radius - how many users affected?"
2. "When did this start? Any recent deploys?"
3. "Which user segments are impacted (enterprise, free, specific regions)?"
4. "What's the error rate trend - getting better or worse?"

### Section 5: Diagram Interpretation

**Q14:**
1. Payment Service
2. 94% (4500ms / 4800ms)
3. Payment service reliability - why is it timing out? Is it a dependency, capacity issue, or code problem?

### Section 6: Choose the Better Question

**Q15:** Option B - It's specific, measurable, and gives engineering something concrete to investigate.

**Q16:** Option B - With good observability, you can see exactly what happened instead of waiting for reproduction.

### Section 7: Categorization

| Observability | Product Analytics |
|---------------|-------------------|
| Error rate per endpoint | User funnel drop-off |
| Request latency P95 | Feature adoption rate |
| Database query time | A/B test conversion |
| Service dependency map | User session recordings |

### Section 8: Multiple Choice

**Q18:**
- Feature A: 0.5 users/day (100 × 0.5%)
- Feature B: 10 users/day (10,000 × 0.1%)
- Priority: **Feature B** - 20x more users affected daily

**Q19:** **B) Datadog + PostHog**
- Datadog = observability (system health)
- PostHog = product analytics (user behavior)
- Together they cover both "why is it broken" and "what are users doing"

### Section 9: Real-World Application

**Q20:** Example answers:

| Category | What to Track | Why |
|----------|---------------|-----|
| **Observability** | API response time, error rate | Know if the system is healthy |
| **Product Analytics** | Messages per session, feature usage | Understand how users interact |
| **AI-Specific** | Token costs per conversation, response quality ratings | AI has unique cost and quality dimensions |

---

## Scoring Guide

| Section | Points | Your Score |
|---------|--------|------------|
| True/False (5 Q) | 5 pts | /5 |
| Fill in Blanks (3 Q) | 6 pts | /6 |
| Matching (2 Q) | 8 pts | /8 |
| Scenarios (3 Q) | 9 pts | /9 |
| Diagram (1 Q) | 3 pts | /3 |
| Better Question (2 Q) | 4 pts | /4 |
| Categorization (1 Q) | 8 pts | /8 |
| Complex MC (2 Q) | 4 pts | /4 |
| Application (1 Q) | 3 pts | /3 |
| **Total** | **50 pts** | **/50** |

| Score | Level |
|-------|-------|
| 45-50 | Expert - You deeply understand observability |
| 35-44 | Proficient - Solid foundation |
| 25-34 | Developing - Review key concepts |
| 0-24 | Beginner - Start with [01-Fundamentals.md](../learn-code/observability/01-Fundamentals.md) |

---

## Further Reading

- [Observability Fundamentals](../learn-code/observability/01-Fundamentals.md)
- [Tools Overview](../learn-code/observability/02-Tools-Overview.md)
- [Observability for PMs](../learn-code/observability/04-For-PMs.md)
- [AI Agent Observability](../08-AI-Skills/04-Building-Agents/05-Observability.md)
