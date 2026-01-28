# UX Audit Prompt

A comprehensive prompt for conducting thorough UX audits of any digital product.

## Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `{{PRODUCT_NAME}}` | Name of the product being audited | "Acme Dashboard" |
| `{{PRODUCT_URL_OR_SCREENSHOTS}}` | URL to access the product or uploaded screenshots | "https://app.acme.com" |
| `{{SPECIFIC_FOCUS_AREA}}` | Area to focus on, or "complete audit" | "Checkout flow" or "complete audit" |

---

## Prompt

```
You will be conducting an extremely comprehensive UX audit of a product. Your goal is to systematically evaluate the product using a detailed framework, identify issues with specific severity levels, and provide actionable recommendations with clear documentation.

Here is the product you'll be analyzing:

<product_name>
{{PRODUCT_NAME}}
</product_name>

Here is the product URL or screenshots to analyze:

<product_access>
{{PRODUCT_URL_OR_SCREENSHOTS}}
</product_access>

Here is the specific focus area for this audit (or "complete audit" if analyzing everything):

<focus_area>
{{SPECIFIC_FOCUS_AREA}}
</focus_area>

## Your Audit Framework

You will analyze this product using a comprehensive, multi-layered approach that examines:

1. **The 8-Step UX Analysis Framework** (high-level strategic analysis)
2. **Component-Level Audit** (detailed UI element analysis)
3. **Interaction Pattern Analysis** (how things behave)
4. **Accessibility Compliance** (WCAG standards)
5. **Consistency Matrix** (cross-product patterns)

## Documentation Standards

As you conduct your audit, note what evidence you would capture:

**📸 Indicate "Screenshot Needed"** for:
- Static UI states (buttons, forms, layouts)
- Error states, empty states, success states
- Before/after comparisons
- Spacing and alignment issues
- Color contrast problems
- Typography inconsistencies

**🎥 Indicate "Video Needed"** for:
- Interactions (hover, click, drag)
- Animations and transitions
- Loading sequences
- Multi-step flows
- Keyboard navigation
- Screen reader behavior

**📝 Indicate "Documentation Needed"** for:
- User flow steps
- Consistency matrices
- Severity calculations
- Alternative solutions

## Comprehensive Audit Checklist

Work through these systematically:

### A. Page-Level Analysis

**Visual Hierarchy:**
- Can you identify the primary action in 2 seconds?
- Does the squint test work? (blur and check if hierarchy holds)
- Are headings sized appropriately? (H1 > H2 > H3)
- Is visual weight distributed correctly?

**Layout & Structure:**
- Is spacing consistent? (measure padding/margins)
- Are elements aligned to a grid?
- Is whitespace used effectively?
- Are touch targets 44×44px minimum?
- Is text line length 50-75 characters?
- Does layout follow F-pattern (content) or Z-pattern (landing)?

**Navigation:**
- Is navigation findable and predictable?
- Are breadcrumbs present for nested pages?
- Is the active page clearly indicated?
- Can users complete tasks in ≤3 clicks?

### B. Component-Level Analysis

**Buttons:**
- Check ALL states: default, hover, active, disabled, loading
- Are primary/secondary/tertiary buttons visually distinct?
- Are labels action-oriented and specific? ("Send Campaign" not "Submit")
- Is destructive action styling different? (red, requires confirmation)
- Are icons + text used appropriately?

**Icons:**
- Are all icons from the same family/style?
- Is stroke weight consistent?
- Are ambiguous icons labeled? (⋮, ✎, ↗, ⓘ always need labels)
- Do icons meet 3:1 contrast ratio?
- Are status icons color-coded correctly? (green=success, red=error, yellow=warning)

**Dropdowns & Selects:**
- Does trigger look clickable? (down arrow visible)
- Does expanded state have max-height with scroll?
- Are options scannable? (36-44px height)
- Is hover state distinct from selected state?
- Does keyboard navigation work? (arrow keys, Enter, Escape)
- Are there search/filter options for long lists?

**Form Fields:**
- Are labels above fields (not as placeholders)?
- Are required fields marked clearly?
- Do all fields have focus, error, success, disabled states?
- Are error messages specific? ("Email must include @" not "Invalid")
- Is validation timing appropriate? (after blur, not every keystroke)
- Are format hints provided? ("(555) 123-4567")
- Is there auto-save for long forms?

**Tables:**
- Are columns sortable with clear indicators? (↑ ↓)
- Are numbers right-aligned, text left-aligned?
- Is there pagination or infinite scroll?
- Are search and filters available?
- Do empty/loading/no-results states exist?
- Can users select rows and perform bulk actions?

**Cards:**
- Is padding consistent? (16-24px)
- Is information hierarchy clear? (title > body > actions)
- Are interactive cards obviously clickable?
- Do cards have proper hover states?
- Are card heights consistent or gracefully variable?

**Modals:**
- Is there a dark overlay? (40-60% opacity)
- Can users close via X, Cancel, Escape, or overlay click?
- Does focus trap inside modal?
- Does focus return to trigger on close?
- Is the modal centered and responsive?
- Are confirmation modals clear about consequences?

### C. Interaction Patterns

**Hover States:**
- Are transitions smooth? (150-300ms)
- Is timing consistent across all elements?
- Do all interactive elements have hover feedback?

**Click/Tap Interactions:**
- Is feedback immediate? (<100ms)
- Are loading states shown for slow actions?
- Is double-click prevented?
- Are touch targets adequate? (44×44px)

**Animations:**
- Do animations have clear purpose?
- Are timings appropriate? (micro: 100-200ms, transitions: 200-300ms)
- Is `prefers-reduced-motion` respected?
- Are easing functions smooth? (ease-in-out)

**Keyboard Navigation:**
- Is tab order logical?
- Are all interactive elements reachable?
- Is focus indicator always visible? (2px minimum)
- Do modals trap focus appropriately?
- Does Escape close modals/dropdowns?

### D. Content & Copy

**Microcopy:**
- Are button labels action-oriented and specific?
- Is terminology consistent? ("Delete" everywhere, not "Remove" sometimes)
- Are placeholder texts helpful? (show format examples)
- Are error messages constructive? (what happened + why + how to fix)

**Empty States:**
- Do they explain why it's empty?
- Do they provide clear action to add first item?
- Do they use appropriate illustration/icon?

**Help Text:**
- Are tooltips used for icon-only buttons?
- Is inline help text provided for complex fields?
- Are format requirements stated clearly?

**Tone & Voice:**
- Is tone consistent across all copy?
- Is it appropriate for context? (serious for delete, encouraging for onboarding)

### E. User Flows

For each major flow, document:
- **Entry point:** Where does the flow start?
- **Steps:** List each screen/action
- **Friction points:** Where do users get stuck?
- **Time:** How long does it take?
- **Success rate:** Can users complete without help?

Key flows to analyze:
- Onboarding (first-time user experience)
- Core task completion (main product function)
- Search and discovery
- Form submission
- Error recovery

### F. Accessibility

**Keyboard Navigation:**
- Navigate entire product with keyboard only
- Check tab order is logical
- Verify focus indicators are visible
- Test that no keyboard traps exist

**Screen Reader:**
- Test with VoiceOver (Mac) or NVDA (Windows)
- Verify all images have alt text
- Check that form labels are announced
- Ensure error messages are announced
- Verify dynamic content updates are announced (aria-live)

**Color Contrast:**
- Normal text: 4.5:1 minimum
- Large text (18px+): 3:1 minimum
- UI components: 3:1 minimum
- Don't rely on color alone

**Zoom & Resize:**
- Test at 200% zoom
- Verify no horizontal scrolling
- Check that layout doesn't break

### G. Performance

**Loading:**
- Are Core Web Vitals met? (LCP <2.5s, FID <100ms, CLS <0.1)
- Are skeleton loaders used?
- Do images lazy load?
- Is there progressive loading?

**Error Handling:**
- Are network errors handled gracefully?
- Is there offline support or messaging?
- Can users retry failed actions?
- Is user data preserved during errors?

### H. Consistency

Create a matrix checking:
- Button styles across pages
- Form patterns across features
- Navigation placement
- Terminology usage
- Spacing systems
- Color usage
- Icon styles
- Interaction patterns

## Severity Framework

Rate each issue using this system:

**🔴 Critical (P0):** Blocks core tasks, causes data loss, affects all users, no workaround
- Fix: Immediately

**🟠 High (P1):** Significant friction, frequent errors, affects many users, difficult workaround
- Fix: This sprint (1-2 weeks)

**🟡 Medium (P2):** Creates friction but has workaround, inconsistency causes confusion
- Fix: Next sprint (2-4 weeks)

**🟢 Low (P3):** Polish issues, minor inconsistencies, affects few users
- Fix: Backlog

**💡 Enhancement (P4):** Nice to have, opportunity for delight, not a problem
- Fix: Future consideration

Calculate severity: **Frequency × Impact × Visibility**

## Analysis Process

Use <scratchpad> tags to work through your analysis:

1. **Initial observations:** What stands out immediately?
2. **Systematic walkthrough:** Go through each checklist section
3. **Pattern identification:** What issues repeat across the product?
4. **Severity assessment:** Rate each issue
5. **Solution brainstorming:** What are the fix options?
6. **Prioritization:** What should be fixed first and why?

## Output Format

After your scratchpad analysis, provide your final audit report in this markdown structure:

<audit_report>

# UX Audit Report: [Product Name]

## Executive Summary

**Overall Assessment:** [Good/Needs Improvement/Critical Issues]

**Key Findings:**
- 🔴 [X] Critical issues
- 🟠 [X] High priority issues
- 🟡 [X] Medium priority issues
- 🟢 [X] Low priority issues
- 💡 [X] Enhancement opportunities

**Top 3 Priority Fixes:**
1. [Issue] - [Why it matters]
2. [Issue] - [Why it matters]
3. [Issue] - [Why it matters]

---

## Detailed Findings

### Issue #1: [Clear, Specific Title]

**Severity:** [🔴/🟠/🟡/🟢/💡]
**Category:** [Navigation/Forms/Buttons/Content/etc.]
**Affects:** [All users/Mobile users/First-time users/etc.]

**Problem Description:**
[Clear description of what's wrong]

**Evidence Needed:**
[📸 Screenshot of: specific state to capture]
[🎥 Video of: specific interaction to record]

**User Impact:**
- [Specific way this affects users]
- [Quantify if possible: "Adds 3 extra clicks" or "Causes confusion 60% of time"]

**Why This Matters:**
[Business impact and user experience impact]

**Recommended Solutions:**

**Option 1: Quick Fix**
- What to change: [Specific changes]
- Effort: [Hours/Days]
- Impact: [Reduces issue by X%]

**Option 2: Better Fix**
- What to change: [Specific changes]
- Effort: [Hours/Days]
- Impact: [Solves completely]

**Example/Reference:**
[Description of good example or what the solution should look like]

---

[Repeat for each significant issue]

---

## Systemic Patterns

### Pattern #1: [Issue that appears in multiple places]

**Locations Affected:**
- [Location A]
- [Location B]
- [Location C]

**Root Cause:**
[Why this pattern exists]

**Systemic Fix:**
[How to fix once and prevent future occurrences]

---

## Consistency Issues

[Create a table showing inconsistencies]

| Element | Location A | Location B | Location C | Consistent? | Fix Needed |
|---------|-----------|-----------|-----------|-------------|------------|
| Primary Button | [Description] | [Description] | [Description] | ❌ | [Fix] |
| Delete Action | [Description] | [Description] | [Description] | ❌ | [Fix] |

---

## Accessibility Findings

**Keyboard Navigation:**
- [Issues found]

**Screen Reader:**
- [Issues found]

**Color Contrast:**
- [Issues found]

**WCAG Compliance:**
- Level A: [Pass/Fail with details]
- Level AA: [Pass/Fail with details]

---

## Positive Findings

**What's Working Well:**
- [Good pattern or feature]
- [Another well-executed element]
- [User-friendly aspect]

[Important to acknowledge what should be preserved]

---

## Prioritized Recommendations

### 🔴 Critical - Fix Immediately
- [ ] [Issue] - [One-line fix summary]
- [ ] [Issue] - [One-line fix summary]

### 🟠 High Priority - This Sprint
- [ ] [Issue] - [One-line fix summary]
- [ ] [Issue] - [One-line fix summary]

### 🟡 Medium Priority - Next Sprint
- [ ] [Issue] - [One-line fix summary]
- [ ] [Issue] - [One-line fix summary]

### 🟢 Low Priority - Backlog
- [ ] [Issue] - [One-line fix summary]

### 💡 Future Enhancements
- [ ] [Enhancement] - [Description]

---

## User Flow Analysis

### Flow: [Flow Name]

**Steps:**
1. [Step with time estimate]
2. [Step with time estimate]
3. [Step with time estimate]

**Total Time:** [X seconds/minutes]
**Friction Points:** [X points identified]
**Success Rate:** [Estimated or tested]

**Key Issues:**
- [Issue affecting this flow]
- [Another issue]

**Recommendations:**
- [Specific improvement]

---

## Testing Recommendations

**User Testing:**
- Test [specific flow] with [number] users
- Focus on [area of concern]
- Metrics: [success rate, time on task, error rate]

**A/B Testing:**
- Test [variation A] vs [variation B]
- Hypothesis: [Expected outcome]
- Success metric: [What indicates success]

**Technical Testing:**
- Performance testing on [pages]
- Accessibility audit with [tool/screen reader]
- Cross-browser testing: [browsers]

---

## Appendix

### Methodology
- Audit conducted: [Date]
- Tools used: [List tools]
- Scope: [What was covered]

### Evidence Documentation
- Screenshots needed: [Count and types]
- Videos needed: [Count and types]
- All evidence should be organized in folders by category

### References
- WCAG 2.1 Guidelines
- [Product's design system if exists]
- [Any user research referenced]

</audit_report>

## Important Guidelines

**Be Specific:**
- Don't say "button styling is inconsistent"
- Say "Primary button is 40px on Dashboard but 36px on Settings page, and uses rounded corners on Dashboard but square corners on Settings"

**Be Actionable:**
- Don't say "improve the form"
- Say "Add inline validation that appears after blur, showing specific error messages like 'Email must include @' instead of generic 'Invalid input'"

**Provide Context:**
- Explain WHY each issue matters
- Connect issues to user impact and business goals
- Quantify when possible ("adds 3 extra clicks", "increases task time by 40%")

**Show Examples:**
- Reference good patterns from other products
- Describe what the solution should look like
- Provide before/after scenarios

**Document Evidence:**
- Specify exactly what screenshots are needed
- Specify exactly what videos should capture
- Make it easy for someone to gather the evidence

**Consider Constraints:**
- Offer quick fixes AND better long-term solutions
- Estimate effort realistically
- Prioritize based on impact, not just severity

## Final Output Requirements

Your final audit report should:

1. ✅ Be in clean markdown format (no scratchpad content)
2. ✅ Include severity ratings for all issues
3. ✅ Specify evidence needed (screenshots/videos) for each finding
4. ✅ Provide specific, actionable recommendations
5. ✅ Include both quick fixes and better long-term solutions
6. ✅ Organize findings by priority
7. ✅ Identify systemic patterns, not just individual issues
8. ✅ Acknowledge what's working well
9. ✅ Be comprehensive yet scannable (use tables, bullets, clear headers)
10. ✅ Connect findings to user impact and business value

Remember: This audit should be so thorough and clear that a designer or developer can immediately understand what needs to be fixed, why it matters, and how to fix it, with all the evidence they need to document the current state and validate the improvements.
```

