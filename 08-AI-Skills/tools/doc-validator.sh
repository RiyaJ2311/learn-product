#!/bin/bash

# AI Skills Documentation Validator & Fixer
# Validates and fixes common issues in markdown documentation
# Usage: ./doc-validator.sh [command]
#   validate   - Check for issues without fixing
#   fix        - Automatically fix all issues
#   clean      - Remove backup files

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOCS_DIR="$(dirname "$SCRIPT_DIR")"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters
ISSUES_FOUND=0
FILES_FIXED=0

print_header() {
    echo -e "${BLUE}╔════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║  AI Skills Documentation Validator & Fixer        ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_section() {
    echo -e "${BLUE}▶ $1${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

# Validate em-dashes
check_emdashes() {
    print_section "Checking for em-dashes..."
    local found=0

    while IFS= read -r file; do
        if grep -q '—' "$file" 2>/dev/null; then
            local count=$(grep -c '—' "$file")
            print_warning "Found $count em-dashes in: ${file#$DOCS_DIR/}"
            ((found++))
            ((ISSUES_FOUND++))
        fi
    done < <(find "$DOCS_DIR" -name "*.md" -type f ! -name "DOCUMENTATION-GUIDELINES.md" ! -path "*/node_modules/*")

    if [ $found -eq 0 ]; then
        print_success "No em-dashes found"
    fi
}

# Validate diagram formatting
check_diagrams() {
    print_section "Checking ASCII diagram formatting..."
    local found=0

    while IFS= read -r file; do
        # Check for mixed hyphens and box chars
        if grep -q '┌.*-.*┐\|└.*-.*┘\|├.*-.*┤' "$file" 2>/dev/null; then
            print_warning "Mixed hyphens and box chars in: ${file#$DOCS_DIR/}"
            ((found++))
            ((ISSUES_FOUND++))
        fi

        # Check for hyphens instead of box chars
        if grep -q '│.*-----.*│' "$file" 2>/dev/null; then
            print_warning "Hyphens instead of box chars in: ${file#$DOCS_DIR/}"
            ((found++))
            ((ISSUES_FOUND++))
        fi
    done < <(find "$DOCS_DIR" -name "*.md" -type f ! -name "DOCUMENTATION-GUIDELINES.md" ! -path "*/node_modules/*")

    if [ $found -eq 0 ]; then
        print_success "All diagrams properly formatted"
    fi
}

# Validate spacing
check_spacing() {
    print_section "Checking spacing issues..."
    local found=0

    while IFS= read -r file; do
        # Check for double spaces after colons (excluding diagram lines with │)
        local count=$(grep ':  ' "$file" 2>/dev/null | grep -v '│' | wc -l | tr -d ' ')
        if [ "$count" -gt 0 ]; then
            print_warning "Found $count double spaces after colons in: ${file#$DOCS_DIR/}"
            ((found++))
            ((ISSUES_FOUND++))
        fi
    done < <(find "$DOCS_DIR" -name "*.md" -type f ! -name "DOCUMENTATION-GUIDELINES.md" ! -path "*/node_modules/*")

    if [ $found -eq 0 ]; then
        print_success "Spacing is correct"
    fi
}

# Fix em-dashes
fix_emdashes() {
    print_section "Fixing em-dashes..."

    while IFS= read -r file; do
        if grep -q '—' "$file" 2>/dev/null; then
            echo "  Fixing: ${file#$DOCS_DIR/}"

            # Create backup
            cp "$file" "$file.bak"

            # Pattern 1: "Next:" links - use hyphen
            sed -i '' 's/\*\*Next:\*\* \[\([^]]*\)\](\([^)]*\)) — /\*\*Next:\*\* \[\1\](\2) - /g' "$file"

            # Pattern 2: Em-dash before "it's/they're/that's" - use comma
            sed -i '' 's/—it'"'"'s /, it'"'"'s /g' "$file"
            sed -i '' 's/—they'"'"'re /, they'"'"'re /g' "$file"
            sed -i '' 's/—that'"'"'s /, that'"'"'s /g' "$file"

            # Pattern 3: Em-dash in list context - use comma
            sed -i '' 's/,\([^—]*\)—and /, \1, and /g' "$file"
            sed -i '' 's/,\([^—]*\)—or /, \1, or /g' "$file"

            # Pattern 4: Em-dash after phrase ending - use period
            sed -i '' 's/\([a-z]\)—\([A-Z]\)/\1. \2/g' "$file"

            # Pattern 5: Em-dash before lowercase - use comma
            sed -i '' 's/—\([a-z]\)/, \1/g' "$file"

            # Pattern 6: Remaining em-dashes with space - use comma
            sed -i '' 's/ — /, /g' "$file"

            # Pattern 7: Any remaining em-dashes - use comma
            sed -i '' 's/—/, /g' "$file"

            ((FILES_FIXED++))
        fi
    done < <(find "$DOCS_DIR" -name "*.md" -type f ! -name "DOCUMENTATION-GUIDELINES.md" ! -path "*/node_modules/*")

    print_success "Fixed em-dashes in $FILES_FIXED files"
}

# Fix spacing
fix_spacing() {
    print_section "Fixing spacing..."

    find "$DOCS_DIR" -name "*.md" -type f ! -name "DOCUMENTATION-GUIDELINES.md" ! -path "*/node_modules/*" \
        -exec sed -i '' 's/:  /: /g' {} \;

    find "$DOCS_DIR" -name "*.md" -type f ! -name "DOCUMENTATION-GUIDELINES.md" ! -path "*/node_modules/*" \
        -exec sed -i '' 's/\. they'"'"'re/. They'"'"'re/g' {} \;

    find "$DOCS_DIR" -name "*.md" -type f ! -name "DOCUMENTATION-GUIDELINES.md" ! -path "*/node_modules/*" \
        -exec sed -i '' 's/\. it'"'"'s/. It'"'"'s/g' {} \;

    print_success "Fixed spacing issues"
}

# Clean backup files
clean_backups() {
    print_section "Cleaning backup files..."
    local count=$(find "$DOCS_DIR" -name "*.md.bak" -type f | wc -l | tr -d ' ')

    if [ "$count" -gt 0 ]; then
        find "$DOCS_DIR" -name "*.md.bak" -type f -delete
        print_success "Removed $count backup files"
    else
        print_success "No backup files to clean"
    fi
}

# Validate mode
validate() {
    print_header
    print_section "Running validation checks..."
    echo ""

    check_emdashes
    check_diagrams
    check_spacing

    echo ""
    if [ $ISSUES_FOUND -eq 0 ]; then
        print_success "All validation checks passed! ✨"
    else
        print_warning "Found $ISSUES_FOUND issue(s)"
        echo ""
        echo "Run './doc-validator.sh fix' to automatically fix these issues"
    fi
    echo ""
}

# Fix mode
fix() {
    print_header
    print_section "Running automatic fixes..."
    echo ""

    fix_emdashes
    fix_spacing

    echo ""
    print_success "All fixes applied!"
    print_warning "Backup files created with .bak extension"
    echo ""
    echo "Run './doc-validator.sh validate' to verify fixes"
    echo "Run './doc-validator.sh clean' to remove backups"
    echo ""
}

# Show usage
usage() {
    print_header
    echo "Usage: $0 [command]"
    echo ""
    echo "Commands:"
    echo "  validate    Check for formatting issues (default)"
    echo "  fix         Automatically fix all issues"
    echo "  clean       Remove backup files (.bak)"
    echo "  help        Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 validate        # Check for issues"
    echo "  $0 fix             # Fix all issues"
    echo "  $0 clean           # Clean up backups"
    echo ""
}

# Main
case "${1:-validate}" in
    validate)
        validate
        ;;
    fix)
        fix
        ;;
    clean)
        clean_backups
        ;;
    help|--help|-h)
        usage
        ;;
    *)
        print_error "Unknown command: $1"
        echo ""
        usage
        exit 1
        ;;
esac
