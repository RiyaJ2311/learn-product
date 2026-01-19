# Tokens & Context Windows

## 2-Minute Overview

Every AI interaction has a hidden economy: **tokens**. Understanding tokens helps you predict costs, debug issues, and design better AI features. This chapter makes the invisible visible.

**The key insight:** Tokens are both the currency and the constraint of AI systems.

---

## What Are Tokens?

Tokens are the units LLMs use to read and write text. They're not quite words, not quite characters—they're somewhere in between.

```
┌─────────────────────────────────────────────────────────────┐
│ TOKENIZATION EXAMPLES                                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Text: "Hello, how are you?"                                │
│  Tokens: ["Hello", ",", " how", " are", " you", "?"]       │
│  Count: 6 tokens                                            │
│                                                             │
│  Text: "ChatGPT"                                            │
│  Tokens: ["Chat", "G", "PT"]                               │
│  Count: 3 tokens                                            │
│                                                             │
│  Text: "2023"                                               │
│  Tokens: ["202", "3"]                                       │
│  Count: 2 tokens                                            │
│                                                             │
│  Text: "supercalifragilisticexpialidocious"                │
│  Tokens: ["super", "cal", "if", "rag", "il", "istic",      │
│           "exp", "ial", "id", "ocious"]                     │
│  Count: 10 tokens                                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### The Rule of Thumb

**English text:** ~1 token ≈ 0.75 words (or ~4 characters)
**Code:** Often more tokens per line due to syntax
**Other languages:** Can vary significantly

---

## Why Tokens Matter

### 1. Pricing
AI APIs charge by token. Understanding tokens = predicting costs.

```
┌─────────────────────────────────────────────────────────────┐
│ TYPICAL PRICING (AS OF 2024)                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Model              Input (per 1M)    Output (per 1M)      │
│  ─────────────────  ──────────────    ───────────────      │
│  GPT-4o             $2.50             $10.00                │
│  GPT-4 Turbo        $10.00            $30.00                │
│  Claude 3.5 Sonnet  $3.00             $15.00                │
│  Claude 3 Opus      $15.00            $75.00                │
│  GPT-3.5 Turbo      $0.50             $1.50                 │
│                                                             │
│  Note: Output tokens cost MORE than input tokens           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 2. Context Window Limits
Every model has a maximum "context window"—the total tokens it can process at once.

| Model | Context Window |
|-------|----------------|
| GPT-3.5 | 16,385 tokens (~12k words) |
| GPT-4 | 8,192 tokens (~6k words) |
| GPT-4 Turbo | 128,000 tokens (~96k words) |
| Claude 3.5 Sonnet | 200,000 tokens (~150k words) |
| Claude 3 Opus | 200,000 tokens (~150k words) |

### 3. Speed
More tokens = slower responses. Both input and output tokens add latency.

---

## The Context Window

### What Is It?
The context window is the model's "working memory"—everything it can see at once.

```
┌─────────────────────────────────────────────────────────────┐
│ CONTEXT WINDOW BREAKDOWN                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌───────────────────────────────────────────────────────┐ │
│  │                    CONTEXT WINDOW                      │ │
│  │                     (e.g., 128K)                       │ │
│  ├───────────────────────────────────────────────────────┤ │
│  │ System Prompt │ Conversation │ User's New  │ Response │ │
│  │    (1K)       │   History    │   Message   │  Space   │ │
│  │               │    (50K)     │   (10K)     │  (67K)   │ │
│  └───────────────────────────────────────────────────────┘ │
│                                                             │
│  INPUT TOKENS                          OUTPUT TOKENS        │
│  (you pay input rate)                  (you pay output rate)│
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### What Happens When You Exceed It?

Two strategies:
1. **Truncation:** Old messages are dropped (conversation loses context)
2. **Summarization:** Old messages are summarized to save space

**Product implication:** Long conversations will eventually "forget" earlier context.

---

## Counting Tokens in Practice

### Estimation Rules

| Content Type | Tokens per Unit |
|--------------|-----------------|
| English word | ~1.3 tokens |
| Sentence | ~20-30 tokens |
| Paragraph | ~100-150 tokens |
| Page of text | ~500-700 tokens |
| 1KB of code | ~250-500 tokens |

### Exact Counting
Use tokenizer tools:
- OpenAI: [tiktoken](https://github.com/openai/tiktoken) library
- Anthropic: Built into API responses
- Online: [OpenAI Tokenizer](https://platform.openai.com/tokenizer)

```python
# Python example with tiktoken
import tiktoken

