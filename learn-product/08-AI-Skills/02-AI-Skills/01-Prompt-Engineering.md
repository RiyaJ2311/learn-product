# Advanced Prompt Engineering

## Quick Take

You've learned the basics of prompting. Now let's go deeper. This chapter covers advanced techniques that professional AI builders use to get consistent, high-quality results.

**Remember:** The difference between okay and excellent AI output often comes down to prompt structure, not model choice.

---

## System Prompts vs User Prompts

### The Two-Part Structure

```
┌─────────────────────────────────────────────────────────────┐
│ PROMPT ARCHITECTURE                                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌───────────────────────────────────────────────────────┐ │
│  │ SYSTEM PROMPT                                          │ │
│  │ Sets personality, rules, and constant context          │ │
│  │ Sent with EVERY request (usually hidden from user)    │ │
│  │                                                        │ │
│  │ "You are a helpful customer support agent for Acme.   │ │
│  │  Always be friendly. Never discuss competitors.       │ │
│  │  If you don't know something, say so."               │ │
│  └───────────────────────────────────────────────────────┘ │
│                                                             │
│  ┌───────────────────────────────────────────────────────┐ │
│  │ USER PROMPT                                            │ │
│  │ The specific request or question                       │ │
│  │ Changes with each interaction                          │ │
│  │                                                        │ │
│  │ "How do I reset my password?"                         │ │
│  └───────────────────────────────────────────────────────┘ │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### What Goes in Each?

| System Prompt | User Prompt |
|---------------|-------------|
| Role/persona | Specific question |
| Behavioral rules | Current context |
| Output format specs | Input data |
| Company context | User's specific request |
| Constraints/guardrails | |

---

## System Prompt Architecture

### The Components

```
┌─────────────────────────────────────────────────────────────┐
│ SYSTEM PROMPT TEMPLATE                                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. ROLE DEFINITION                                         │
│     "You are a [specific role] with expertise in [domain]" │
│                                                             │
│  2. CONTEXT                                                 │
│     "You work for [company]. Our product does [X]."        │
│                                                             │
│  3. BEHAVIORAL RULES                                        │
│     "Always [do X]. Never [do Y]."                         │
│                                                             │
│  4. OUTPUT SPECIFICATIONS                                   │
│     "Respond in [format]. Keep answers [length]."          │
│                                                             │
│  5. EXAMPLES (optional)                                     │
│     "Example interaction: ..."                              │
│                                                             │
│  6. SPECIAL INSTRUCTIONS                                    │
│     "If [condition], then [action]."                       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Example System Prompt

```
You are a senior product manager assistant helping with PRDs
and product decisions.

CONTEXT:
- You work with B2B SaaS product teams
- You value clarity, data, and user outcomes over features
- You're familiar with frameworks like JTBD, RICE, and OKRs

BEHAVIORAL RULES:
- Always ask clarifying questions before making assumptions
- Push back on feature requests without clear user problems
- Be direct and concise—busy PMs don't have time for fluff
- If you don't know something, say so

OUTPUT FORMAT:
- Use bullet points for lists
- Bold key terms and recommendations
- Keep responses under 300 words unless detail requested

SPECIAL INSTRUCTIONS:
- If asked to write a PRD, use the standard template
- If analyzing a feature request, always identify the JTBD
- If comparing options, use a simple pros/cons table
```

---

## Few-Shot Learning

### What Is It?
Showing the AI examples of what you want before asking for output.

### Why It Works
```
┌─────────────────────────────────────────────────────────────┐
│ THE POWER OF EXAMPLES                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Zero-shot:  "Classify this ticket"                        │
│  Result:     Variable, AI guesses your categories           │
│                                                             │
│  Few-shot:   "Here are examples:                           │
│              'App crashes' → Bug                            │
│              'Add dark mode' → Feature Request              │
│              'How do I export?' → Question                  │
│              Now classify: 'Login is broken'"              │
│  Result:     Consistent, follows your patterns              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Few-Shot Template

```
[Task description]

Examples:
---
Input: [example 1 input]
Output: [example 1 output]
---
Input: [example 2 input]
Output: [example 2 output]
---
Input: [example 3 input]
Output: [example 3 output]
---

Now process this:
Input: [actual input]
Output:
```

### Best Practices for Examples

1. **Use 2-5 examples** — More isn't always better
2. **Cover edge cases** — Include diverse scenarios
3. **Match your real data** — Examples should look like actual inputs
4. **Be consistent** — Same format in every example

---

## Output Format Control

### Structured Output Techniques

#### JSON Output
```
Analyze this customer feedback and return JSON:

{
  "sentiment": "positive|negative|neutral",
  "category": "bug|feature|question|praise|complaint",
  "urgency": "high|medium|low",
  "summary": "one sentence summary"
}

Feedback: "Your app is great but I wish it had dark mode.
The bright screen hurts my eyes at night."
```

#### Markdown Tables
```
Compare these options and return a markdown table:

| Option | Pros | Cons | Recommendation |
|--------|------|------|----------------|
| ... | ... | ... | ... |

Options to compare:
1. Build in-house
2. Buy existing solution
3. Partner with vendor
```

#### Bulleted Analysis
```
Analyze this PRD using the following structure:

**Strengths:**
- [bullet points]

**Weaknesses:**
- [bullet points]

