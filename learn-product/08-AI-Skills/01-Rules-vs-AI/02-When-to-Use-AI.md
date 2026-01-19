# When to Use AI

## Quick Take

AI shines in situations where rules would be impossible or impractical to write. This chapter helps you recognize when AI is genuinely the right tool—not just the exciting one.

**Remember:** AI excels at tasks humans find easy but can't explain how they do—understanding language, recognizing patterns, making judgment calls.

---

## The Case for AI

AI becomes the right choice when:

```
┌─────────────────────────────────────────────────────────────┐
│ AI ADVANTAGES                                                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ✓ Handles Natural Language                                 │
│    Understands meaning, not just patterns                   │
│                                                             │
│  ✓ Manages Ambiguity                                        │
│    Works with incomplete or unclear inputs                  │
│                                                             │
│  ✓ Scales Judgment                                          │
│    Applies "common sense" at scale                         │
│                                                             │
│  ✓ Handles Infinite Variations                              │
│    No need to enumerate every case                          │
│                                                             │
│  ✓ Generates Creative Content                               │
│    Creates, not just classifies                             │
│                                                             │
│  ✓ Learns from Examples                                     │
│    Few-shot learning without code changes                   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## When AI Beats Rules

### 1. Understanding Natural Language

When you need to understand what people *mean*, not just match keywords.

**Examples:**
- Customer support intent detection
- Search query understanding
- Sentiment analysis
- Document summarization
- Question answering

```
┌─────────────────────────────────────────────────────────────┐
│ WHY RULES FAIL AT LANGUAGE                                   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Customer messages meaning "I want to cancel":              │
│                                                             │
│  • "Cancel my subscription"                                 │
│  • "I want out"                                             │
│  • "How do I stop being charged?"                           │
│  • "This isn't working for me anymore"                      │
│  • "I'd like to discontinue my service"                     │
│  • "Please delete my account"                               │
│  • "I'm done with this"                                     │
│  • "Can I get a refund and stop the subscription?"          │
│                                                             │
│  Rules would need hundreds of patterns.                     │
│  AI understands intent naturally.                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

**Product application:** Smart support routing
```
Input: "This app keeps crashing when I try to upload photos"

AI Output: {
  "intent": "bug_report",
  "category": "technical_issue",
  "feature": "photo_upload",
  "sentiment": "frustrated",
  "urgency": "high"
}

→ Route to technical support team, prioritize
```

---

### 2. Content Generation

When you need to create text, not just transform it.

**Examples:**
- Product descriptions
- Email drafts
- Marketing copy
- Report summaries
- Personalized messages

```
✅ AI EXCELS AT:
- "Write 3 variations of this headline"
- "Generate a product description from these bullet points"
- "Summarize this 10-page document in 3 paragraphs"
- "Create a personalized email for this customer segment"

❌ RULES CAN'T:
- Create genuinely new, contextual content
- Adjust tone based on subtle context
- Generate creative variations
- Summarize while preserving meaning
```

**Product application:** Dynamic content
```
Input: Product attributes
- Type: Running shoes
- Price: $129
- Features: Lightweight, cushioned, breathable mesh
- Target: Marathon runners

AI Output: "Engineered for the long run. These ultralight
trainers feature responsive cushioning that stays fresh
through mile 26, wrapped in breathable mesh that keeps
you cool when the race heats up."
```

---

### 3. Classification with Infinite Categories

When inputs can vary infinitely and rules would never cover everything.

**Examples:**
- Email categorization
- Support ticket triage
- Content moderation
- Lead scoring
- Document classification

```
┌─────────────────────────────────────────────────────────────┐
│ CLASSIFICATION COMPLEXITY                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Task: Categorize customer feedback                         │
│                                                             │
│  RULES APPROACH:                                            │
│  If contains "bug" or "crash" → Technical                  │
│  If contains "billing" or "charge" → Billing               │
│  If contains "cancel" → Churn Risk                         │
│  ...50 more rules...                                        │
│  Still misses: "The thing doesn't work"                    │
│                                                             │
│  AI APPROACH:                                               │
│  "Categorize this feedback: Bug Report, Feature Request,   │
│   Billing Issue, Praise, Complaint, Question"              │
│  Handles any phrasing naturally                             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

### 4. Extraction from Unstructured Data

When information is buried in text, images, or documents.

**Examples:**
- Resume parsing
- Invoice data extraction
- Meeting notes summarization
- Contract analysis
- Email metadata extraction

```
Input (Email):
"Hey team, let's meet Thursday at 2pm to discuss the Q3
roadmap. I'll book the Maple room. Please bring your
feature proposals. - Sarah"

