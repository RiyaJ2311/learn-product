#!/bin/bash

# Script to fix em-dashes in markdown files
# Usage: bash fix-emdashes.sh

echo "Fixing em-dashes in markdown files..."

# Find all markdown files with em-dashes and fix them
find . -name "*.md" -type f | while read -r file; do
  if grep -q "—" "$file"; then
    echo "Fixing: $file"

    # Common patterns:
    # 1. "text—text" -> "text (text)" for parenthetical
    # 2. "text—and" -> "text, and" for conjunctions
    # 3. "list—item1, item2" -> "list: item1, item2" for explanations
    # 4. At end of lines in "Next:" links -> use hyphen

    # Fix "Next:" links
    sed -i '' 's/\*\*Next:\*\* \[\([^]]*\)\](\([^)]*\)) — /\*\*Next:\*\* \[\1\](\2) - /g' "$file"

    # Fix other common patterns - you may need to review these manually
    # For now, just report them
    echo "  Found $(grep -c "—" "$file") em-dashes remaining (may need manual review)"
  fi
done

echo "Done! Review files and manually fix context-specific em-dashes."
echo "Guidelines:"
echo "  - Use commas for parenthetical phrases"
echo "  - Use colons for explanations"
echo "  - Use parentheses for side notes"
echo "  - Use periods to split into two sentences"
