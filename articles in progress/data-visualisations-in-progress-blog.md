# From Designer to Dashboard Builder: What I Learned About Data Visualization

Ever since I started working, I've been in B2B Martech companies. Both of them. Which means I've spent years designing dashboards filled with analytics, metrics, and graphs because that's what marketing teams live and breathe.

But here's the thing: I wasn't always sure what I was doing or why. I just designed what my seniors told me to design and called it a day.

## The Journey from "Just Design It" to Actually Understanding It

When I started as a product designer, my approach to graphs was simple. Senior says use a bar chart? Cool, bar chart it is. They want a line chart? Done. But as I moved into product management and started tracking user analytics myself, I realized something important: there are wildly different types of analytics, and each one needs a different approach.

I was already designing for marketing analytics, but then I needed product analytics for user behavior. Then operational dashboards for the team. Then I discovered business intelligence dashboards that executives were looking at. Each one had a completely different purpose, different questions to answer, and different people using them daily.

## What Different Teams Actually Need

### Marketing Analytics
When I designed for marketers, their vibe was all about speed and comparison. They wanted:
- Channel-based performance at a glance
- Trendlines showing what's moving
- Funnels for acquisition tracking
- Cohort analysis
- Geo breakdowns

Fast scanning, strong highlights, minimal thinking.

### Product Analytics
Then I became a product manager, and everything shifted. I started looking at KPIs as absolute numbers first. Big, bold, on top. Is the number good or bad? That's what I needed to know in 5 seconds.

Then I added line charts to see trends. Not long-term trends, just short bursts like the last week or two weeks. Then came:
- Funnels to understand the user journey
- Adoption metrics for features we shipped
- Long-term retention to see if we're actually keeping users
- Segmentation by user type, device, or behavior

The questions changed from "which channel is winning?" to "are users actually using what we built?"

### Operational Dashboards
Here's where it got interesting. We were doing manual activations for customers to help close deals, and we realized some people had paid but we hadn't activated their accounts yet. Oops.

So we needed ops dashboards. Tables seemed like the obvious choice, but what if there are 50 rows and only 3 actually need action? I needed a quick view, something I could scan like I scan my email. That's when I learned operational dashboards are less about pretty charts and more about "what do I need to do right now?"

## The Three Questions Framework

Most dashboards only answer one question: **What is happening?** (Current state)

Great dashboards guide you through all three:
1. **What is happening?** (Current state)
2. **Why is it happening?** (Root cause)
3. **What should we do about it?** (Action)

If your dashboard can't help someone make a decision, it's just decoration.

## Choosing the Right Graph: A Quick Reference

Before you pick a chart type, ask yourself: **What question am I helping someone answer?**

| Graph Type | Best For | Questions It Answers | Key Characteristics | What to Avoid |
|------------|----------|---------------------|---------------------|---------------|
| **Bar Chart** | Comparing categories | Which is biggest? How do groups compare? | Bars start at zero; horizontal or vertical | ❌ Bars not starting at zero<br>❌ Too many bars<br>❌ Poor ordering |
| **Line Chart** | Change over time | Is it growing? What's the trend? When did change happen? | Connected points; continuous x-axis | ❌ Dual y-axes<br>❌ Truncated axes<br>❌ Too many lines |
| **Pie Chart** | Part-to-whole (simple) | What proportion is each part? | Slices sum to 100%; best with 2-5 slices | ❌ Too many slices<br>❌ 3D effects<br>❌ Similar-sized slices |
| **Scatter Plot** | Correlation between variables | Is there a relationship? Are there outliers? | Each point = one observation; two axes | ❌ Overplotting<br>❌ No trendline when needed |
| **Area Chart** | Volume over time | How has total changed? How do parts contribute? | Filled space below line; stacked or overlapping | ❌ Overlapping areas hiding data<br>❌ Too many series |
| **Histogram** | Distribution | What's the shape? Where's the center? How spread? | Bars touch; x-axis is continuous | ❌ Confusing with bar chart<br>❌ Wrong bin sizes |

## What I'm Still Learning

Data visualization isn't just about making things look good. It's about making the right information visible to the right person at the right time. And honestly, I'm still figuring it out as I go. Each new dashboard teaches me something about what people actually need versus what I think they need.

The biggest lesson? Talk to the people who'll use your dashboard. Ask them what decisions they're trying to make. Then design for that, not for what looks impressive in a portfolio.

---

*More case studies coming with snail's pace :p*
