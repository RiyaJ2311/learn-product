# Accessibility (A11y) Audit

Audit accessibility compliance against WCAG 2.1 AA standards.

## Focus Areas

1. **Semantic HTML**
   - Landmark regions (main, nav, header, footer)
   - Heading hierarchy (h1→h2→h3)
   - Lists, buttons vs links
   - Form labels

2. **ARIA Implementation**
   - aria-label, aria-hidden
   - aria-describedby, aria-labelledby
   - role attributes
   - aria-live regions

3. **Keyboard Navigation**
   - Tab order logical
   - All interactive elements reachable
   - Focus indicators visible (2-3px)
   - Skip to main content
   - No keyboard traps

4. **Color & Contrast**
   - WCAG AA ratios:
     - Normal text: 4.5:1 min
     - Large text: 3:1 min
     - UI components: 3:1 min
   - Color not sole indicator

5. **Images & Media**
   - Alt text (descriptive, not generic)
   - Empty alt for decorative
   - SVG accessibility

6. **Forms & Interactive**
   - Form labels associated
   - Error messages accessible
   - Touch targets ≥44×44px

7. **Screen Reader**
   - Content order makes sense
   - Hidden content marked
   - Dynamic content announced

8. **Motion & Animation**
   - prefers-reduced-motion support
   - No seizure-inducing effects

## Deliverable

Report with:
- A11y Score (0-100)
- WCAG Violations by severity
- ARIA Issues
- Keyboard Navigation Problems
- Contrast Issues
- Recommended fixes