---

## Enhancements Added

The following improvements have been made to strengthen the original prompt:

### 1. Mobile-Specific Checklist (New Section)

Add after Section H:

```
### I. Mobile & Responsive Design

**Responsive Behavior:**
- Does the layout adapt gracefully at breakpoints? (320px, 768px, 1024px, 1440px)
- Are there any horizontal overflow issues?
- Do images scale appropriately?
- Is text readable without zooming?

**Touch Interactions:**
- Are all touch targets minimum 44×44px with adequate spacing?
- Are swipe gestures discoverable?
- Is there haptic feedback for key actions?
- Are bottom sheets used instead of dropdowns on mobile?

**Mobile Navigation:**
- Is navigation accessible via hamburger or bottom nav?
- Are key actions reachable with one thumb?
- Is the back button behavior predictable?

**Mobile-Specific States:**
- Are loading states optimized for slower connections?
- Is there offline handling/messaging?
- Are forms optimized for mobile keyboards?
```

### 2. Cognitive Load Assessment (New Section)

```
### J. Cognitive Load Assessment

**Information Density:**
- Is information chunked into digestible sections?
- Are there more than 7±2 items in any list/menu?
- Is progressive disclosure used for complex features?

**Decision Fatigue:**
- Are users presented with too many choices at once?
- Are defaults provided for common scenarios?
- Is the "happy path" clearly highlighted?

**Memory Load:**
- Can users complete tasks without remembering info from previous screens?
- Is important information visible, not hidden?
- Are comparisons easy to make?
```

