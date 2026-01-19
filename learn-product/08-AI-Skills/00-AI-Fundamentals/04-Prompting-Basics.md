# Prompting Basics

## Quick Take

The way you talk to AI dramatically affects what you get back. This chapter covers the foundational principles of prompting—the skill that separates mediocre AI results from excellent ones.

**Remember:** Prompting is about reducing ambiguity and providing context. The AI fills in gaps with assumptions—better prompts mean fewer wrong assumptions.

---

## Why Prompting Matters

Same question, different prompts, vastly different results:

```
┌─────────────────────────────────────────────────────────────┐
│ PROMPT QUALITY COMPARISON                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ❌ VAGUE PROMPT:                                           │
│  "Write about dogs"                                         │
│                                                             │
│  → Generic 500-word essay about dogs as pets                │
│                                                             │
│  ──────────────────────────────────────────────────────     │
│                                                             │
│  ✅ SPECIFIC PROMPT:                                        │
│  "Write a 100-word product description for a premium dog    │
│   food brand targeting health-conscious pet owners. Focus   │
│   on natural ingredients and digestive health benefits.     │
│   Tone: friendly but authoritative."                        │
│                                                             │
│  → Exactly what you needed                                  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## The 5 Elements of a Good Prompt

### 1. Task
What do you want the AI to do?

```
❌ "Marketing stuff"
✅ "Write 3 email subject lines for a product launch"
```

### 2. Context
What background information does the AI need?

```
❌ "Write an email"
✅ "Write an email to users who signed up for our waitlist
   6 months ago. Our product is a budget tracking app for
   freelancers. We're launching next week."
```

### 3. Format
How should the output be structured?

```
❌ "Give me ideas"
✅ "Give me 5 ideas in a numbered list, each with a one-
   sentence explanation"
```

### 4. Tone/Style
How should it sound?

```
❌ "Write a message"
✅ "Write a professional but warm message suitable for
   LinkedIn"
```

### 5. Constraints
What are the boundaries?

```
❌ "Summarize this"
✅ "Summarize this in 3 bullet points, max 20 words each.
   Don't include numbers or statistics."
```

---

## The Prompt Template

Use this structure for consistent results:

```
┌─────────────────────────────────────────────────────────────┐
│ UNIVERSAL PROMPT TEMPLATE                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  [ROLE] You are a [specific role with expertise].          │
│                                                             │
│  [CONTEXT] Background: [relevant information]               │
│                                                             │
│  [TASK] Your task is to [specific action].                 │
│                                                             │
│  [FORMAT] Format your response as [structure].              │
│                                                             │
│  [CONSTRAINTS] Requirements:                                │
│  - [Constraint 1]                                           │
│  - [Constraint 2]                                           │
│                                                             │
│  [INPUT] Here's the input to work with:                    │
│  [Your content]                                             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Example Using the Template

```
You are a senior product manager at a B2B SaaS company.

Background: We're preparing for a quarterly business review
with the executive team. Our product is a project management
tool for remote teams.

Your task is to identify the 3 most important metrics to
highlight in the QBR.

Format your response as:
1. Metric name
   - Why it matters
   - What story it tells

Requirements:
- Focus on metrics that show product-market fit
- Avoid vanity metrics
- Consider both leading and lagging indicators

Our current metrics:
- MAU: 15,000 (up 20% QoQ)
- DAU/MAU: 45%
- NPS: 42
- Churn: 3% monthly
- Avg session: 23 minutes
```

---

## Core Prompting Techniques

### 1. Be Specific

```
┌─────────────────────────────────────────────────────────────┐
│ SPECIFICITY SPECTRUM                                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ❌ Vague          ⚠️ Better           ✅ Specific          │
│  ──────           ─────────           ───────────          │
│                                                             │
│  "Help with       "Help write        "Write a 50-word     │
│   writing"         a bio"             LinkedIn bio for     │
│                                       a PM with 5 years    │
│                                       experience, focusing │
│                                       on data-driven       │
│                                       product decisions"   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 2. Provide Examples (Few-Shot Prompting)

Show the AI what you want by giving examples:

```
Convert these feature descriptions to user stories:

Example:
Feature: Dark mode
User Story: As a user who works at night, I want a dark
color scheme so that I can use the app without eye strain.

Now convert:
Feature: Offline sync
```

### 3. Use Delimiters

Clearly separate different parts of your prompt:

```
Analyze the following customer feedback and categorize it.

###FEEDBACK START###
The app crashes every time I try to upload a photo.
Really frustrating because I love the editing features!
###FEEDBACK END###

Categories to use:
- Bug report
- Feature request
- Praise
- Complaint
```

### 4. Step-by-Step Instructions

Break complex tasks into steps:

```
Analyze this support ticket step by step:

Step 1: Identify the core issue
Step 2: Assess the severity (Critical/High/Medium/Low)
Step 3: Suggest a response template
Step 4: Recommend any product improvements

Ticket: "I can't log in. I've tried resetting my password
three times but never get the email."
```

### 5. Ask for Reasoning (Chain-of-Thought)

Get the AI to show its work:

```
Decide whether we should build this feature. Think step
by step:

1. First, analyze the customer demand
2. Then, estimate the development effort
3. Next, consider the strategic fit
4. Finally, give your recommendation with confidence level