**Questions to Address:**
- [bullet points]

**Overall Assessment:** [one paragraph]
```

---

## Prompt Chaining

### What Is It?
Breaking complex tasks into multiple prompts, where each output feeds the next.

### When to Use It
- Task is too complex for one prompt
- You need intermediate outputs
- Different parts need different expertise
- You want to validate intermediate steps

### Chaining Pattern

```
┌─────────────────────────────────────────────────────────────┐
│ PROMPT CHAIN EXAMPLE: Content Creation                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  STEP 1: Research                                           │
│  ─────────────────                                          │
│  Prompt: "List 5 key topics about [subject]"               │
│  Output: Topic list                                         │
│          ↓                                                  │
│  STEP 2: Outline                                            │
│  ────────────────                                           │
│  Prompt: "Create an outline using these topics: [list]"    │
│  Output: Structured outline                                 │
│          ↓                                                  │
│  STEP 3: Draft                                              │
│  ───────────────                                            │
│  Prompt: "Write section 1 based on this outline: [outline]"│
│  Output: Section draft                                      │
│          ↓                                                  │
│  STEP 4: Review                                             │
│  ────────────────                                           │
│  Prompt: "Improve this draft for clarity: [draft]"         │
│  Output: Final content                                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Chain Design Tips

1. **Each step should have a clear input and output**
2. **Validate intermediate outputs** before proceeding
3. **Use different models for different steps** (fast/cheap for simple, powerful for complex)
4. **Save intermediate outputs** for debugging

---

## Prompting for Reliability

### The Problem
AI outputs can vary. For production systems, you need consistency.

### Techniques for Consistency

#### 1. Temperature Control
```
temperature: 0.0  → Deterministic (same output each time)
temperature: 0.7  → Creative (varies each time)

For factual/structured tasks: Use low temperature
For creative tasks: Use higher temperature
```

#### 2. Explicit Format Enforcement
```
❌ "Return the category"
✅ "Return ONLY one of these exact strings: BUG, FEATURE, QUESTION"

❌ "Give me a number"
✅ "Return a single integer between 1 and 10, nothing else"
```

#### 3. Validation Instructions
```
Before returning your response, verify:
1. The JSON is valid (no trailing commas)
2. All required fields are present
3. Values match the allowed options

If any check fails, fix the issue before responding.
```

#### 4. Fallback Handling
```
If you cannot determine the category with confidence,
return: {"category": "UNKNOWN", "confidence": "low"}

Do NOT guess if uncertain.
```

---

## Meta-Prompting

### What Is It?
Using AI to help write and improve prompts.

### The Meta-Prompt

```
I need to create a prompt for the following task:
[Describe your task]

The prompt will be used in a production system with these
requirements:
- [Requirement 1]
- [Requirement 2]

Please write a comprehensive prompt that includes:
1. Clear role definition
2. Specific instructions
3. Output format specification
4. 2-3 few-shot examples
5. Edge case handling

Then, identify potential weaknesses in the prompt and
suggest improvements.
```

---

## Common Prompt Patterns

### The Persona Pattern
```
You are a [role] who [key characteristics].
Your goal is to [objective].
You communicate in a [tone] manner.
```

### The Template Pattern
```
Fill in this template based on the input:

TEMPLATE:
Title: [generate based on content]
Summary: [2-3 sentences]
Key Points:
- [point 1]
- [point 2]
- [point 3]
Action Items: [if any]
```

### The Critic Pattern
```
First, complete the task.
Then, critique your own output:
- What could be improved?
- What might be wrong?
- What's missing?

Finally, provide an improved version addressing the critique.
```

### The Step-by-Step Pattern
```
Complete this task step by step:
1. First, [step 1]
2. Then, [step 2]
3. Finally, [step 3]

Show your work for each step.
```

---

## Debugging Prompts

When your prompt isn't working:

### Debugging Checklist

```
┌─────────────────────────────────────────────────────────────┐
│ PROMPT DEBUGGING CHECKLIST                                   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  □ Is the task clearly defined?                            │
│  □ Is there enough context?                                 │
│  □ Are examples provided if needed?                        │
│  □ Is the output format specified?                         │
│  □ Are constraints explicit?                               │
│  □ Is the prompt too long/complex?                         │
│  □ Are there conflicting instructions?                     │
│  □ Is the temperature appropriate?                         │
│  □ Would breaking into steps help?                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### The A/B Testing Approach
```
1. Create variant prompts
2. Run same inputs through each
3. Compare outputs
4. Identify what works
5. Iterate
```

---

## Things to Remember

1. **System prompts set the stage** — Define role, rules, and format once
2. **Few-shot examples teach patterns** — Show, don't just tell
3. **Explicit formats reduce variance** — Be specific about output structure
4. **Chains break complexity** — Multiple simple steps beat one complex prompt
5. **Test and iterate** — Prompts are code; treat them as such

---

## Practice Exercise

Create a production-ready system prompt for:

**Task:** An AI assistant that helps users write job application cover letters

**Requirements:**
- Professional but personable tone
- Asks clarifying questions
- Customizes to the job posting
- Keeps letters under 300 words

**Your prompt:**
```
_______________________________________________
_______________________________________________
_______________________________________________
_______________________________________________
```

---

**Next:** [02-Tool-Use.md](02-Tool-Use.md) — Giving AI the ability to take actions