encoder = tiktoken.encoding_for_model("gpt-4")
text = "Hello, how are you today?"
tokens = encoder.encode(text)
print(f"Token count: {len(tokens)}")  # Output: 7
```

---

## Cost Calculation

### Formula
```
Total Cost = (Input Tokens × Input Price) + (Output Tokens × Output Price)
```

### Example Calculation

```
┌─────────────────────────────────────────────────────────────┐
│ COST CALCULATION EXAMPLE                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Scenario: Customer support bot using GPT-4o                │
│                                                             │
│  Per conversation:                                          │
│  - System prompt: 500 tokens                                │
│  - Avg user messages: 200 tokens                            │
│  - Avg bot responses: 300 tokens                            │
│  - Avg conversation: 5 exchanges                            │
│                                                             │
│  Input per conversation:                                    │
│    500 + (5 × 200) + (4 × 300) = 2,700 tokens              │
│    (system + user messages + prior bot responses)           │
│                                                             │
│  Output per conversation:                                   │
│    5 × 300 = 1,500 tokens                                  │
│                                                             │
│  Cost per conversation:                                     │
│    Input: 2,700 × $2.50/1M = $0.00675                      │
│    Output: 1,500 × $10.00/1M = $0.015                      │
│    Total: ~$0.022 per conversation                          │
│                                                             │
│  At 10,000 conversations/month: ~$220/month                │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Optimization Strategies

### 1. Reduce System Prompt Size
Long, verbose system prompts add up across every request.

```
❌ Verbose: "You are a helpful AI assistant. Your job is to
   answer customer questions about our product. Be friendly,
   professional, and thorough in your responses. Always
   provide accurate information and if you're unsure about
   something, let the customer know..." (100+ tokens)

✅ Concise: "You are a customer support agent for [Product].
   Be friendly and accurate. Say 'I don't know' if unsure."
   (30 tokens)
```

### 2. Manage Conversation History
Don't send the entire conversation every time.

```
┌─────────────────────────────────────────────────────────────┐
│ CONVERSATION MANAGEMENT STRATEGIES                           │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Strategy 1: Sliding Window                                 │
│  └── Keep only the last N messages                         │
│                                                             │
│  Strategy 2: Summarization                                  │
│  └── Periodically summarize old messages                   │
│  └── Keep summary + recent messages                         │
│                                                             │
│  Strategy 3: Selective Inclusion                            │
│  └── Only include messages relevant to current query       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 3. Choose the Right Model
Don't use GPT-4 for simple tasks that GPT-3.5 can handle.

| Task | Recommended Model |
|------|-------------------|
| Simple Q&A | GPT-3.5 Turbo / Claude Haiku |
| Complex reasoning | GPT-4o / Claude 3.5 Sonnet |
| Coding assistance | GPT-4 / Claude 3.5 Sonnet |
| Summarization | GPT-3.5 Turbo / Claude Haiku |
| Critical decisions | GPT-4 / Claude 3 Opus |

### 4. Prompt Engineering
More efficient prompts = fewer tokens.

```
❌ Inefficient prompt:
"Can you please help me understand and explain to me
what the concept of machine learning is and how it
works in simple terms that I can understand?"
(36 tokens)

✅ Efficient prompt:
"Explain machine learning simply."
(4 tokens)
```

---

## The Hidden Token Tax

Things that consume tokens you might not think about:

| Hidden Consumer | Token Impact |
|-----------------|--------------|
| JSON formatting | Adds ~20-50% tokens |
| Markdown formatting | Adds ~10-20% tokens |
| Error messages | Full response tokens even for errors |
| Function/tool definitions | Sent with every request |
| Few-shot examples | Repeated every request |

---

## Product Design Implications

### Pricing Your AI Feature

```
┌─────────────────────────────────────────────────────────────┐
│ PRICING WORKSHEET                                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  1. Estimate tokens per user interaction: _____             │
│                                                             │
│  2. Calculate raw cost per interaction:                     │
│     (Input tokens × price) + (Output tokens × price)        │
│     = $_____ per interaction                                │
│                                                             │
│  3. Estimate interactions per user per month: _____         │
│                                                             │
│  4. Cost per user per month: $_____ × _____ = $_____       │
│                                                             │
│  5. Add margin (3-10x for SaaS): $_____ × _____ = $_____   │
│                                                             │
│  6. Compare to value provided: Is this worth it?            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Rate Limiting Considerations
APIs have tokens-per-minute (TPM) limits, not just requests-per-minute.

| Tier | Typical TPM Limit |
|------|-------------------|
| Free tier | 40,000 TPM |
| Paid tier 1 | 60,000-90,000 TPM |
| Paid tier 2+ | 150,000+ TPM |

---

## Key Takeaways

1. **Tokens ≈ 0.75 words** for English text
2. **Output tokens cost more** than input tokens
3. **Context window is working memory**—exceed it and you lose context
4. **Conversation history is re-sent** with every message
5. **Optimize prompts and model choice** to manage costs
6. **Calculate costs early** when designing AI features

---

## Practice Exercise

Estimate the monthly cost for this feature:

**Feature:** AI-powered product description generator
**Usage:** 500 products/month, 3 variations each
**Per request:** ~100 token prompt, ~200 token output
**Model:** GPT-4o

```
Your calculation:
__________________________________________
__________________________________________
__________________________________________

Answer: ~$4.69/month
(1,500 requests × 100 input = 150K input tokens = $0.375)
(1,500 requests × 200 output = 300K output tokens = $3.00)
```

---

**Next:** [04-Prompting-Basics.md](04-Prompting-Basics.md) — How to talk to AI effectively
