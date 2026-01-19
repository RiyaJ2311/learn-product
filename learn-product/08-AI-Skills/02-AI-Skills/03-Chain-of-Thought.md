# Chain-of-Thought Reasoning

## Quick Take

Humans solve complex problems by thinking step-by-step. AI can too—if you ask it correctly. **Chain-of-thought (CoT)** prompting makes AI show its reasoning, leading to better answers and explainable decisions.

**Remember:** Asking AI to "think step by step" dramatically improves performance on complex tasks.

---

## Why Chain-of-Thought Works

### The Problem with Direct Answers

```
┌─────────────────────────────────────────────────────────────┐
│ WITHOUT CHAIN-OF-THOUGHT                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Prompt: "Roger has 5 tennis balls. He buys 2 more cans    │
│          of tennis balls. Each can has 3 balls. How many   │
│          tennis balls does he have now?"                    │
│                                                             │
│  AI: "11"                                                   │
│                                                             │
│  Problems:                                                  │
│  - We don't know if it reasoned correctly                  │
│  - Hard to debug if wrong                                   │
│  - AI might skip steps and make errors                     │
│                                                             │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│ WITH CHAIN-OF-THOUGHT                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Prompt: "Roger has 5 tennis balls. He buys 2 more cans    │
│          of tennis balls. Each can has 3 balls. How many   │
│          tennis balls does he have now?                     │
│          Let's think step by step."                        │
│                                                             │
│  AI: "Let me work through this step by step:               │
│       1. Roger starts with 5 tennis balls                  │
│       2. He buys 2 cans of tennis balls                    │
│       3. Each can contains 3 balls, so 2 × 3 = 6 new balls│
│       4. Total: 5 + 6 = 11 tennis balls                    │
│                                                             │
│       Roger has 11 tennis balls."                          │
│                                                             │
│  Benefits:                                                  │
│  - We can verify each step                                 │
│  - Errors are visible and debuggable                       │
│  - AI is more accurate with explicit reasoning             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## The Research Behind It

In 2022, Google researchers found that simply adding "Let's think step by step" improved accuracy dramatically:

| Task Type | Without CoT | With CoT |
|-----------|-------------|----------|
| Math word problems | 17.7% | 78.7% |
| Common sense reasoning | 57.7% | 71.3% |
| Symbolic reasoning | 12.5% | 92.5% |

**Why does this work?** The step-by-step output forces the model to "think" through intermediate steps rather than jumping to conclusions.

---

## Chain-of-Thought Techniques

### 1. Zero-Shot CoT
Just add "Let's think step by step."

```
[Your question]

Let's think step by step.
```

Simple but effective for many tasks.

### 2. Few-Shot CoT
Provide examples with reasoning.

```
Q: There are 15 trees in a grove. Grove workers planted
   trees today. After they were done, there are 21 trees.
   How many trees did they plant?

A: Let's think step by step.
   - Started with 15 trees
   - Ended with 21 trees
   - Trees planted = 21 - 15 = 6
   The answer is 6 trees.

Q: [Your new question]

A: Let's think step by step.
```

### 3. Structured CoT
Define explicit reasoning steps.

```
Analyze this problem using these steps:

STEP 1 - UNDERSTAND: What is being asked?
STEP 2 - IDENTIFY: What information do we have?
STEP 3 - PLAN: What approach will we use?
STEP 4 - EXECUTE: Apply the approach
STEP 5 - VERIFY: Does the answer make sense?

Problem: [Your problem]
```

---

## When to Use Chain-of-Thought

### Great For:
- Math and calculations
- Logic puzzles
- Multi-step reasoning
- Decision making
- Debugging/troubleshooting
- Analysis tasks
- Comparisons

### Less Useful For:
- Simple factual questions
- Creative writing
- Translation
- Single-step tasks

---

## Product Applications

### 1. Explainable AI Decisions

```
┌─────────────────────────────────────────────────────────────┐
│ USE CASE: Loan Approval Assistant                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Instead of: "Approved" / "Denied"                         │
│                                                             │
│  With CoT:                                                  │
│  "Let me evaluate this application step by step:           │
│                                                             │
│   1. Credit Score (680): Meets minimum threshold of 640 ✓  │
│   2. Debt-to-Income (35%): Below 43% maximum ✓             │
│   3. Employment: 3 years at current job ✓                  │
│   4. Down Payment (15%): Meets 10% minimum ✓               │
│                                                             │
│   All criteria met. Recommendation: Approve                │
│   Confidence: High"                                         │
│                                                             │
│  Benefit: User understands why, can address issues         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 2. Debugging Assistant

```
User: "My code isn't working"

AI with CoT:
"Let me analyze this step by step:

1. READING THE CODE:
   - Function takes two parameters
   - Returns their sum

2. IDENTIFYING THE ISSUE:
   - Line 5: Using '+' with a string and int
   - Python can't add string '5' to int 3

3. ROOT CAUSE:
   - Input isn't being converted to int

4. SUGGESTED FIX:
   - Add int() conversion on line 3

Here's the corrected code..."
```

### 3. Product Prioritization

