# Comprehensive Portfolio Audit Skill

A reusable skill that runs 7 parallel specialized agents to comprehensively audit your portfolio across multiple dimensions with **extremely high standards**.

## What This Skill Does

Executes a comprehensive audit workflow that analyzes:

1. **Readability & Usability** - Typography, content scannability, language clarity
2. **Ownership & Branding** - Personal brand consistency, attribution, credibility
3. **Storytelling & Content** - Narrative structure, emotional engagement, content flow
4. **UI Design - 2026 Visual Excellence Standards** ⭐ **ENHANCED**
   - Visual consistency & design system adherence
   - **2026 design trends evaluation**: AI-native patterns, kinetic typography, brutalist minimalism, advanced glassmorphism, bento grids, spatial computing readiness, micro-interaction excellence
   - Pixel-perfect execution benchmarked against **Apple.com, Linear.app, Vercel.com, Stripe.com, Raycast.com**
   - Interaction design quality (hover, focus, active, loading, disabled states)
   - Dark mode excellence
   - **High bar**: Evaluated as if submitting to Awwwards, Dribbble Popular, Behance Editor's Choice
5. **UX - Comprehensive User Experience Deep Dive** ⭐ **ENHANCED**
   - **Cognitive psychology**: Mental models, cognitive load (7±2 rule), recognition vs. recall
   - **Behavioral economics**: Choice architecture, decision fatigue, persuasive design
   - Navigation & information architecture (3-click rule, wayfinding)
   - Interactive elements & affordances (all states, feedback loops)
   - User flows & task completion (4 critical flows mapped and friction-tested)
   - Mobile UX experience (touch targets, thumb zones, gesture support)
   - Emotional design & delight (personality, micro-delights, trust signals)
   - Persuasive design & conversion (CTAs, social proof, behavioral triggers)
   - Error prevention & recovery (validation, helpful messages, 404 quality)
   - Inclusive design principles (keyboard nav, screen reader, cognitive accessibility)
   - **Benchmark**: Linear.app, Stripe.com, Notion.so, Figma.com
6. **SEO** - Meta tags, structured data, technical SEO, search visibility
7. **Accessibility** - WCAG 2.1 AA compliance, ARIA, keyboard navigation

## Key Enhancements

### UI Design Audit Now Includes:
- **2026 Trend Analysis** (20 points): Evaluates against 7 cutting-edge trends
  - AI-Native Interface Patterns
  - Kinetic Typography & Motion Design
  - Brutalist Minimalism
  - Advanced Glassmorphism & Depth
  - Bento Grid Layouts
  - Spatial Computing Readiness
  - Micro-Interaction Excellence
- **Pixel-Perfect Execution** (20 points): Apple/Linear-level precision standards
- **Industry Benchmark Comparison**: Direct comparison to top design leaders
- **Scoring**: 100-point scale with clear grade assignments

### UX Audit Now Includes:
- **Cognitive Load Analysis**: Mental models, decision fatigue, Hick's Law evaluation
- **User Flow Mapping**: 4 critical flows with friction analysis and drop-off risk assessment
- **Emotional Design**: Personality, micro-delights, trust-building evaluation
- **Persuasive Design**: Conversion optimization, behavioral triggers, social proof analysis
- **Persona Impact**: Evaluates experience for different user types (hiring managers, peers, founders)
- **Scoring**: 125-point scale (normalized to 100) across 9 comprehensive dimensions

## How to Use

Simply say:
- "Run comprehensive audit"
- "Audit the portfolio"
- "Check all issues"
- "Analyze portfolio"

Claude will automatically:
1. Capture baseline screenshots (42 images)
2. Launch 7 parallel audit agents
3. Compare before/after screenshots
4. Generate comprehensive documentation
5. Update CLAUDE.md with findings

## Output

You'll receive:
- **7 detailed audit reports** (one per dimension)
  - UI Design report includes 2026 trend scores and industry benchmarks
  - UX report includes cognitive load analysis, user flow maps, and persona assessments
- **Aggregated scores** for each area (with grades: A+, A, B+, B, C+, C, D, F)
- **Prioritized fix list** (Critical → High → Medium → Low)
- **Implementation roadmap** with time estimates and expected impact
- **Before/after screenshots** for visual regression testing
- **Industry benchmark comparison tables**

## Execution Time

- **Parallel execution**: ~45-60 minutes (recommended)
- **Sequential execution**: ~5-6 hours
- All agents run simultaneously for maximum efficiency

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
- **Total**: 42 screenshots per audit run

## Audit Methodology

Each agent:
- ✅ Explores the entire codebase
- ✅ Reads all relevant HTML, CSS, JS files
- ✅ Analyzes design system compliance
- ✅ Benchmarks against industry leaders
- ✅ Evaluates current design trends (2026)
- ✅ Tests user flows and cognitive load
- ✅ Generates detailed reports with specific examples
- ✅ Provides actionable recommendations with effort estimates
- ✅ Assigns severity levels to issues

## Evaluation Standards