### 3. Competitive Benchmarking Section

Add to output format:

```
## Competitive Benchmarking

| Feature/Pattern | This Product | Competitor A | Competitor B | Industry Best |
|-----------------|--------------|--------------|--------------|---------------|
| [Feature 1] | [Rating/Description] | [Rating] | [Rating] | [Example] |
| [Feature 2] | [Rating/Description] | [Rating] | [Rating] | [Example] |

**Key Gaps:**
- [Where this product falls behind]

**Competitive Advantages:**
- [Where this product excels]
```

### 4. Quick-Start Version

For faster audits, use this condensed checklist:

```
## Quick Audit Checklist (15-minute version)

### Must-Check Items
- [ ] Primary action identifiable in 2 seconds
- [ ] All buttons have clear hover/active states
- [ ] Error messages are specific and helpful
- [ ] Forms have proper labels (not placeholder-only)
- [ ] Tab navigation works logically
- [ ] Color contrast passes (4.5:1 for text)
- [ ] Touch targets are 44×44px minimum
- [ ] Loading states exist for async actions
- [ ] Empty states provide guidance
- [ ] Terminology is consistent throughout

### Red Flags to Check
- [ ] No keyboard traps
- [ ] No broken links/buttons
- [ ] No layout shifts during load
- [ ] No mystery meat navigation
- [ ] No reliance on color alone for meaning
```

