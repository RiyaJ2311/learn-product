# Compare Screenshots

Compare baseline screenshots with final screenshots to verify no visual regressions.

## Instructions

1. **Capture Final Screenshots**
   ```bash
   python3 -m http.server 8000 &
   node scripts/capture-screenshots.js --output=audit-results/final-screenshots
   pkill -f "python3 -m http.server 8000"
   ```

2. **Compare Images**
   - Check that baseline and final have same 42 files
   - Note any visual differences (should be none if audit was read-only)
   - Document any unexpected changes

3. **Report Findings**
   - List any visual regressions detected
   - Confirm all pages render correctly
   - Note any broken layouts or missing content

## Success Criteria

✅ All 42 final screenshots captured
✅ Visual comparison shows no regressions (or expected changes only)
✅ All pages render correctly in all themes/breakpoints