### UI Design Standards
- **Benchmarked against**: Apple.com (10/10), Linear.app (10/10), Vercel.com (9/10), Stripe.com (9/10), Raycast.com (10/10)
- **Target**: Awwwards Site of the Day quality
- **Scoring**: 100-point scale across 6 categories
- **High bar**: Every pixel intentional, obsessive attention to detail

### UX Standards
- **Benchmarked against**: Linear.app, Stripe.com, Notion.so, Figma.com (UX leaders)
- **Methodologies**: Cognitive psychology, behavioral economics, interaction design principles
- **Scoring**: 125-point scale (normalized to 100) across 9 dimensions
- **Focus**: User success, not just usability

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

### Industry Benchmark Gaps

**UI Design vs. Apple.com**: -32 points
**UX vs. Linear.app**: -18 points

### Implementation ROI
After Phase 1-3 fixes:
- Expected overall score: 83 → 93 (+10 points)
- UI Design: 68 → 85 (+17 points)
- UX: 82 → 92 (+10 points)
- Storytelling: 73 → 95 (+22 points)
```

## Prerequisites

- `scripts/capture-screenshots.js` must exist
- Playwright must be installed (`npm install playwright`)
- Python 3 for local server (for baseline capture)
- Design system documented at `.claude/rules/design-system.md`

## Customization

To audit additional pages, edit:
- `prompts/00-capture-baseline.md` - Add pages to screenshot list
- Each audit prompt - Add page patterns to audit scope

To adjust evaluation standards:
- `prompts/04-ui-audit.md` - Modify trend criteria or benchmarks
- `prompts/05-ux-audit.md` - Adjust scoring weights or flow definitions

## Re-running the Audit

This skill can be run:
- **After implementing fixes** (to measure improvement and validate changes)
- **Every 3-6 months** (to catch regressions and stay current with trends)
- **Before major releases** (to ensure quality standards)
- **When onboarding new team members** (to document standards)
- **After major design trends shift** (to evaluate relevance)

## Files Created

After running this skill, you'll have:

```
audit-results/
├── baseline-screenshots/          # 42 screenshots before changes
│   ├── index/
│   │   ├── desktop-light.png
│   │   ├── desktop-dark.png
│   │   ├── tablet-light.png
│   │   ├── tablet-dark.png
│   │   ├── mobile-light.png
│   │   └── mobile-dark.png
│   └── [... 21 more page folders]
├── final-screenshots/             # 42 screenshots after changes
├── readability-usability-audit.md
├── ownership-branding-audit.md
├── storytelling-content-audit.md
├── ui-design-audit.md             # ⭐ Enhanced with trend analysis
├── ux-audit.md                    # ⭐ Enhanced with cognitive analysis
├── seo-audit.md
└── accessibility-audit.md
```

Plus comprehensive updates to `CLAUDE.md` with:
- Executive summary with scores and grades
- Industry benchmark comparisons
- Implementation roadmap with ROI analysis
- Expected score progression after fixes

## What Makes This Audit Different

### Traditional Audits:
- ✅ Check accessibility compliance
- ✅ Test basic usability
- ✅ Validate code quality
- ❌ Don't evaluate against cutting-edge trends
- ❌ Don't benchmark against industry leaders
- ❌ Don't analyze cognitive psychology
- ❌ Don't provide ROI estimates

### This Enhanced Audit:
- ✅ All traditional checks PLUS:
- ✅ **2026 design trend evaluation** (7 trend dimensions)
- ✅ **Industry leader benchmarking** (Apple, Linear, Vercel, Stripe, Raycast, Notion, Figma)
- ✅ **Cognitive psychology analysis** (mental models, cognitive load, decision fatigue)
- ✅ **Behavioral economics** (choice architecture, persuasive design)
- ✅ **User flow mapping** with friction analysis
- ✅ **Persona-specific evaluation** (hiring managers, peers, founders)
- ✅ **ROI projections** for every fix recommendation
- ✅ **A/B test recommendations**
- ✅ **Awwwards/Dribbble quality bar**

## Grading Scale

| Grade | Score | UI Benchmark | UX Benchmark |
|-------|-------|--------------|--------------|
| A+ | 95-100 | Apple/Linear level | Linear/Figma level |
| A | 90-94 | Vercel level | Stripe/Notion level |
| B+ | 85-89 | Polished professional | Strong usability |
| B | 80-84 | Good foundation | Functional, clear |
| C+ | 75-79 | Some inconsistencies | Minor friction |
| C | 70-74 | Needs work | Noticeable issues |
| D | 60-69 | Significant issues | High friction |
| F | <60 | Poor quality | Blocks user success |

## Version History

- **v2.0.0** (Jan 28, 2026) - Enhanced UI and UX audits with 2026 trends, cognitive psychology, and industry benchmarks
- **v1.0.0** (Jan 28, 2026) - Initial release with 7 parallel agents

## Future Enhancements

Planned for future versions:
- Performance audit agent (Lighthouse, Core Web Vitals)
- Content quality audit (copywriting, tone, voice consistency)
- Mobile-first audit (thumb zones, gesture patterns)
- Animation quality audit (spring physics, timing functions)
- Brand consistency audit across all touchpoints

---

*Created by Riya Jawandhiya with Claude Sonnet 4.5*
*Maintained with extremely high visual and UX standards*
