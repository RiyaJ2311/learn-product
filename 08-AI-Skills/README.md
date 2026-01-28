# Learn AI Skills

## What's Covered Here

Here's everything about AI you'll learn, from basic concepts to building your own AI agents.

Remember: You're a PM who uses AI daily but wants to understand *how* it works, *when* to use it, and eventually *how to build* with it. The goal is going from "AI user" to "AI-fluent professional" who can evaluate, design, and potentially build AI-powered features.

---

## Why This Matters

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

This is your path from Level 1 to Level 4.

---

## Module Contents

| Module | Title           | What You'll Learn                                          | Time to Complete |
| ------ | --------------- | ---------------------------------------------------------- | ---------------- |
| 00     | AI Fundamentals | How AI/LLMs actually work, tokens, context, prompting      | 2-3 hours |
| 01     | Rules vs AI     | When to use simple code vs AI, the most important decision | 1 hour |
| 02     | AI Skills       | Prompt engineering, tool use, chain-of-thought, multimodal | 3-4 hours |
| 03     | AI Agents       | What agents are, patterns, architectures, subagents        | 2-3 hours |
| 04     | Building Agents | Hands-on guide to building your first agent                | 5-7 hours |

**Total learning time:** ~15-20 hours for complete path

---

## Quick Start Guide

### Choose Your Path

**Path 1: Complete Beginner → Builder**
Start here if you're new to AI concepts and want to go all the way to building agents:
1. [00-AI-Fundamentals](00-AI-Fundamentals/00-Index.md) - Understand the basics
2. [01-Rules-vs-AI](01-Rules-vs-AI/00-Index.md) - Learn when to use AI
3. [02-AI-Skills](02-AI-Skills/00-Index.md) - Master prompting techniques
4. [03-AI-Agents](03-AI-Agents/00-Index.md) - Understand agent patterns
5. [04-Building-Agents](04-Building-Agents/00-Index.md) - Build your first agent

**Path 2: Understand AI as a PM**
Start here if you want to make better product decisions but not write code:
1. [00-AI-Fundamentals](00-AI-Fundamentals/00-Index.md) - How AI works
2. [01-Rules-vs-AI](01-Rules-vs-AI/00-Index.md) - When to use AI (critical!)
3. [03-AI-Agents](03-AI-Agents/00-Index.md) - What agents can do
4. Stop here or continue if interested

**Path 3: Already Know AI, Want to Build**
Start here if you understand LLMs and want hands-on experience:
1. [03-AI-Agents](03-AI-Agents/00-Index.md) - Agent architectures
2. [04-Building-Agents](04-Building-Agents/00-Index.md) - Build production agents

**Path 4: Just-in-Time Learning**
Start here if you have a specific question:
- "How do I write better prompts?" → [02-AI-Skills/01-Prompt-Engineering.md](02-AI-Skills/01-Prompt-Engineering.md)
- "What's the difference between rules and AI?" → [01-Rules-vs-AI](01-Rules-vs-AI/00-Index.md)
- "How do I monitor my agent?" → [04-Building-Agents/05-Observability.md](04-Building-Agents/05-Observability.md)
- "What does [term] mean?" → [GLOSSARY.md](GLOSSARY.md)

---

## The Big Picture

