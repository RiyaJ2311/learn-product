# Comprehensive Portfolio Audit Skill

A reusable skill that runs 7 parallel specialized agents to comprehensively audit your portfolio across multiple dimensions.

## What This Skill Does

Executes a comprehensive audit workflow that analyzes:

1. **Readability & Usability** - Typography, content scannability, language clarity
2. **Ownership & Branding** - Personal brand consistency, attribution, credibility
3. **Storytelling & Content** - Narrative structure, emotional engagement, content flow
4. **UI Design** - Visual consistency, design system adherence, polish
5. **UX (User Experience)** - Navigation, interactions, user flows, friction points
6. **SEO** - Meta tags, structured data, technical SEO, search visibility
7. **Accessibility** - WCAG 2.1 AA compliance, ARIA, keyboard navigation

## How to Use

Simply say:
- "Run comprehensive audit"
- "Audit the portfolio"
- "Check all issues"

Claude will automatically:
1. Capture baseline screenshots (42 images)
2. Launch 7 parallel audit agents
3. Compare before/after screenshots
4. Generate comprehensive documentation
5. Update CLAUDE.md with findings

## Output

You'll receive:
- **7 detailed audit reports** (one per dimension)
- **Aggregated scores** for each area
- **Prioritized fix list** (Critical → High → Medium → Low)
- **Implementation roadmap** with time estimates
- **Before/after screenshots** for visual regression testing

## Execution Time

- **Parallel execution**: ~45 minutes
- **Sequential execution**: ~5 hours
- All agents run simultaneously for efficiency

## What Gets Audited

### Pages (22 total)
- 3 main pages (index, about-me, ux-bites)
- 7 case study pages
- 6 UX bites detail pages
- 1 side project page
- 1 error page (404)

### Breakpoints (Screenshots)
- Desktop: 1920×1080
- Tablet: 768×1024
- Mobile: 375×667
- Both light and dark themes

## Audit Methodology

Each agent:
- ✅ Explores the entire codebase
- ✅ Reads all relevant HTML, CSS, JS files
- ✅ Analyzes design system compliance
- ✅ Generates detailed reports with examples
- ✅ Provides actionable recommendations
- ✅ Assigns severity levels to issues

## Example Output

```
## Comprehensive 7-Agent Audit - January 28, 2026

### Audit Results Summary

| Focus Area | Score | Grade | Critical | High Priority |
|------------|-------|-------|----------|---------------|
| Readability & Usability | 85/100 | B+ | 2 | 7 |
| Ownership & Branding | 88/100 | B+ | 0 | 0 |
| Storytelling & Content | 73/100 | C+ | 5 | 10 |
| UI Design | 68/100 | C+ | 2 | 5 |
| UX (User Experience) | 82/100 | B | 3 | 6 |
| SEO | 85/100 | B+ | 2 | 0 |
| Accessibility (A11y) | 98/100 | A+ | 0 | 0 |

**Overall Portfolio Health: 83/100**
```

## Prerequisites

- `scripts/capture-screenshots.js` must exist
- Playwright must be installed (`npm install playwright`)
- Python 3 for local server

## Customization

To audit additional pages, edit:
- `prompts/00-capture-baseline.md` - Add pages to screenshot list
- Each audit prompt - Add page patterns to audit scope

## Re-running the Audit

This skill can be run:
- After implementing fixes (to measure improvement)
- Every 3-6 months (to catch regressions)
- Before major releases (to ensure quality)
- When onboarding new team members (to document standards)

## Files Created

After running this skill, you'll have:

```
audit-results/
├── baseline-screenshots/          # 42 screenshots before changes
├── final-screenshots/             # 42 screenshots after changes
├── readability-usability-audit.md
├── ownership-branding-audit.md
├── storytelling-content-audit.md
├── ui-design-audit.md
├── ux-audit.md
├── seo-audit.md
└── accessibility-audit.md
```

Plus updated `CLAUDE.md` with comprehensive findings.

## Version History

- **v1.0.0** (Jan 28, 2026) - Initial release with 7 parallel agents

---

*Created by Riya Jawandhiya with Claude Sonnet 4.5*
