# How LLMs Work

## Quick Take

You don't need a PhD to understand how ChatGPT and Claude work. This chapter explains the actual mechanism in plain language—enough to understand why LLMs behave the way they do.

**Remember:** LLMs are next-word predictors that became surprisingly capable at scale.

---

## The Simple Explanation

### What LLMs Actually Do

At their core, LLMs do one thing: **predict the next word** (technically, the next token).

```
┌─────────────────────────────────────────────────────────────┐
│ THE PREDICTION GAME                                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Input: "The quick brown fox jumps over the lazy"          │
│                                                             │
│  LLM calculates probabilities:                              │
│    "dog"    → 85% probability                              │
│    "cat"    → 8% probability                               │
│    "bear"   → 2% probability                               │
│    "..."    → remaining %                                   │
│                                                             │
│  Output: "dog"                                              │
│                                                             │
│  Now the input becomes:                                     │
│  "The quick brown fox jumps over the lazy dog"             │
│                                                             │
│  And the process repeats...                                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**That's it.** Everything else—writing essays, answering questions, coding—emerges from this simple process done at massive scale.

---

## How Training Works

### Step 1: Gather Data
LLMs are trained on enormous text datasets:
- Books (millions of them)
- Websites (a significant portion of the internet)
- Code repositories (GitHub)
- Conversations and forums
- Scientific papers

**Scale:** GPT-4 was trained on hundreds of billions of words.

### Step 2: Learn Patterns
The model learns by playing a guessing game millions of times:

```
┌─────────────────────────────────────────────────────────────┐
│ TRAINING LOOP                                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. Hide a word in a sentence                               │
│     "The capital of France is ___"                         │
│                                                             │
│  2. Model guesses: "London"                                 │
│                                                             │
│  3. Check answer: Should be "Paris"                         │
│                                                             │
│  4. Adjust model weights slightly to make "Paris"           │
│     more likely next time in similar contexts               │
│                                                             │
│  5. Repeat billions of times                                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Step 3: Emergence
Something surprising happens at scale: capabilities emerge that weren't explicitly trained.

- Train on "predict next word" → Model can summarize documents
- Train on "predict next word" → Model can write code
- Train on "predict next word" → Model can solve math problems

**This is called emergent behavior**, and it's why LLMs feel magical.

---

## The Transformer Architecture

LLMs use an architecture called the **Transformer** (from a 2017 Google paper).

### The Key Innovation: Attention

The breakthrough was "attention"—the ability to focus on relevant parts of the input.

```
┌─────────────────────────────────────────────────────────────┐
│ ATTENTION MECHANISM SIMPLIFIED                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Input: "The animal didn't cross the road because it       │
│          was too tired"                                     │
│                                                             │
│  Question: What does "it" refer to?                         │
│                                                             │
│  ATTENTION looks at relationships:                          │
│                                                             │
│  "it" ←──────────── high attention ──────────→ "animal"    │
│  "it" ←── low attention ──→ "road"                         │
│                                                             │
│  The model learns "it" refers to "animal" by attending     │
│  to the semantic relationship.                              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Why this matters:** Previous models processed text word by word. Transformers can look at everything at once and understand relationships.

---

## What's Inside an LLM

### Parameters
An LLM is essentially a huge collection of numbers called "parameters" or "weights."

| Model | Parameters | Size |
|-------|------------|------|
| GPT-2 | 1.5 billion | ~3 GB |
| GPT-3 | 175 billion | ~350 GB |
| GPT-4 | ~1.8 trillion (estimated) | Unknown |
| Claude 3 Opus | Unknown | Unknown |
| Llama 2 | 7B / 13B / 70B versions | 13-140 GB |

**Think of it like this:** The parameters encode everything the model "knows"—patterns about language, facts, reasoning strategies—all compressed into numbers.

---

## Why LLMs Hallucinate

Hallucination: When AI confidently states something false.

**Root cause:** LLMs don't retrieve facts from a database. They generate text that *seems* right based on patterns.

```
┌─────────────────────────────────────────────────────────────┐
│ WHY HALLUCINATION HAPPENS                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  User: "Who won the 2027 World Series?"                     │
│                                                             │
│  LLM thinking (simplified):                                 │
│  - Questions like this usually get team name answers        │
│  - Common baseball teams: Yankees, Dodgers, Red Sox...      │
│  - Generate confident-sounding response                     │
│                                                             │
│  LLM: "The New York Yankees won the 2027 World Series"      │
│                                                             │
│  Problem: 2027 hasn't happened. The LLM doesn't know       │
│  what it doesn't know—it just generates plausible text.    │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Note:** LLMs don't have a fact database. They have learned patterns. When patterns suggest an answer but facts don't exist, the model still generates something plausible-sounding.

