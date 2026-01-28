# Personal Learning System

This is my comprehensive learning system for becoming both a better PM and AI-fluent professional.

---

## What This Is

Two integrated learning paths:

1. **PM Excellence** - Frameworks and practices for communication, data storytelling, ownership, product strategy, and leadership
2. **AI Skills** - Deep understanding of AI/ML, from fundamentals to building production agents

These aren't separate. The best PMs in the AI era understand both product craft *and* AI capabilities.

---

## Quick Start

| I Want To... | Go Here |
|--------------|---------|
| Improve my PM skills | [PM Development Path](#pm-development-path) |
| Learn AI from scratch | [08-AI-Skills/](08-AI-Skills/) |
| Build AI agents | [08-AI-Skills/04-Building-Agents/](08-AI-Skills/04-Building-Agents/) |
| Review my feedback themes | [00-Feedback-From-2025/](00-Feedback-From-2025/) |
| See PM cheatsheet | [CHEATSHEET.md](CHEATSHEET.md) |
| See AI cheatsheet | [08-AI-Skills/CHEATSHEET.md](08-AI-Skills/CHEATSHEET.md) |
| Browse AI prompts | [ai-prompts/](ai-prompts/) |
| Practice PM scenarios | [tests/scenario-exercises.md](tests/scenario-exercises.md) |
| Understand naming conventions | [NOMENCLATURE.md](NOMENCLATURE.md) |

---

## Repository Structure

```
learn/
│
├── Start Here
│   └── 00-Feedback-From-2025/       ← Personal feedback themes & rituals
│
├── PM Development Path
│   ├── 01-Communication-Clarity/    ← Answer first, impact translation
│   ├── 02-Data-Storytelling/        ← Triangulation, baselines, cohorts
│   ├── 03-Ownership-Execution/      ← Permissionless, metric ownership
│   ├── 04-Product-Strategy/         ← PRDs, outside-in, PLG
│   ├── 05-Leadership-Trust/         ← Impact selling, trust building
│   └── 07-Thinking-Patterns/        ← Mental models, decision frameworks
│
├── AI Learning Path
│   └── 08-AI-Skills/                ← Complete AI curriculum
│       ├── 00-AI-Fundamentals/      ← How AI/LLMs work
│       ├── 01-Rules-vs-AI/          ← When to use AI vs code
│       ├── 02-AI-Skills/            ← Prompting, tools, techniques
│       ├── 03-AI-Agents/            ← Agent patterns & architectures
│       ├── 04-Building-Agents/      ← Build production agents
│       └── tools/                   ← Doc validator & utilities
│
├── Resources & Tools
│   ├── ai-prompts/                  ← Production-ready AI prompts
│   ├── frameworks/                  ← PM frameworks and templates
│   ├── templates/                   ← PRD, data, comms templates
│   ├── tests/                       ← Practice exercises
│   ├── learn-code/                  ← Code projects & experiments
│   └── wip-articles/                ← Work-in-progress content
│
└── Reference Docs
    ├── README.md                    ← This file
    ├── CHEATSHEET.md                ← PM quick reference
    ├── NOMENCLATURE.md              ← Naming conventions
    ├── 08-AI-Skills/CHEATSHEET.md   ← AI quick reference
    ├── 08-AI-Skills/GLOSSARY.md     ← AI terminology
    └── 08-AI-Skills/DOCUMENTATION-GUIDELINES.md
```

---

## PM Development Path

### The Problem I'm Solving

I've received feedback. Good feedback. The kind that stings because it's true:

- **I bury the answer.** I give context when people want conclusions.
- **I present data without meaning.** Numbers without the "so what?"
- **I wait for permission.** When I should just act.
- **I think inside-out.** Starting from what we're building, not what customers need.

These aren't character flaws. They're habits. And habits can be rewired.

### Core PM Shifts

| # | Shift | Key Module | Essential Question |
|---|-------|------------|-------------------|
| 1 | Communication | [01-Communication-Clarity](01-Communication-Clarity/) | Did I answer first? |
| 2 | Data | [02-Data-Storytelling](02-Data-Storytelling/) | What's the baseline? |
| 3 | Ownership | [03-Ownership-Execution](03-Ownership-Execution/) | Why am I waiting? |
| 4 | Strategy | [04-Product-Strategy](04-Product-Strategy/) | What's the customer problem? |
| 5 | Trust | [05-Leadership-Trust](05-Leadership-Trust/) | What's my impact story? |
| 6 | Thinking | [07-Thinking-Patterns](07-Thinking-Patterns/) | What am I not seeing? |

### PM Quick Navigation

**Top Priority Files** (based on my feedback):
- [Answer First](01-Communication-Clarity/01-Answer-First.md) - Stop burying the conclusion
- [Baseline First](02-Data-Storytelling/02-Baseline-First.md) - Context before numbers
- [Permissionless](03-Ownership-Execution/01-Permissionless.md) - Act, don't ask
- [PRD Quality](04-Product-Strategy/03-PRD-Quality.md) - Write better PRDs
- [Impact Selling](05-Leadership-Trust/02-Impact-Selling.md) - Tell your story

**Common Workflows**:
- Writing PRDs: [PRD Quality](04-Product-Strategy/03-PRD-Quality.md) + [Baseline First](02-Data-Storytelling/02-Baseline-First.md) + [Outside-In Thinking](04-Product-Strategy/02-Outside-In-Thinking.md)
- Presenting Data: [Data Triangulation](02-Data-Storytelling/01-Data-Triangulation.md) + [Baseline First](02-Data-Storytelling/02-Baseline-First.md) + [Impact Translation](01-Communication-Clarity/02-Impact-Translation.md)
- Sharing Updates: [Answer First](01-Communication-Clarity/01-Answer-First.md) + [Permissionless](03-Ownership-Execution/01-Permissionless.md) + [Impact Selling](05-Leadership-Trust/02-Impact-Selling.md)

---

## AI Learning Path

### Why AI Skills Matter for PMs

```
┌─────────────────────────────────────────────────────────────┐
│ THE AI SKILLS PROGRESSION                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  LEVEL 4: BUILDER                                           │
│  └── Can design and build AI agents/features                │
│  └── Speaks fluently with ML engineers                      │
│                                                             │
│  LEVEL 3: EVALUATOR                                         │
│  └── Knows when AI is the right solution                    │
│  └── Can assess AI capabilities and limitations             │
│                                                             │
│  LEVEL 2: POWER USER                                        │
│  └── Writes excellent prompts                               │
│  └── Uses AI tools effectively for daily work               │
│                                                             │
│  LEVEL 1: CASUAL USER ← Most people stop here               │
│  └── Uses ChatGPT/Claude occasionally                       │
│  └── Doesn't understand how it works                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Goal**: Go from Level 1 (casual user) to Level 4 (builder).

### AI Module Contents

| Module | Focus | What You'll Learn |
|--------|-------|------------------|
| [00-AI-Fundamentals](08-AI-Skills/00-AI-Fundamentals/) | Foundation | How AI/LLMs work, tokens, context, embeddings |
| [01-Rules-vs-AI](08-AI-Skills/01-Rules-vs-AI/) | Decision Framework | When to use code vs AI (critical skill) |
| [02-AI-Skills](08-AI-Skills/02-AI-Skills/) | Techniques | Prompting, tool use, chain-of-thought |
| [03-AI-Agents](08-AI-Skills/03-AI-Agents/) | Architecture | Agent patterns, multi-agent systems |
| [04-Building-Agents](08-AI-Skills/04-Building-Agents/) | Implementation | Build production-ready agents |

### AI Quick Start

- **New to AI?** Start with [AI Fundamentals](08-AI-Skills/00-AI-Fundamentals/00-Index.md)
- **Understand AI basics?** Jump to [Rules vs AI](08-AI-Skills/01-Rules-vs-AI/00-Index.md)
- **Want to build?** Go to [Building Agents](08-AI-Skills/04-Building-Agents/00-Index.md)
- **Need definitions?** Check [AI Glossary](08-AI-Skills/GLOSSARY.md)

---

## Resources & Tools

### AI Prompts Collection
[ai-prompts/](ai-prompts/) - Production-ready prompts for:
- Product strategy analysis
- User research synthesis
- Feature prioritization
- UX audits
- Technical documentation

### PM Templates
[templates/](templates/) - Ready-to-use templates for:
- PRDs and spec documents
- Data analysis presentations
- Communication frameworks
- Strategy documents

### Practice & Testing
[tests/](tests/) - Scenario exercises and self-assessments for PM skills

### Code Projects
[learn-code/](learn-code/) - Hands-on coding projects and experiments

---

## How to Use This System

### Daily Practice

**Before meetings:** Glance at relevant frameworks. Prime your thinking.

**After key work:** Grade yourself. What worked? What would you do differently?

**Weekly ritual:** Reflect on patterns. Map feedback to frameworks. Practice fixes.

### The Learning Approach

1. **Read** - Understand the framework or concept
2. **Practice** - Apply it to real work situations
3. **Reflect** - Assess what worked, what didn't
4. **Iterate** - Refine your approach based on results

### Making It Stick

The goal isn't to memorize frameworks. It's to make excellent thinking automatic.

Ask the right questions enough times, they become instinct:
- Did I answer first?
- What does this data mean?
- Why am I waiting for permission?
- Have I talked to customers?
- Would AI or code be better here?
- What am I not seeing?

**Deliberate practice → unconscious competence**

---

## Why This Exists

This is my personal system for becoming the PM I want to be. It's built from:
- Real feedback I've received
- Frameworks from PMs at Amazon, Atlassian, Uber, Airbnb
- AI/ML concepts from production systems
- Daily practice and iteration

It's not a course to complete. It's a system to practice.

**The bet:** If I practice these patterns consistently, they'll become automatic. I won't have to *think* about answering first, I'll just do it. I won't have to *remind* myself about baselines, they'll be my default.

This isn't about being perfect. It's about being better than yesterday.

---

## Quick Reference Cheatsheets

- **[PM Cheatsheet](CHEATSHEET.md)** - One-page PM frameworks reference
- **[AI Cheatsheet](08-AI-Skills/CHEATSHEET.md)** - Quick AI concepts reference
- **[AI Glossary](08-AI-Skills/GLOSSARY.md)** - Comprehensive AI terminology
- **[Documentation Guidelines](08-AI-Skills/DOCUMENTATION-GUIDELINES.md)** - Content standards
- **[Nomenclature](NOMENCLATURE.md)** - Repository naming conventions and standards

---

*Built from real feedback, proven frameworks, and continuous iteration. Always improving.*
