# Multimodal AI

## Quick Take

AI isn't limited to text anymore. Modern models can see images, understand documents, and work with multiple types of content simultaneously. This chapter covers how to leverage **multimodal capabilities** in your products.

**Remember:** The same AI that writes text can now analyze images, charts, screenshots, and documents. opening up entirely new product possibilities.

---

## What Is Multimodal AI?

### The Evolution

```
┌─────────────────────────────────────────────────────────────┐
│ AI EVOLUTION                                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  TEXT-ONLY (2020-2022)                                      │
│  ────────────────────                                       │
│  Input: Text                                               │
│  Output: Text                                               │
│  Example: "Summarize this article"                         │
│                                                             │
│  MULTIMODAL (2023+)                                         │
│  ─────────────────                                          │
│  Input: Text + Images + Documents + Audio                  │
│  Output: Text (and sometimes images)                        │
│  Example: "What's in this image? Now write a caption."     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### What Models Support

| Model | Images | Documents | Audio | Video |
|-------|--------|-----------|-------|-------|
| GPT-4o | Yes | Yes (via images) | Yes | Limited |
| Claude 3.5 | Yes | Yes (PDFs native) | No | No |
| Gemini 1.5 | Yes | Yes | Yes | Yes |

---

## Vision Capabilities

### What AI Can See

```
┌─────────────────────────────────────────────────────────────┐
│ VISION CAPABILITIES                                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ✓ Read text in images (OCR)                               │
│  ✓ Describe image contents                                  │
│  ✓ Analyze charts and graphs                                │
│  ✓ Understand diagrams and flowcharts                       │
│  ✓ Identify objects and people                              │
│  ✓ Understand UI screenshots                                │
│  ✓ Read handwriting (with varying accuracy)                │
│  ✓ Analyze data visualizations                              │
│  ✓ Compare multiple images                                  │
│                                                             │
│  ✗ Not great: Fine details, complex technical drawings     │
│  ✗ Not possible: Real-time video, audio in images          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### How to Use Vision

```python
# Example: Claude with image
import anthropic
import base64

client = anthropic.Anthropic()

# Load image
with open("chart.png", "rb") as f:
    image_data = base64.standard_b64encode(f.read()).decode("utf-8")

message = client.messages.create(
    model="claude-sonnet-4-20250514",
    max_tokens=1024,
    messages=[
        {
            "role": "user",
            "content": [
                {
                    "type": "image",
                    "source": {
                        "type": "base64",
                        "media_type": "image/png",
                        "data": image_data,
                    },
                },
                {
                    "type": "text",
                    "text": "Analyze this chart. What are the key trends?"
                }
            ],
        }
    ],
)

print(message.content[0].text)
```

---

## Product Use Cases

### 1. Receipt/Invoice Processing

```
┌─────────────────────────────────────────────────────────────┐
│ USE CASE: Expense Report Automation                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  User uploads: [Photo of restaurant receipt]               │
│                                                             │
│  AI extracts:                                             │
│  {                                                          │
│    "merchant": "Olive Garden",                             │
│    "date": "2024-01-15",                                   │
│    "total": 47.82,                                          │
│    "category": "Meals & Entertainment",                    │
│    "items": [                                               │
│      {"name": "Pasta", "price": 18.99},                    │
│      {"name": "Salad", "price": 12.99},                    │
│      {"name": "Drinks", "price": 8.99},                    │
│      {"name": "Tax", "price": 6.85}                        │
│    ]                                                        │
│  }                                                          │
│                                                             │
│  User just reviews and submits                              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 2. Dashboard Analysis

```
Prompt: "Analyze this dashboard screenshot. What are the
key insights a PM should know?"

Input: [Screenshot of analytics dashboard]

AI Output:
"Key insights from this dashboard:

1. TRAFFIC:
   - 23% increase in sessions this month
   - Mobile traffic now exceeds desktop (55% vs 45%)

2. CONVERSION:
   - Funnel shows 68% drop-off at checkout
   - This is higher than the 50% industry benchmark

