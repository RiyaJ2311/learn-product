# What is AI?

## Quick Take

"Artificial Intelligence" is one of the most misunderstood terms in tech. Here's a clear mental model of what AI actually is, how it evolved, and where different technologies fit.

**Remember:** AI isn't one thing. It's a hierarchy of technologies, each building on the last.

---

## The AI Family Tree

```
┌─────────────────────────────────────────────────────────────┐
│ THE AI HIERARCHY                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ ARTIFICIAL INTELLIGENCE (AI)                        │   │
│  │ Machines that can perform tasks requiring           │   │
│  │ human-like intelligence                             │   │
│  │                                                     │   │
│  │  ┌──────────────────────────────────────────────┐   │   │
│  │  │ MACHINE LEARNING (ML)                       │   │   │
│  │  │ AI that learns from data instead of         │   │   │
│  │  │ being explicitly programmed                 │   │   │
│  │  │                                             │   │   │
│  │  │  ┌──────────────────────────────────────┐   │   │   │
│  │  │  │ DEEP LEARNING                       │   │   │   │
│  │  │  │ ML using neural networks with       │   │   │   │
│  │  │  │ many layers                         │   │   │   │
│  │  │  │                                     │   │   │   │
│  │  │  │  ┌──────────────────────────────┐   │   │   │   │
│  │  │  │  │ LARGE LANGUAGE MODELS       │   │   │   │   │
│  │  │  │  │ Deep learning for text      │   │   │   │   │
│  │  │  │  │ (GPT, Claude, Llama)        │   │   │   │   │
│  │  │  │  └──────────────────────────────┘   │   │   │   │
│  │  │  └──────────────────────────────────────┘   │   │   │
│  │  └──────────────────────────────────────────────┘   │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Plain English Definitions

### Artificial Intelligence (AI)

**What it is:** Any technology that makes computers do things that seem "smart" (things that would require intelligence if a human did them).

**Examples:**

- Chess computer (rule-based AI from 1997)
- Siri answering questions (voice + language AI)
- Tesla autopilot (vision + decision AI)
- ChatGPT writing essays (language generation AI)

**Note:** AI is a broad umbrella. A calculator isn't AI, but a spam filter is.

---

### Machine Learning (ML)

**What it is:** Instead of programming explicit rules ("if email contains 'Nigeria prince', mark as spam"), you show the computer many examples and it learns the patterns itself.

**The traditional approach:**

```
Human writes rules → Computer follows rules
```

**The ML approach:**

```
Human provides examples → Computer finds patterns → Computer makes predictions
```

**Examples:**

- Netflix recommendations (learned from viewing patterns)
- Fraud detection (learned from past fraud cases)
- Email spam filters (learned from marked spam)

**Note:** ML is powerful because humans don't have to figure out all the rules, the machine discovers them.

---

### Deep Learning

**What it is:** Machine learning using "neural networks", layers of mathematical functions loosely inspired by how brains work.

```
┌─────────────────────────────────────────────────────────────┐
│ NEURAL NETWORK SIMPLIFIED                                   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  INPUT         HIDDEN LAYERS         OUTPUT                 │
│  ─────         ─────────────         ──────                 │
│                                                             │
│   [Image] →  ○─○─○─○─○─○─○─○  →  "This is a cat"            │
│              ○─○─○─○─○─○─○─○                                │
│              ○─○─○─○─○─○─○─○                                │
│                                                             │
│   Each ○ is a "neuron" doing simple math                    │
│   Together, they recognize complex patterns                 │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Why "deep"?** Many layers (sometimes hundreds) stacked together.

**Note:** Deep learning enabled the AI breakthroughs of the last decade of image recognition, speech recognition, and language models.

---

### Large Language Models (LLMs)

**What it is:** Deep learning applied to text, trained on enormous amounts of writing (books, websites, code, conversations).

**The magic trick:** LLMs are trained to predict "what word comes next?"

```
Input: "The cat sat on the ___"
Output: "mat" (highest probability)
        "floor" (second highest)
        "table" (third highest)
```