```
Prompt:
"Evaluate this feature request using our prioritization
framework. Think through each criterion step by step."

AI with CoT:
"Let me evaluate using RICE framework:

REACH:
- Affects all 50K users who export reports
- Reach score: 50,000

IMPACT:
- Saves ~10 minutes per export (currently manual process)
- Impact: 2 (Medium - noticeable improvement)

CONFIDENCE:
- We have user interviews (8/10 requested this)
- Confidence: 80%

EFFORT:
- Engineering estimate: 3 weeks
- Effort: 3 person-weeks

RICE SCORE: (50,000 × 2 × 0.8) / 3 = 26,667

Recommendation: High priority based on RICE score"
```

---

## Advanced CoT Patterns

### Self-Consistency
Run the same prompt multiple times, take the majority answer.

```
┌─────────────────────────────────────────────────────────────┐
│ SELF-CONSISTENCY PATTERN                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Run 1: "Let's think..." → Answer: 42                      │
│  Run 2: "Let's think..." → Answer: 42                      │
│  Run 3: "Let's think..." → Answer: 38                      │
│  Run 4: "Let's think..." → Answer: 42                      │
│  Run 5: "Let's think..." → Answer: 42                      │
│                                                             │
│  Final answer: 42 (appeared 4/5 times)                     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Tree of Thoughts
Explore multiple reasoning paths, evaluate each.

```
Problem: [Complex problem]

Generate 3 different approaches to solve this:

Approach 1: [First method]
Approach 2: [Second method]
Approach 3: [Third method]

Now evaluate each approach:
- Approach 1: [pros/cons, likelihood of success]
- Approach 2: [pros/cons, likelihood of success]
- Approach 3: [pros/cons, likelihood of success]

Select the best approach and solve:
```

### Reflection
Ask the AI to verify its own work.

```
[Problem and initial solution]

Now verify your answer:
1. Re-read the original problem
2. Check each step for errors
3. Verify the final answer makes sense
4. If you find errors, correct them

Final verified answer:
```

---

## Implementing CoT in Products

### Pattern: Show/Hide Reasoning

```
┌─────────────────────────────────────────────────────────────┐
│ UI PATTERN: EXPANDABLE REASONING                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────────────────────────────────────────────┐  │
│  │ Recommendation: Upgrade to Pro Plan                   │  │
│  │                                                       │  │
│  │ [▼ Show reasoning]                                   │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                             │
│  Expanded:                                                  │
│  ┌──────────────────────────────────────────────────────┐  │
│  │ Recommendation: Upgrade to Pro Plan                   │  │
│  │                                                       │  │
│  │ [▲ Hide reasoning]                                   │  │
│  │                                                       │  │
│  │ Here's why:                                          │  │
│  │ 1. You're using 85% of free storage (4.2/5 GB)      │  │
│  │ 2. You've hit the API limit 3 times this week       │  │
│  │ 3. Pro adds team features you asked about           │  │
│  │ 4. Cost: $12/mo covers your current usage patterns  │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Pattern: Reasoning in Logs

```python
def analyze_with_cot(user_input):
    response = call_ai(
        prompt=f"{user_input}\n\nThink step by step.",
        system="Show your reasoning before the final answer."
    )

    # Extract reasoning and answer
    reasoning = extract_reasoning(response)
    answer = extract_answer(response)

    # Log reasoning for debugging/auditing
    logger.info(f"Reasoning: {reasoning}")

    # Return only the answer to user (or both if transparency needed)
    return answer
```

---

## CoT Prompt Templates

### For Analysis Tasks
```
Analyze [subject] using the following approach:

1. OBSERVATION: What do you notice?
2. INTERPRETATION: What does it mean?
3. IMPLICATIONS: What are the consequences?
4. RECOMMENDATION: What should be done?

[Content to analyze]
```

### For Decision Tasks
```
Make a recommendation on [decision] by thinking through:

1. CRITERIA: What factors matter?
2. OPTIONS: What are the choices?
3. EVALUATION: How does each option score?
4. TRADE-OFFS: What are we giving up with each?
5. DECISION: Which option wins and why?

[Decision context]
```

### For Problem-Solving
```
Solve this problem step by step:

1. UNDERSTAND: Restate the problem in your own words
2. PLAN: Outline your approach
3. EXECUTE: Work through the solution
4. CHECK: Verify the answer

Problem: [Your problem]
```

---

## Things to Remember

1. **"Think step by step" is magic** — Simple addition, big improvement
2. **CoT shows the work** — Enables debugging and trust
3. **Best for complex reasoning** — Math, logic, analysis, decisions
4. **Combine with other techniques** — Few-shot CoT is powerful
5. **Use for explainability** — Users trust AI they can understand

---

## Practice Exercise

Use CoT to solve this product problem:

**Situation:** Your SaaS product has a 30-day free trial. Conversion rate is 15%. You're considering these changes:
- Option A: Reduce trial to 14 days
- Option B: Add credit card requirement upfront
- Option C: Add usage limits to free trial

**Write a CoT prompt to analyze these options:**
```
_______________________________________________
_______________________________________________
_______________________________________________
```

**Then run it and see how AI reasons through the trade-offs.**

---

**Next:** [04-Multi-Modal.md](04-Multi-Modal.md) — Working with images, audio, and more