3. ENGAGEMENT:
   - Average session duration down 12%
   - Pages per session also declining

RECOMMENDATION: The checkout drop-off is concerning.
I'd prioritize investigating checkout UX issues."
```

### 3. UI/UX Review

```
Prompt: "Review this mobile app screenshot for UX issues"

Input: [App screenshot]

AI Output:
"UX Issues Identified:

1. CRITICAL: CTA button ('Buy Now') is below fold, users
   might not see it. Move above fold.

2. HIGH: Text contrast on gray background is 3.2:1,
   below WCAG AA standard of 4.5:1.

3. MEDIUM: Touch targets are ~35px, below recommended
   44px minimum for mobile.

4. LOW: Icon meanings unclear, add labels.

Priority fix: Move CTA and fix contrast."
```

### 4. Document Understanding

```
Prompt: "Extract key terms from this contract page"

Input: [Photo of legal document]

AI Output:
"Key Terms Extracted:

- TERM: 24 months, auto-renewal
- PAYMENT: Net 30, 2% late fee per month
- TERMINATION: 90 days written notice required
- LIABILITY CAP: $500,000
- JURISDICTION: State of Delaware

FLAG: The auto-renewal clause requires 90 days notice
to cancel. Calendar this deadline."
```

### 5. Technical Diagram Analysis

```
Prompt: "Explain this architecture diagram to a junior engineer"

Input: [System architecture diagram]

AI Output:
"This diagram shows a microservices architecture:

REQUEST FLOW:
1. User requests hit the Load Balancer
2. Load Balancer routes to one of 3 API Gateway instances
3. API Gateway authenticates via Auth Service
4. Requests go to appropriate microservice:
   - User Service (manages accounts)
   - Order Service (processes purchases)
   - Notification Service (sends emails/push)

DATA LAYER:
- Each service has its own database (database-per-service pattern)
- Redis cluster for caching frequently accessed data
- All services publish events to Kafka for async communication

This pattern allows each service to scale independently."
```

---

## Image Prompting Best Practices

### Be Specific About What You Want

```
❌ VAGUE: "What's in this image?"
   Result: Generic description

✅ SPECIFIC: "This is a product analytics dashboard.
   Identify the top 3 metrics shown and explain what
   each one indicates about product health."
   Result: Actionable insights
```

### Provide Context

```
❌ NO CONTEXT: [Image of chart]
   "Analyze this"

✅ WITH CONTEXT: [Image of chart]
   "This chart shows our monthly active users for 2023.
   We launched a major feature in March and ran a
   marketing campaign in September. What patterns do
   you see, and what might explain them?"
```

### Ask Follow-Up Questions

```
Turn 1: "Describe what's in this image"
Turn 2: "Focus on the data table in the top right"
Turn 3: "Calculate the percentage change between Q1 and Q2"
```

---

## Document Processing

### PDF Handling

```
┌─────────────────────────────────────────────────────────────┐
│ DOCUMENT PROCESSING APPROACHES                               │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  APPROACH 1: Native PDF Support (Claude)                    │
│  ─────────────────────────────────────                      │
│  Upload PDF directly, AI reads the content                  │
│  Best for: Text-heavy documents                             │
│                                                             │
│  APPROACH 2: Convert to Images                              │
│  ───────────────────────────────                            │
│  Convert each page to image, send as multimodal            │
│  Best for: Documents with complex layouts, forms            │
│                                                             │
│  APPROACH 3: OCR + Text Extraction                          │
│  ──────────────────────────────                             │
│  Use OCR tool first, send extracted text to AI             │
│  Best for: High volume, cost-sensitive applications        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Structured Data Extraction

```python
# Extract structured data from a document image
prompt = """
Look at this invoice image and extract the following
information as JSON:

{
  "vendor_name": "",
  "invoice_number": "",
  "invoice_date": "",
  "due_date": "",
  "line_items": [
    {"description": "", "quantity": 0, "unit_price": 0, "total": 0}
  ],
  "subtotal": 0,
  "tax": 0,
  "total": 0
}

If any field is not visible, use null.
"""
```

---