Do this prediction billions of times with billions of examples, and something remarkable emerges: the model can write essays, answer questions, write code, and have conversations.

**Note:** LLMs don't "understand" in the human sense. They're incredibly sophisticated pattern matchers that generate text that *looks* like understanding.

---

## Types of AI to Know

### By Capability

| Type                       | Description                               | Current State             |
| -------------------------- | ----------------------------------------- | ------------------------- |
| **Narrow AI**        | Good at one specific task                 | This is all AI today      |
| **General AI (AGI)** | Human-level intelligence across all tasks | Doesn't exist yet         |
| **Super AI**         | Smarter than humans at everything         | Science fiction (for now) |

### By Application

| Type                        | What It Does                   | Product Use Cases                  |
| --------------------------- | ------------------------------ | ---------------------------------- |
| **Language AI**       | Understands and generates text | Chatbots, writing tools, search    |
| **Vision AI**         | Understands images and video   | Photo tagging, quality control     |
| **Speech AI**         | Converts speech to/from text   | Transcription, voice assistants    |
| **Recommendation AI** | Predicts what users want       | Netflix, Spotify, Amazon           |
| **Predictive AI**     | Forecasts future values        | Sales forecasting, demand planning |

---

## The Generative AI Revolution

### What Changed in 2022-2023?

Before: AI could classify things ("This image is a cat")
After: AI can generate things ("Create an image of a cat playing chess")

```
┌─────────────────────────────────────────────────────────────┐
│ DISCRIMINATIVE vs GENERATIVE AI                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  DISCRIMINATIVE AI (Classification)                         │
│  ─────────────────────────────────                          │
│  Input: Image → Output: "Cat" or "Dog"                      │
│  Input: Email → Output: "Spam" or "Not Spam"                │
│                                                             │
│  GENERATIVE AI (Creation)                                   │
│  ────────────────────────                                   │
│  Input: "A cat" → Output: [New image of a cat]              │
│  Input: "Write an email" → Output: [Complete email]         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Why this matters for products:**

- Before: AI could help users *find* things
- Now: AI can help users *create* things

---

## Common AI Providers

| Provider            | Models               | Known For                          |
| ------------------- | -------------------- | ---------------------------------- |
| **OpenAI**    | GPT-5, GPT-4o, o1    | First major LLM, most popular API  |
| **Anthropic** | Claude 4.5, Claude 3 | Safety-focused, great at reasoning |
| **Google**    | Gemini               | Multimodal, integrated with Google |
| **Meta**      | Llama                | Open source models                 |
| **Mistral**   | Mistral, Mixtral     | European, efficient models         |

---

## Quiz: Test Your Understanding

**Question 1:** A spam filter that learns from examples is:

- [ ] AI but not ML
- [X] ML (and therefore AI)
- [ ] Neither AI nor ML

**Question 2:** ChatGPT is trained to:

- [ ] Understand the meaning of words
- [ ] Answer questions correctly
- [X] Predict the next word in a sequence

**Question 3:** Which doesn't exist yet?

- [ ] AI that beats humans at chess
- [ ] AI that writes code
- [X] AI with general human-level intelligence

---

## Things to Remember

1. **AI is a hierarchy:** AI → ML → Deep Learning → LLMs
2. **ML learns from data** instead of following human-written rules
3. **LLMs predict text** and emergent capabilities arise from scale
4. **Generative AI creates**, not just classifies
5. **All current AI is narrow** (good at specific tasks, not general intelligence)

---

## Curiosity Corner: Why Now?

Why did AI suddenly take off in 2022-2023?

Three things came together:

1. **Compute:** GPUs became powerful enough to train massive models
2. **Data:** The internet provided trillions of words to train on
3. **Architecture:** The "Transformer" architecture (2017) made training efficient

The Transformer paper was titled "Attention Is All You Need," and it changed everything.

---

**Next:** [02-LLMs-Explained.md](02-LLMs-Explained.md) - How LLMs actually work