---

## The Temperature Setting

LLMs have a "temperature" parameter that controls randomness.

```
┌─────────────────────────────────────────────────────────────┐
│ TEMPERATURE EFFECTS                                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Low Temperature (0.0 - 0.3)                                │
│  ──────────────────────────                                 │
│  - Almost always picks highest probability word             │
│  - More deterministic, focused                              │
│  - Good for: factual questions, code, structured output    │
│                                                             │
│  Medium Temperature (0.5 - 0.7)                             │
│  ────────────────────────────                               │
│  - Balanced between predictable and creative                │
│  - Good for: general conversation, writing                  │
│                                                             │
│  High Temperature (0.8 - 1.0)                               │
│  ───────────────────────────                                │
│  - More likely to pick lower probability words              │
│  - More creative, sometimes chaotic                         │
│  - Good for: brainstorming, creative writing                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## How Chat Works

When you chat with ChatGPT or Claude, here's what actually happens:

```
┌─────────────────────────────────────────────────────────────┐
│ A "CONVERSATION" FROM THE LLM'S VIEW                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  What you see:                                              │
│  ────────────                                               │
│  You: "Hi!"                                                 │
│  AI: "Hello! How can I help?"                               │
│  You: "What's 2+2?"                                         │
│  AI: "2+2 equals 4."                                        │
│                                                             │
│  What the LLM sees (simplified):                            │
│  ──────────────────────────────                             │
│  "[System: You are a helpful assistant]                     │
│   [User: Hi!]                                               │
│   [Assistant: Hello! How can I help?]                       │
│   [User: What's 2+2?]                                       │
│   [Assistant:"                                              │
│                                                             │
│  Then it predicts what comes next: "2+2 equals 4."         │
│                                                             │
│  KEY: The model doesn't "remember" the conversation.        │
│  The entire history is re-sent with each message.          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**This explains why:**
- Long conversations can "forget" early context (it gets pushed out)
- Cost increases with conversation length (more tokens processed)
- Starting fresh can sometimes give better results

---

## Pre-training vs Fine-tuning vs RLHF

### Pre-training
Teaching the base model from scratch on massive text data.
**Result:** A model that can predict text but isn't useful for conversation.

### Fine-tuning
Additional training on specific data for specific tasks.
**Example:** Taking a base model and training it on customer service conversations.

### RLHF (Reinforcement Learning from Human Feedback)
Training the model to give responses humans prefer.

```
┌─────────────────────────────────────────────────────────────┐
│ RLHF PROCESS                                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. Model generates multiple responses                      │
│                                                             │
│  2. Humans rank: "Response A is better than B"              │
│                                                             │
│  3. Model learns to generate responses like A               │
│                                                             │
│  4. Repeat thousands of times                               │
│                                                             │
│  Result: Model that gives helpful, harmless responses       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**This is why ChatGPT and Claude are polite and helpful**—they were trained to be.

---

## Product Implications

| LLM Behavior | Why It Happens | Product Implication |
|--------------|----------------|---------------------|
| Hallucinations | Pattern-based, not fact-based | Always verify critical info |
| Variable outputs | Temperature + randomness | Same input ≠ same output |
| Context forgetting | Limited context window | Important info can be lost |
| Confidently wrong | No uncertainty modeling | Don't trust without checking |
| Great at language | Trained on text | Language tasks > math/logic |

---

## Things to Remember

1. **LLMs predict the next word**—everything else emerges from this
2. **Training is pattern learning** on billions of examples
3. **Attention** lets models understand relationships between words
4. **Hallucination happens** because LLMs generate plausible text, not retrieve facts
5. **Temperature controls** creativity vs. determinism
6. **"Memory" is an illusion**—the whole conversation is re-sent each time

---

## Curiosity Corner: The Scaling Hypothesis

One of the most interesting debates in AI:

**The Question:** Do we just need bigger models, or do we need new architectures?

**The Evidence:**
- GPT-2 (1.5B params) → mediocre
- GPT-3 (175B params) → surprisingly good
- GPT-4 (~1.8T params) → dramatically better

**The Implication:** Maybe intelligence is "just" pattern recognition at sufficient scale?

This is still being debated, but it explains why AI labs are building ever-larger models.

---

**Next:** [03-Tokens-Context.md](03-Tokens-Context.md) — The economics and constraints of AI