```
┌─────────────────────────────────────────────────────────────┐
│ HOW EVERYTHING CONNECTS                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐                                           │
│  │ FUNDAMENTALS │ ← Understanding what AI actually is       │
│  └──────┬───────┘                                           │
│         │                                                   │
│         ▼                                                   │
│  ┌─────────────┐     ┌─────────────┐                        │
│  │    RULES    │ vs  │     AI      │ ← The key decision     │
│  │ (Code/Logic)│     │   (LLMs)    │                        │
│  └─────────────┘     └──────┬──────┘                        │
│                             │                               │
│                             ▼                               │
│  ┌─────────────────────────────────────────────┐            │
│  │              AI SKILLS                      │            │
│  │  Prompting → Tools → Chain-of-Thought       │            │
│  └──────────────────────┬──────────────────────┘            │
│                         │                                   │
│                         ▼                                   │
│  ┌─────────────────────────────────────────────┐            │
│  │              AI AGENTS                      │            │
│  │  Single Agent → Multi-Agent → Subagents     │            │
│  └──────────────────────┬──────────────────────┘            │
│                         │                                   │
│                         ▼                                   │
│  ┌─────────────────────────────────────────────┐            │
│  │           BUILDING AGENTS                   │            │
│  │  Architecture → Memory → Production         │            │
│  └─────────────────────────────────────────────┘            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Real Product Use Cases

Here's what you'll learn to build:

| Use Case                            | AI Approach        | Module |
| ----------------------------------- | ------------------ | ------ |
| Smart search in your product        | Embeddings + RAG   | 00     |
| Automated customer support          | Rules + AI hybrid  | 01     |
| Content generation features         | Prompt engineering | 02     |
| Intelligent workflow automation     | AI Agents          | 03     |
| Autonomous research assistant       | Subagents          | 03     |
| Custom AI features for your product | Building Agents    | 04     |

---

## Concepts That Apply Beyond AI

While learning AI, you'll encounter fundamental software engineering concepts that are valuable across all domains:

### Observability
**Where you'll see it:** Module 04 - Building Agents

**What it is:** Understanding system behavior by examining outputs (logs, metrics, traces)

**The broader context:**
- Existed since the 1990s for web applications
- Used for microservices, distributed systems, traditional apps
- Tools like Datadog, Grafana, Prometheus predate AI by 10-15 years
- AI just adds new dimensions: non-determinism, token costs, quality evaluation

**Why it matters:** Observability is a core skill for any software system, not just AI. You're learning principles that apply everywhere.

### API Design
**Where you'll see it:** Throughout the modules

**What it is:** How to structure interfaces between components

**The broader context:**
- RESTful APIs, GraphQL existed before AI
- Tool calling in AI agents follows standard API patterns
- Skills transfer directly to traditional backend development

### System Architecture
**Where you'll see it:** Module 03 & 04

**What it is:** How to structure complex systems

**The broader context:**
- Agent patterns mirror microservice patterns
- Modular design, separation of concerns, fault tolerance
- These principles apply to any software system

**Bottom line:** This isn't just an "AI course." You're learning software engineering through the lens of AI.

---

**Start here:** [00-AI-Fundamentals/00-Index.md](00-AI-Fundamentals/00-Index.md)

---

## Documentation Resources

- **[GLOSSARY.md](GLOSSARY.md)** - Comprehensive glossary of all AI terms
- **[CHEATSHEET.md](CHEATSHEET.md)** - Quick reference for all concepts
- **[DOCUMENTATION-GUIDELINES.md](DOCUMENTATION-GUIDELINES.md)** - Style guide and standards for contributors

---

## External Learning Resources

### Foundational Courses (Free)
- [DeepLearning.AI Short Courses](https://www.deeplearning.ai/short-courses/) - Practical AI courses by Andrew Ng
- [LangChain Academy](https://academy.langchain.com/) - Building with LLMs and agents
- [Anthropic Prompt Engineering](https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview) - Official Claude guide
- [Fast.ai Practical Deep Learning](https://course.fast.ai/) - Code-first approach to AI

### Interactive Platforms
- [Learn Prompting](https://learnprompting.org/) - Free prompt engineering course
- [PromptingGuide.ai](https://www.promptingguide.ai/) - Techniques and examples
- [Transformer Explainer](https://poloclub.github.io/transformer-explainer/) - Interactive visualization

### Essential Papers
- [Attention Is All You Need](https://arxiv.org/abs/1706.03762) - The Transformer (2017)
- [GPT-3 Paper](https://arxiv.org/abs/2005.14165) - Language Models are Few-Shot Learners
- [ReAct: Reasoning and Acting](https://arxiv.org/abs/2210.03629) - Core agent pattern
- [Chain-of-Thought Prompting](https://arxiv.org/abs/2201.11903) - Reasoning techniques

### Video Explainers
- [3Blue1Brown: But what is a GPT?](https://www.youtube.com/watch?v=wjZofJX0v4M) - Visual explanation
- [Andrej Karpathy: Let's build GPT](https://www.youtube.com/watch?v=kCc8FmEb1nY) - Code walkthrough
- [The Illustrated Transformer](https://jalammar.github.io/illustrated-transformer/) - Visual guide

### Tools & Playgrounds
- [OpenAI Playground](https://platform.openai.com/playground) - Test GPT models
- [Anthropic Console](https://console.anthropic.com/) - Test Claude
- [LangSmith](https://smith.langchain.com/) - Debug and observe LLM apps
- [OpenAI Tokenizer](https://platform.openai.com/tokenizer) - Understand tokenization

### Communities
- [r/LangChain](https://www.reddit.com/r/LangChain/) - Framework discussions
- [r/LocalLLaMA](https://www.reddit.com/r/LocalLLaMA/) - Open source LLMs
- [LangChain Discord](https://discord.gg/langchain) - Real-time help
- [Anthropic Discord](https://discord.gg/anthropic) - Claude API support

### Blogs Worth Following
- [Anthropic Research](https://www.anthropic.com/research) - AI safety and capabilities
- [OpenAI Blog](https://openai.com/blog) - Latest developments
- [Lilian Weng's Blog](https://lilianweng.github.io/) - Deep technical posts
- [Simon Willison's Blog](https://simonwillison.net/) - Practical LLM insights