### 5. Stakeholder Summary Template

```
## Stakeholder Summary (Non-Technical)

**Current State:** [One sentence summary]

**Business Impact:**
- [Issue] is likely causing [X% drop-off / Y support tickets / Z user complaints]
- Fixing [top issue] could improve [metric] by approximately [estimate]

**Investment Required:**
- Quick wins (1-2 days): [List]
- Medium effort (1-2 weeks): [List]
- Larger initiatives (1+ months): [List]

**Recommendation:** [Clear next step in plain language]
```

---

## Strategic Frameworks

These additional frameworks from product leaders add depth to your audit methodology.

### 1. First 5 Minutes Test (Shaun Clowes - "Time to Value")

| What to Observe | Questions to Ask |
|-----------------|------------------|
| **Empty States** | What do I see before any data? Is it helpful or confusing? |
| **Onboarding Flow** | How many steps to first value? Can I skip anything? |
| **Cognitive Load** | Am I overwhelmed with options? Or guided clearly? |
| **Time to Aha** | How long until I think "Oh, this is useful"? |

**Red Flags:**
- Blank dashboards with no guidance
- Required fields that could be deferred
- Multiple decisions before any value

---

### 2. Outside-In Perspective (Shaun Clowes - "80% Rule")

> "You need to spend 80% of your time outside the building to understand what you're building inside"

