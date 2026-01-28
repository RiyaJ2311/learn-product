# Working Backwards

**Framework:** Ian McAllister (Amazon PR/FAQ method)

**Core Principle:** Start with the press release, then work backwards to the solution.

---

## The Problem

Most PMs start with a solution and work forward. This leads to:
- Building features that don't solve real problems
- Missing the customer experience
- Optimizing the wrong things

**Bad Pattern:**
> "We should build a feature that does X. Here's how it works..."

**Good Pattern:**
> "Imagine a customer experiencing Y. Here's what that looks like. Now, how do we make that happen?"

---

## The Framework

### Step 1: Write the Press Release
Start with the customer experience:
- What does the customer experience?
- What problem does this solve?
- Why does this matter?

**Format:** Write a press release as if the feature already exists.

### Step 2: Write the FAQ
Anticipate questions:
- What questions would customers have?
- What questions would stakeholders have?
- What questions would you have?

**Format:** Write FAQs that answer potential questions.

### Step 3: Work Backwards
From the press release and FAQ, work backwards:
- What needs to be true for this to exist?
- What are the requirements?
- What's the solution?

### Step 4: Build the Solution
Now that you know what needs to be true:
- Design the solution
- Build the feature
- Measure the outcome

---

## Press Release Template

**Headline:** [What's the headline?]

**Subheadline:** [What's the subheadline?]

**Opening Paragraph:**
> [Who is this for?] can now [what can they do?]. This solves [what problem?] by [how?].

**Problem:**
> [What problem does this solve?] Currently, [what's the current state?]. This causes [what pain?].

**Solution:**
> [What's the solution?] Now, [what can customers do?]. This means [what's the benefit?].

**Quote:**
> "[Customer quote about the value]"

**How to Get Started:**
> [How do customers get started?]

---

## FAQ Template

**Customer Questions:**
- Q: [What would customers ask?]
- A: [Answer]

**Stakeholder Questions:**
- Q: [What would stakeholders ask?]
- A: [Answer]

**Technical Questions:**
- Q: [What would engineers ask?]
- A: [Answer]

---

## Examples

### Example 1: Feature Launch

**Press Release:**

**Headline:** "New Feature Helps Users Find What They Need Faster"

**Subheadline:** "Improved search reduces time to value by 50%"

**Opening Paragraph:**
> Users can now find what they need 50% faster with our improved search. This solves the problem of users not finding relevant content by using AI-powered ranking.

**Problem:**
> Users spend 10 minutes searching for content, but only find what they need 30% of the time. This causes frustration and reduces engagement.

**Solution:**
> Now, users can search and find relevant content in 5 minutes with 80% success rate. This means users get value faster and stay engaged longer.

**Quote:**
> "I used to spend forever searching. Now I find what I need immediately." - Beta User

**How to Get Started:**
> Search is available now. Just type your query and see improved results.

**FAQ:**
- Q: How does this work?
- A: We use AI to rank results based on relevance and user behavior.

- Q: What if I don't like the results?
- A: You can still use filters and sorting to refine results.

**Working Backwards:**
- Need: AI-powered ranking
- Need: User behavior data
- Need: Relevance algorithm
- Solution: Build AI ranking system

---

### Example 2: Product Improvement

**Press Release:**

**Headline:** "New Onboarding Flow Gets Users to Value in 1 Day"

**Subheadline:** "Reduced time to value from 3 days to 1 day"

**Opening Paragraph:**
> New users can now get to value in 1 day instead of 3 days with our improved onboarding. This solves the problem of users not understanding how to use the product by providing guided setup.

**Problem:**
> New users take 3 days to get value, and 40% drop off during onboarding. This causes low activation and retention.

**Solution:**
> Now, new users complete guided setup in 1 day and 70% get to value. This means higher activation and retention.

**Working Backwards:**
- Need: Guided setup flow
- Need: Progress tracking
- Need: Value milestones
- Solution: Build guided onboarding

---

## Practice Questions

Before building anything, ask:
- [ ] What does the customer actually experience?
- [ ] What problem does this solve?
- [ ] Have I written the press release?
- [ ] Have I worked backwards from the customer?

---

## Common Mistakes

### Mistake 1: Starting with Solution
**Problem:** "We should build X" without understanding the problem.
**Fix:** Start with the press release. What does the customer experience?

### Mistake 2: Vague Press Release
**Problem:** Press release doesn't clearly describe the experience.
**Fix:** Be specific. What exactly does the customer experience?

### Mistake 3: Not Working Backwards
**Problem:** Writing press release but then building something else.
**Fix:** Actually work backwards. What needs to be true?

### Mistake 4: Skipping FAQ
**Problem:** Not anticipating questions.
**Fix:** Write FAQs. They reveal assumptions and gaps.

---

## Building the Habit

### Week 1: Awareness
- Before building anything, ask: "What does the customer experience?"
- Write press release for your next feature
- Note when you're starting with solution

### Week 2: Practice
- Force yourself to write press release before every feature
- Write FAQs
- Work backwards to solution
- Self-grade: Did I start with the customer?

### Week 3: Refinement
- Make it automatic
- Build press release into your process
- Continue self-grading

---

## Advanced: Multi-Stakeholder Press Releases

For complex products, write press releases for different stakeholders:

**Customer Press Release:**
- What does the customer experience?

**Internal Press Release:**
- What does the team experience?

**Partner Press Release:**
- What do partners experience?

**Then:** Work backwards from all perspectives.

---

## Next Steps

1. **Practice today:** Write press release for your next feature
2. **Self-grade:** After each PRD
3. **Move to:** `02-Outside-In-Thinking.md` to verify problems exist

---

**Remember:** Start with the customer experience, then work backwards.