Feature request: "Add a mobile app"
Customer requests: 47 in last quarter
Current platform: Web only
Dev team: 5 engineers
```

---

## Role Prompting

Assigning a role shapes the response style and expertise:

```
┌─────────────────────────────────────────────────────────────┐
│ ROLE EXAMPLES                                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Role                      Effect on Response               │
│  ────                      ──────────────────               │
│                                                             │
│  "You are a teacher"       → Simple explanations            │
│  "You are a scientist"     → Technical, precise             │
│  "You are a marketer"      → Persuasive, benefit-focused   │
│  "You are a critic"        → Analytical, finds weaknesses  │
│  "You are a coach"         → Encouraging, actionable        │
│  "You are a PM at Google"  → Structured, metric-focused    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Common Prompting Mistakes

### Mistake 1: Assuming Context

```
❌ "What do you think about the pricing?"
   AI: "What pricing are you referring to?"

✅ "What do you think about our pricing strategy? We charge
   $29/month for our project management SaaS, targeting
   small businesses. Competitors charge $15-50/month."
```

### Mistake 2: Too Many Instructions at Once

```
❌ "Write a blog post about AI, make it SEO-optimized,
   include keywords, add a call-to-action, make it funny
   but professional, include statistics, and keep it
   under 500 words while being comprehensive."

✅ Break into multiple prompts or prioritize:
   "Write a 500-word blog post about AI for business.
   Primary goal: Be informative and engaging.
   Include one specific statistic.
   End with a soft call-to-action."
```

### Mistake 3: Not Iterating

Your first prompt rarely gets the best result. Prompting is a conversation:

```
Prompt 1: "Write a product announcement"
→ Too formal

Prompt 2: "Make it more casual and exciting"
→ Too casual

Prompt 3: "Find a middle ground—professional but energetic"
→ Perfect
```

---

## Output Formatting Tricks

### Get Structured Data

```
Extract information from this email and return as JSON:

{
  "sender_intent": "complaint/question/request",
  "urgency": "high/medium/low",
  "topic": "brief description",
  "action_needed": "yes/no"
}

Email: [paste email]
```

### Get Consistent Lists

```
List 5 potential risks, using this exact format for each:

**Risk:** [Name]
**Likelihood:** [High/Medium/Low]
**Impact:** [High/Medium/Low]
**Mitigation:** [One sentence]
```

### Get Multiple Options

```
Provide 3 different options for the tagline:

Option A (Professional): [tagline]
Option B (Playful): [tagline]
Option C (Bold): [tagline]

Then recommend which one and why.
```

---

## The Refinement Loop

Good prompting is iterative:

```
┌─────────────────────────────────────────────────────────────┐
│ THE PROMPT REFINEMENT LOOP                                   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│     ┌─────────┐                                             │
│     │ Initial │                                             │
│     │ Prompt  │                                             │
│     └────┬────┘                                             │
│          │                                                   │
│          ▼                                                   │
│     ┌─────────┐                                             │
│     │   Get   │                                             │
│     │ Output  │                                             │
│     └────┬────┘                                             │
│          │                                                   │
│          ▼                                                   │
│     ┌─────────────┐      ┌──────────────┐                  │
│     │  Evaluate:  │──────▶│   Perfect?   │                 │
│     │  What's     │      │   Done!      │                   │
│     │  missing?   │      └──────────────┘                  │
│     └──────┬──────┘                                         │
│            │ Not quite                                      │
│            ▼                                                │
│     ┌─────────────┐                                         │
│     │   Refine    │                                         │
│     │   Prompt    │───────────────────────────┐            │
│     └─────────────┘                           │            │
│            ▲                                  │            │
│            └──────────────────────────────────┘            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Refinement Phrases

- "Make it more [concise/detailed/formal/casual]"
- "Focus more on [specific aspect]"
- "Remove the [unwanted element]"
- "Add [missing element]"
- "Restructure to be [new format]"
- "Pretend you didn't say [wrong thing], and instead..."

---

## Quick Reference Card

```
┌─────────────────────────────────────────────────────────────┐
│ PROMPTING CHEAT SHEET                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ✓ Start with a role: "You are a..."                       │
│  ✓ Provide context: "Background: ..."                       │
│  ✓ Be specific about the task: "Your task is to..."        │
│  ✓ Specify format: "Format as..."                          │
│  ✓ Add constraints: "Requirements: ..."                    │
│  ✓ Use delimiters for inputs: ###, """, etc.               │
│  ✓ Give examples for complex tasks                         │
│  ✓ Ask for step-by-step reasoning                          │
│  ✓ Iterate and refine                                       │
│                                                             │
│  AVOID:                                                     │
│  ✗ Vague instructions                                       │
│  ✗ Missing context                                          │
│  ✗ Too many competing requirements                          │
│  ✗ Expecting perfection on first try                       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Things to Remember

1. **Specificity wins**—vague prompts get vague results
2. **Context is everything**—AI fills gaps with assumptions
3. **Format matters**—tell the AI exactly how to structure output
4. **Examples teach**—show, don't just tell
5. **Iterate always**—prompting is a conversation, not a command

---

## Practice Exercise

Transform this bad prompt into a good one:

**Bad prompt:** "Help me with my presentation"

**Your improved prompt:**
```
_________________________________________________
_________________________________________________
_________________________________________________
_________________________________________________
```

**Example good prompt:**
```
You are a presentation coach who has helped executives
deliver compelling pitches.

I'm preparing a 10-minute presentation to our leadership
team about why we should invest in AI features for our
product (B2B project management SaaS).

Help me by:
1. Suggesting a 5-slide structure
2. Writing the opening hook (first 30 seconds)
3. Identifying the 3 strongest arguments to include

Requirements:
- Assume the audience is skeptical about AI hype
- Focus on business outcomes, not technology
- Include one specific competitor example
```

---

**Next Module:** [../01-Rules-vs-AI/00-Index.md](../01-Rules-vs-AI/00-Index.md) — When to use AI vs simple rules