| Audit Area | What to Look For |
|------------|------------------|
| **As a complete stranger** | Can I understand what this does in 10 seconds? |
| **Value proposition clarity** | Is the benefit obvious, or just features listed? |
| **Trust signals** | Social proof, security badges, testimonials? |
| **Competitive context** | How does this compare to alternatives I might know? |

---

### 3. Answer-First Design (Ian McAllister)

> "Answer the damn question first"

Apply this to UI:
- **Do buttons tell me what happens?** (Not just "Submit" but "Start Free Trial")
- **Do error messages explain the fix?** (Not just "Error" but "Password needs 8 characters")
- **Do empty states tell me what to do?** (Not just "No data" but "Create your first campaign")

---

### 4. Friction Mapping (From PLG Activation Framework)

Walk through as a new user and document:

```
Step 1: Landing → Sign Up
        ↓ Friction points: ___
        ↓ Drop-off risk: ___

Step 2: Sign Up → First Screen
        ↓ Friction points: ___
        ↓ Drop-off risk: ___

Step 3: First Screen → Core Action
        ↓ Friction points: ___
        ↓ Drop-off risk: ___

Step 4: Core Action → Value Moment
        ↓ Friction points: ___
        ↓ Drop-off risk: ___
```

---

### 5. The "Click Left, Right, Up" UX Audit (Shaun Clowes - Triangulation)

