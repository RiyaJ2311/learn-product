# AI Skills Documentation Tools

Command-line tools for maintaining and validating the AI Skills documentation.

---

## Quick Start

```bash
# Validate all documentation
./doc-validator.sh validate

# Fix all issues automatically
./doc-validator.sh fix

# Clean up backup files
./doc-validator.sh clean
```

---

## Available Tools

### doc-validator.sh

The main validation and fixing tool for documentation.

**Features:**
- Validates em-dash usage (enforces no em-dashes)
- Checks ASCII diagram formatting
- Validates spacing consistency
- Automatically fixes common issues
- Creates backups before making changes

**Usage:**
```bash
./doc-validator.sh [command]

Commands:
  validate    Check for formatting issues (default)
  fix         Automatically fix all issues
  clean       Remove backup files (.bak)
  help        Show help message
```

**What it checks:**
- ✅ No em-dashes (, ) in documentation
- ✅ Proper Unicode box-drawing characters in diagrams
- ✅ Consistent spacing (no double spaces after colons)
- ✅ Proper capitalization after periods

**What it fixes:**
- Replaces em-dashes with appropriate punctuation (commas, colons, periods)
- Fixes double spacing issues
- Corrects capitalization after sentence breaks

---

## Workflow

### Before Committing Changes

```bash
# 1. Run validation
./doc-validator.sh validate

# 2. If issues found, fix them
./doc-validator.sh fix

# 3. Verify fixes worked
./doc-validator.sh validate

# 4. Clean up backups
./doc-validator.sh clean

# 5. Commit your changes
git add .
git commit -m "Your commit message"
```

---

## Rules Enforced

These tools enforce the standards defined in [DOCUMENTATION-GUIDELINES.md](../DOCUMENTATION-GUIDELINES.md):

### No Em-dashes
Em-dashes (, ) are not allowed. Use instead:
- **Commas** for parenthetical phrases
- **Colons** for explanations
- **Parentheses** for side notes
- **Periods** to split into two sentences

### Proper ASCII Diagrams
- Use Unicode box-drawing characters: `┌ ┐ └ ┘ │ ─`
- Never mix hyphens with box characters
- All corners must align properly

### Consistent Spacing
- Single space after colons
- Proper capitalization after periods

---

## Examples

### Example 1: Finding Issues

```bash
$ ./doc-validator.sh validate

╔════════════════════════════════════════════════════╗
║  AI Skills Documentation Validator & Fixer        ║
╚════════════════════════════════════════════════════╝

▶ Running validation checks...

▶ Checking for em-dashes...
⚠ Found 3 em-dashes in: 03-AI-Agents/01-What-are-Agents.md

▶ Checking ASCII diagram formatting...
✓ All diagrams properly formatted

▶ Checking spacing issues...
✓ Spacing is correct

⚠ Found 1 issue(s)

Run './doc-validator.sh fix' to automatically fix these issues
```

### Example 2: Fixing Issues

```bash
$ ./doc-validator.sh fix

╔════════════════════════════════════════════════════╗
║  AI Skills Documentation Validator & Fixer        ║
╚════════════════════════════════════════════════════╝

▶ Running automatic fixes...

▶ Fixing em-dashes...
  Fixing: 03-AI-Agents/01-What-are-Agents.md
✓ Fixed em-dashes in 1 files

▶ Fixing spacing...
✓ Fixed spacing issues

✓ All fixes applied!
⚠ Backup files created with .bak extension

Run './doc-validator.sh validate' to verify fixes
Run './doc-validator.sh clean' to remove backups
```

---

## Advanced Usage

### Check Specific Directory

```bash
# Change to specific module
cd ../03-AI-Agents

# Run validation from tools directory
../tools/doc-validator.sh validate
```

### Manual Fixes

For complex issues that can't be automatically fixed:

1. Review the output from `validate`
2. Manually fix the issues following [DOCUMENTATION-GUIDELINES.md](../DOCUMENTATION-GUIDELINES.md)
3. Run `validate` again to confirm

---

## Troubleshooting

### "Permission denied" error

Make the script executable:
```bash
chmod +x doc-validator.sh
```

### Backups not being created

The script creates `.bak` files when fixing. If you don't see them:
- Check you have write permissions
- Look in the same directory as the markdown files

### False positives

If the validator flags something incorrectly:
1. Check if it's in `DOCUMENTATION-GUIDELINES.md` (intentional examples are excluded)
2. Check if it's in `node_modules` (automatically excluded)
3. Report the issue if it's a bug

---

## Integration with Git

### Pre-commit Hook

Add to `.git/hooks/pre-commit`:

```bash
#!/bin/bash
cd learn-product/08-AI-Skills/tools
./doc-validator.sh validate
if [ $? -ne 0 ]; then
    echo "Documentation validation failed. Run './doc-validator.sh fix' to fix issues."
    exit 1
fi
```

---

## Contributing

When adding new validation rules:

1. Add the check function to `doc-validator.sh`
2. Add the fix function if it can be automated
3. Update this README with the new rule
4. Update [DOCUMENTATION-GUIDELINES.md](../DOCUMENTATION-GUIDELINES.md)

---

## Related Documentation

- [DOCUMENTATION-GUIDELINES.md](../DOCUMENTATION-GUIDELINES.md) - Full style guide
- [GLOSSARY.md](../GLOSSARY.md) - Term definitions
- [README.md](../README.md) - Main module overview
