# Module 0: AI Fundamentals

## 2-Minute Overview

Goal: Understand AI well enough to explain it to others, evaluate AI features, and speak intelligently with engineers.

---

## Why Bother with Fundamentals

Here's what to avoid:

1. **AI Mysticism:** "AI is magic, I don't need to understand it"
2. **AI Oversimplification:** "It's just autocomplete"

Both are wrong. The truth is more interesting and more useful.

```
┌─────────────────────────────────────────────────────────────┐
│ WHAT YOU'LL ACTUALLY UNDERSTAND                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ✓ How LLMs "think" (and why they hallucinate)              │
│  ✓ What tokens are and why they matter for pricing          │
│  ✓ Why context windows are the key constraint               │
│  ✓ How prompting actually works under the hood              │
│  ✓ The difference between AI types (and when each applies)  │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## What's Covered

| Part | Title            | What to Focus On                             |
| ---- | ---------------- | -------------------------------------------- |
| 01   | What is AI?      | AI vs ML vs LLMs- demystifying the buzzwords |
| 02   | How LLMs Work    | The actual mechanism behind ChatGPT/Claude   |
| 03   | Tokens & Context | The economics and constraints of AI          |
| 04   | Prompting Basics | Why your words matter so much                |

---

## The Mental Model

Think of an LLM like this:

```
┌─────────────────────────────────────────────────────────────┐
│ THE LLM MENTAL MODEL                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  INPUT                    PROCESS                 OUTPUT    │
│  ──────                   ───────                 ──────    │
│                                                             │
│  "What is the     →   [Predicts most    →   "The capital    │
│   capital of           likely next           of France      │
│   France?"             word, again           is Paris."     │
│                        and again]                           │
│                                                             │
│  KEY INSIGHT: LLMs don't "know" things.                     │
│  They predict what text should come next based on           │
│  patterns learned from training data.                       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

This simple model explains:

- Why AI sounds confident but can be wrong (hallucination)
- Why the same question can get different answers
- Why how you ask matters so much (prompting)

---

## Quick Concepts

### AI vs ML vs LLM

| Term                    | What It Means                                   | Example                       |
| ----------------------- | ----------------------------------------------- | ----------------------------- |
| **AI**            | Broad field of making machines "intelligent"    | Everything below              |
| **ML**            | Machines learning patterns from data            | Spam filters, recommendations |
| **Deep Learning** | ML using neural networks with many layers       | Image recognition             |
| **LLM**           | Large Language Model are deep learning for text | ChatGPT, Claude               |
| **GenAI**         | AI that generates new content                   | LLMs, DALL-E, Midjourney      |

### Key Terms to Remember

- **Token:** The unit of text AI reads (roughly 0.75 words)
- **Context Window:** How much text AI can "remember" at once
- **Prompt:** Your instructions to the AI
- **Hallucination:** When AI confidently says something false
- **Fine-tuning:** Customizing a model for specific tasks
- **RAG:** Retrieval Augmented Generation for giving AI access to your data

---

## Product Use Cases by AI Type

| AI Type                  | What It's Good For                        | Product Example                    |
| ------------------------ | ----------------------------------------- | ---------------------------------- |
| **LLMs**           | Text understanding, generation, reasoning | Chatbots, content tools, summaries |
| **Embeddings**     | Finding similar things, search            | Smart search, recommendations      |
| **Image Models**   | Creating/editing images                   | Design tools, avatars              |
| **Speech Models**  | Voice-to-text, text-to-voice              | Transcription, voice assistants    |
| **Traditional ML** | Predictions from structured data          | Fraud detection, forecasting       |

---

## Common Misconceptions

| Misconception                  | Reality                                                  |
| ------------------------------ | -------------------------------------------------------- |
| "AI understands meaning"       | AI predicts patterns; understanding is debatable         |
| "AI has a memory"              | AI only "remembers" what's in the current context window |
| "AI is deterministic"          | AI has randomness built in (temperature setting)         |
| "Bigger model = always better" | Smaller models can be faster, cheaper, and sufficient    |
| "AI will replace everyone"     | AI augments; the best combo is human + AI                |

---

## Start Here

**Go to:** [01-What-is-AI.md](01-What-is-AI.md)

Or if you have specific questions:

- "What's the difference between AI and ML?" → [01-What-is-AI.md](01-What-is-AI.md)
- "How does ChatGPT actually work?" → [02-LLMs-Explained.md](02-LLMs-Explained.md)
- "Why does AI pricing work that way?" → [03-Tokens-Context.md](03-Tokens-Context.md)
- "How do I write better prompts?" → [04-Prompting-Basics.md](04-Prompting-Basics.md)