AI Output:
{
  "type": "meeting_invite",
  "date": "Thursday",
  "time": "2pm",
  "topic": "Q3 roadmap",
  "location": "Maple room",
  "sender": "Sarah",
  "action_items": ["Bring feature proposals"]
}
```

**Product application:** Smart form filling
- User uploads a document
- AI extracts relevant fields
- Form auto-populates
- User just reviews and confirms

---

### 5. Recommendations and Personalization

When you need to predict preferences based on patterns.

**Examples:**
- Content recommendations
- Product suggestions
- Next-best-action
- Personalized search ranking
- Dynamic pricing optimization

```
┌─────────────────────────────────────────────────────────────┐
│ PERSONALIZATION EXAMPLE                                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  User context:                                              │
│  - Viewed: Running shoes, fitness trackers                  │
│  - Purchased: Yoga mat last month                           │
│  - Searched: "marathon training plan"                       │
│  - Season: Spring                                           │
│                                                             │
│  Rules approach: Show "running shoes" (simple match)       │
│                                                             │
│  AI approach: "Based on your marathon interest and recent  │
│  yoga purchase, here's a training bundle with hydration    │
│  gear, energy gels, and these highly-rated cushioned       │
│  trainers perfect for long-distance running."              │
│                                                             │
│  AI understands the story; rules see keywords.             │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

### 6. Conversational Interfaces

When users expect natural dialogue, not command-line precision.

**Examples:**
- Chatbots
- Voice assistants
- Interactive tutorials
- Guided workflows
- Natural language queries

```
❌ RULES-BASED CHAT:
User: "I want to change my address"
Bot: "Please type: UPDATE ADDRESS [new address]"
User: "uh, 123 Main St"
Bot: "Sorry, I didn't understand. Please type: UPDATE ADDRESS..."

✅ AI-BASED CHAT:
User: "I want to change my address"
Bot: "Sure! What's your new address?"
User: "123 Main St, Boston"
Bot: "Got it. I'll update your address to 123 Main St, Boston, MA. Is that correct?"
```

---

### 7. Code and Technical Tasks

When you need to generate, explain, or transform code.

**Examples:**
- Code generation
- Code explanation
- Bug detection
- Documentation generation
- Query writing (SQL, etc.)

```
User prompt: "Write a SQL query to find users who signed up
in the last 30 days but haven't made a purchase"

AI Output:
SELECT u.user_id, u.email, u.signup_date
FROM users u
LEFT JOIN purchases p ON u.user_id = p.user_id
WHERE u.signup_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
  AND p.purchase_id IS NULL;
```

---

## Real Product Examples

### Example 1: Smart Search

**Task:** Help users find products with natural queries

```
User searches: "something to keep my coffee hot during my commute"

RULES: Search for "coffee" → Returns coffee beans, coffee makers

AI: Understands intent → Returns:
- Travel mugs
- Insulated tumblers
- Car cup warmers
- Thermal carafes
```

### Example 2: Automated Response Drafts

**Task:** Draft customer support responses

```
Ticket: "I ordered the blue version but got red. Really disappointed
as this was a gift. Order #12345"

AI Draft:
"Hi [Customer],

I'm so sorry about this mix-up, especially since this was meant
to be a gift. That's really frustrating.

I've located your order #12345 and am shipping the correct blue
item today with express delivery at no extra charge. You'll receive
tracking within the hour.

Please keep the red item as our apology—no need to return it.

Is there anything else I can help with?"

Agent reviews, adjusts if needed, sends in seconds.
```

### Example 3: Intelligent Document Processing

**Task:** Process incoming contracts

```
Input: 20-page legal contract (PDF)

AI extracts:
- Parties involved
- Effective date
- Term length
- Key obligations
- Termination clauses
- Payment terms
- Risk flags

Output: Structured summary + original with highlights
```

---

## AI Readiness Checklist

Use AI when you can check most of these:

- [ ] Task involves understanding natural language
- [ ] Inputs vary infinitely (can't enumerate all cases)
- [ ] Some interpretation/judgment is required
- [ ] Output can vary slightly (not strictly deterministic)
- [ ] Response time of 500ms-5s is acceptable
- [ ] Cost per request fits the business model
- [ ] 90-99% accuracy is acceptable (not 100% required)
- [ ] Human review is possible for edge cases

---

## Warning Signs You Definitely Need AI

| If you're experiencing this... | AI can help |
|-------------------------------|-------------|
| Rules engine has 500+ rules and growing | Pattern-based classification |
| Users complain search is "dumb" | Semantic search |
| Support team does repetitive writing | Content generation |
| Data entry from documents is slow | Extraction automation |
| Users phrase requests in many ways | Natural language understanding |
| Personalization feels generic | Context-aware recommendations |

---

## Things to Remember

1. **Use AI for language understanding**—it's what LLMs are built for
2. **Use AI for content generation**—creating, not just transforming
3. **Use AI when rules would be endless**—infinite input variations
4. **Use AI for extraction**—structured data from unstructured sources
5. **Use AI for natural interfaces**—conversational, not command-based
6. **Acceptable accuracy threshold is key**—AI isn't 100% reliable

---

**Next:** [03-Decision-Framework.md](03-Decision-Framework.md) — A practical framework for deciding