For any screen you're on:

| Direction | What to Check |
|-----------|---------------|
| **Click Left (Before)** | How did I get here? Is the navigation clear? Can I go back? |
| **Click Right (After)** | What's the next logical step? Is it obvious? |
| **Click Up (Context)** | Do I know where I am in the overall journey? |

---

### 6. User-Centric Checklist

**Information Architecture:**
- [ ] Can I find what I need in <3 clicks?
- [ ] Is navigation consistent across pages?
- [ ] Are related features grouped logically?

**Visual Hierarchy:**
- [ ] Is the most important action obvious?
- [ ] Are CTAs clearly visible and differentiated?
- [ ] Is there visual breathing room or is it cluttered?

**Feedback & Response:**
- [ ] Do I get confirmation when actions complete?
- [ ] Are loading states clear?
- [ ] Do errors tell me how to fix them?

**Mobile/Responsive:**
- [ ] Does it work on my phone?
- [ ] Are touch targets large enough?
- [ ] Is text readable without zooming?

---

### 7. Quick Wins Identification

After your audit, categorize findings:

```
┌────────────────────────────────────────────┐
│ HIGH IMPACT / LOW EFFORT (Do First)        │
│ - Copy changes, button labels              │
│ - Removing unnecessary steps               │
│ - Adding helpful microcopy                 │
├────────────────────────────────────────────┤
│ HIGH IMPACT / HIGH EFFORT (Plan For)       │
│ - Redesigning onboarding flow              │
│ - New navigation structure                 │
├────────────────────────────────────────────┤
│ LOW IMPACT / LOW EFFORT (Nice to Have)     │
│ - Visual polish                            │
│ - Minor consistency fixes                  │
├────────────────────────────────────────────┤
│ LOW IMPACT / HIGH EFFORT (Skip)            │
│ - Complete redesigns for edge cases        │
└────────────────────────────────────────────┘
```

---

## Usage Tips

1. **For complete audits:** Use the full prompt as-is
2. **For focused audits:** Specify the focus area to narrow the analysis
3. **For quick reviews:** Use the Quick Audit Checklist addition
4. **For stakeholder presentations:** Include the Stakeholder Summary section
5. **For competitive analysis:** Add the Benchmarking section

## Recommended Tools for Evidence Gathering

- **Screenshots:** Cleanshot X, Snagit, or browser DevTools
- **Videos:** Loom, ScreenFlow, or QuickTime
- **Contrast checking:** WebAIM Contrast Checker, Stark
- **Accessibility:** axe DevTools, WAVE, VoiceOver/NVDA
- **Performance:** Lighthouse, WebPageTest
