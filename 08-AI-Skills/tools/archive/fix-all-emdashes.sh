#!/bin/bash

# Automatically fix em-dashes with context-aware replacements
# Excludes DOCUMENTATION-GUIDELINES.md (has intentional examples)

echo "Fixing em-dashes in markdown files..."

FIXED_COUNT=0

find . -name "*.md" -type f ! -name "DOCUMENTATION-GUIDELINES.md" | while read -r file; do
  if grep -q '—' "$file"; then
    echo "Fixing: $file"

    # Create backup
    cp "$file" "$file.bak"

    # Pattern 1: "Next:" links - use hyphen
    sed -i '' 's/\*\*Next:\*\* \[\([^]]*\)\](\([^)]*\)) — /\*\*Next:\*\* \[\1\](\2) - /g' "$file"

    # Pattern 2: "Remember:" statements - use period for clarity
    sed -i '' 's/\*\*Remember:\*\* \([^—]*\)—\([^—]*\)\./\*\*Remember:\*\* \1. \2./g' "$file"

    # Pattern 3: Em-dash before "it's/they're/that's" - use comma
    sed -i '' 's/—it'"'"'s /, it'"'"'s /g' "$file"
    sed -i '' 's/—they'"'"'re /, they'"'"'re /g' "$file"
    sed -i '' 's/—that'"'"'s /, that'"'"'s /g' "$file"

    # Pattern 4: Em-dash in list context "a, b, c—and d" - use comma
    sed -i '' 's/,\([^—]*\)—and /, \1, and /g' "$file"
    sed -i '' 's/,\([^—]*\)—or /, \1, or /g' "$file"

    # Pattern 5: Em-dash after phrase ending in colon context - use period
    sed -i '' 's/\([a-z]\)—\([A-Z]\)/\1. \2/g' "$file"

    # Pattern 6: Em-dash in parenthetical "text—explanation—more" - use commas
    sed -i '' 's/ \([^—]*\)—\([^—]*\)—\([^—]*\) / \1, \2, \3 /g' "$file"

    # Pattern 7: Em-dash before lowercase (continuation) - use comma
    sed -i '' 's/—\([a-z]\)/, \1/g' "$file"

    # Pattern 8: Em-dash in "Thing—description" at start of line - use colon
    sed -i '' 's/^\([^—]*\)—\([^—]*\)$/\1: \2/g' "$file"

    # Pattern 9: Remaining em-dashes with space on both sides - use comma
    sed -i '' 's/ — /, /g' "$file"

    # Pattern 10: Remaining em-dashes - use comma as safe default
    sed -i '' 's/—/, /g' "$file"

    FIXED_COUNT=$((FIXED_COUNT + 1))
  fi
done

echo ""
echo "Fixed em-dashes in $FIXED_COUNT files"
echo "Backups saved with .bak extension"
echo ""
echo "Run validation: ./validate-diagrams.sh"