## Multimodal Limitations

### What AI Can't Do (Yet)

```
┌─────────────────────────────────────────────────────────────┐
│ CURRENT LIMITATIONS                                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ✗ Count objects precisely (often off by a few)            │
│  ✗ Read very small text reliably                           │
│  ✗ Understand spatial relationships precisely               │
│  ✗ Process real-time video                                  │
│  ✗ Recognize specific people reliably                      │
│  ✗ Handle very large images (resolution limits)            │
│  ✗ Process multiple images in complex comparisons          │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Handling Limitations

```
Strategy 1: EXPLICIT REQUESTS
"I know it's hard to count, but approximately how many
items are in this image? A rough range is fine."

Strategy 2: ZOOM AND FOCUS
Instead of one large image, send cropped sections for
the areas that need detailed analysis.

Strategy 3: COMBINE WITH SPECIALIZED TOOLS
Use purpose-built OCR for text extraction, then send
the text to AI for understanding and analysis.
```

---

## Cost Considerations

### Image Token Costs

```
┌─────────────────────────────────────────────────────────────┐
│ IMAGE COSTS (Approximate)                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Image Size      Tokens (Approx)    Cost (GPT-4o)          │
│  ──────────      ───────────────    ────────────           │
│  512x512         ~85 tokens         ~$0.0002               │
│  1024x1024       ~170 tokens        ~$0.0004               │
│  2048x2048       ~680 tokens        ~$0.0017               │
│  High-res mode   Up to ~1,700       ~$0.0043               │
│                                                             │
│  Note: Costs vary by provider. Claude uses similar         │
│  token-based pricing for images.                           │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Cost Optimization

1. **Resize images** before sending (don't send 4K when 1024px works)
2. **Crop to relevant areas** (don't send full screen when you need one section)
3. **Use low-res mode** when detail isn't critical
4. **Batch processing** where possible

---

## Building Multimodal Features

### Architecture Pattern

```
┌─────────────────────────────────────────────────────────────┐
│ MULTIMODAL FEATURE ARCHITECTURE                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  USER UPLOAD                                                │
│       │                                                     │
│       ▼                                                     │
│  ┌──────────────┐                                          │
│  │ Validation   │ → Check file type, size, safety          │
│  └──────┬───────┘                                          │
│         │                                                   │
│         ▼                                                   │
│  ┌──────────────┐                                          │
│  │ Preprocessing│ → Resize, convert, optimize              │
│  └──────┬───────┘                                          │
│         │                                                   │
│         ▼                                                   │
│  ┌──────────────┐                                          │
│  │ AI Analysis  │ → Send to multimodal model               │
│  └──────┬───────┘                                          │
│         │                                                   │
│         ▼                                                   │
│  ┌──────────────┐                                          │
│  │ Post-process │ → Validate output, handle errors         │
│  └──────┬───────┘                                          │
│         │                                                   │
│         ▼                                                   │
│  RETURN RESULT                                              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Things to Remember

1. **Vision opens new possibilities** : Receipts, documents, UIs, charts
2. **Context matters even more** : Tell AI what the image is and what you need
3. **Combine with text instructions** : Multimodal = image + smart prompting
4. **Mind the limitations** : Counting, small text, precise spatial reasoning
5. **Optimize for cost** : Resize and crop before sending

---

## Practice Exercise

Design a multimodal feature for this scenario:

**Product:** A competitive intelligence tool for PMs
**Feature:** "Screenshot Analyzer"

**User flow:**
1. PM uploads screenshot of competitor's pricing page
2. AI extracts and structures the information
3. AI compares to our pricing (from database)
4. AI generates competitive analysis

**Design the prompts:**

```
Step 1 Prompt (Extraction):
_______________________________________________
_______________________________________________

Step 2 Prompt (Comparison):
_______________________________________________
_______________________________________________

Step 3 Prompt (Analysis):
_______________________________________________
_______________________________________________
```

---

**Next Module:** [../03-AI-Agents/00-Index.md](../03-AI-Agents/00-Index.md) : AI Agents and Autonomous Systems
