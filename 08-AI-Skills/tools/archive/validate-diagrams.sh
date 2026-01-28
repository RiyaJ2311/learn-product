#!/bin/bash

# Script to validate ASCII diagrams and formatting in markdown files
# Checks for common issues like broken diagrams and em-dashes

echo "Validating ASCII diagrams and formatting..."
echo ""

FILES_WITH_ISSUES=0

# Find all markdown files (excluding DOCUMENTATION-GUIDELINES.md which has intentional examples)
find . -name "*.md" -type f ! -name "DOCUMENTATION-GUIDELINES.md" | while read -r file; do
  FILE_HAS_ISSUE=0

  # Check for mixed hyphen and box drawing characters
  if grep -q '┌.*-.*┐\|└.*-.*┘\|├.*-.*┤' "$file"; then
    echo "⚠️  DIAGRAM: Mixed hyphens and box chars in: $file"
    FILE_HAS_ISSUE=1
  fi

  # Check for hyphens used as horizontal lines in boxes
  if grep -q '│.*-----.*│' "$file"; then
    echo "⚠️  DIAGRAM: Hyphens instead of box chars in: $file"
    FILE_HAS_ISSUE=1
  fi

  # Check for em-dashes
  if grep -q '—' "$file"; then
    count=$(grep -c '—' "$file")
    echo "⚠️  STYLE: $count em-dashes in: $file"
    FILE_HAS_ISSUE=1
  fi

  if [ $FILE_HAS_ISSUE -eq 1 ]; then
    FILES_WITH_ISSUES=$((FILES_WITH_ISSUES + 1))
  fi
done

echo ""
if [ $FILES_WITH_ISSUES -eq 0 ]; then
  echo "✅ All files pass validation!"
else
  echo "⚠️  Found issues. See DOCUMENTATION-GUIDELINES.md for proper formatting."
fi
