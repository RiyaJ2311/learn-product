# 🎨 PushOwl Design System

> A unified, Polaris-compatible design system with validation, documentation, and AI generation guidelines.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Current State Analysis](#current-state-analysis)
- [Architecture](#architecture)
- [Phase 1: Component Library](#phase-1-component-library-foundation)
- [Phase 2: Token Unification](#phase-2-token-unification)
- [Phase 3: Validation & Checks](#phase-3-validation--checks)
- [Phase 4: Documentation](#phase-4-documentation-storybook)
- [Phase 5: AI Generation Guidelines](#phase-5-ai-generation-guidelines)
- [Implementation Roadmap](#implementation-roadmap)
- [Quick Reference](#quick-reference)

---

## Overview

### Goals

| Goal | Description |
|------|-------------|
| **Consistency** | Single source of truth for all UI components |
| **Validation** | Automated checks to enforce design standards |
| **Documentation** | Interactive component catalog with usage examples |
| **AI-Ready** | Clear guidelines for generating Polaris-compatible code |

### Key Principles

```
┌─────────────────────────────────────────────────────────────────┐
│                     DESIGN SYSTEM PRINCIPLES                     │
├─────────────────────────────────────────────────────────────────┤
│  1. SINGLE IMPORT    → All components from `src/design-system`  │
│  2. TOKEN-FIRST      → No hardcoded colors, spacing, or fonts   │
│  3. POLARIS-ALIGNED  → Follow Shopify Polaris patterns          │
│  4. TYPE-SAFE        → Full TypeScript coverage                 │
│  5. ACCESSIBLE       → WCAG 2.1 AA compliance                   │
└─────────────────────────────────────────────────────────────────┘
```

---

## Current State Analysis

### What We Have

| System | Files | Components | Status |
|--------|-------|------------|--------|
| **Polaris** | 584 | 747+ imports | ✅ Heavily adopted |
| **Barn** | 181 | 7 components + tokens | ✅ Custom styling |
| **Styled Components** | - | Throughout | ✅ CSS-in-JS |

### Top Polaris Components Used

```
Text          ████████████████████████████████████████ 244
BlockStack    ████████████████████████████████████████ 240
InlineStack   ████████████████████████████████ 147
Button        ██████████████████████████ 124
Box           ██████████████████████ 109
Card          ██████████ 50
Spinner       ████████ 42
Modal         ██████ 34
```

### Identified Gaps

| Area | Issue | Impact |
|------|-------|--------|
| 🔴 **No unified imports** | Direct Polaris/Barn imports scattered | Inconsistency |
| 🔴 **Dual token systems** | Barn ≠ Polaris tokens | Confusion |
| 🔴 **No documentation** | Missing Storybook/component docs | Onboarding |
| 🟡 **Weak validation** | ESLint ignored in builds | Quality |
| 🟡 **No pre-commit** | Lefthook minimal | Errors slip through |
| 🟡 **TypeScript lax** | `strict: false` | Type bugs |

---

## Architecture

### Directory Structure

```
src/design-system/
│
├── 📁 components/
│   ├── 📁 forms/                 # Form inputs & controls
│   │   ├── Input.tsx             # Text input (Barn wrapper)
│   │   ├── TextArea.tsx          # Multi-line input
│   │   ├── Select.tsx            # Dropdown select
│   │   ├── Checkbox.tsx          # Checkbox control
│   │   ├── RadioGroup.tsx        # Radio button group
│   │   ├── FormField.tsx         # Unified field wrapper
│   │   └── index.ts              # Barrel export
│   │
│   ├── 📁 feedback/              # User feedback components
│   │   ├── Alert.tsx             # Alert messages (Barn)
│   │   ├── Toast.tsx             # Toast notifications
│   │   ├── Banner.tsx            # Page banners
│   │   ├── ProgressBar.tsx       # Progress indicator
│   │   └── index.ts
│   │
│   ├── 📁 layout/                # Layout primitives
│   │   ├── Stack.tsx             # BlockStack/InlineStack
│   │   ├── Card.tsx              # Content cards
│   │   ├── Drawer.tsx            # Side drawer
│   │   ├── Grid.tsx              # Grid layout
│   │   ├── Divider.tsx           # Content separator
│   │   └── index.ts
│   │
│   ├── 📁 navigation/            # Navigation components
│   │   ├── Breadcrumbs.tsx       # Breadcrumb trail
│   │   ├── Tabs.tsx              # Tab navigation
│   │   ├── Sidebar.tsx           # Side navigation
│   │   └── index.ts
│   │
│   ├── 📁 data-display/          # Data presentation
│   │   ├── Table.tsx             # Data tables
│   │   ├── Badge.tsx             # Status badges
│   │   ├── Tooltip.tsx           # Hover tooltips
│   │   └── index.ts
│   │
│   └── index.ts                  # Main component export
│
├── 📁 tokens/
│   ├── colors.ts                 # Color palette
│   ├── spacing.ts                # Spacing scale
│   ├── typography.ts             # Font styles
│   ├── polaris-mapping.ts        # Barn → Polaris mapping
│   └── index.ts                  # Unified token export
│
├── 📁 hooks/
│   ├── useResponsive.ts          # Breakpoint utilities
│   ├── useTheme.ts               # Theme access
│   └── index.ts
│
├── 📁 utils/
│   ├── cn.ts                     # Class name helper
│   ├── validators.ts             # Prop validators
│   └── index.ts
│
├── 📁 types/
│   ├── components.d.ts           # Component types
│   └── index.ts
│
└── index.ts                      # 🎯 MAIN ENTRY POINT
```

### Component Decision Matrix

Use this matrix to decide which component type to use:

```
┌────────────────────────┬─────────────────┬─────────────────────────────┐
│ Need                   │ Use             │ Examples                    │
├────────────────────────┼─────────────────┼─────────────────────────────┤
│ Standard UI element    │ Polaris direct  │ Button, Text, Spinner       │
│ Custom styling needed  │ Barn component  │ Alert, Input, ProgressBar   │
│ Polaris + extra props  │ Thin wrapper    │ FormField, Card             │
│ Complex composition    │ Composite       │ Drawer, Table, Sidebar      │
└────────────────────────┴─────────────────┴─────────────────────────────┘
```

---

## Phase 1: Component Library Foundation

### 1.1 Main Entry Point

```typescript
// src/design-system/index.ts

// ═══════════════════════════════════════════════════════════════
// POLARIS COMPONENTS (Re-exported for single import source)
// ═══════════════════════════════════════════════════════════════

export {
  // Layout
  BlockStack,
  InlineStack,
  Box,
  Bleed,
  Divider,

  // Actions
  Button,
  ButtonGroup,

  // Typography
  Text,

  // Feedback
  Spinner,
  Badge,
  Banner,

  // Overlays
  Modal,
  Popover,
  Tooltip,

  // Navigation
  Tabs,

  // Forms
  Select,
  Checkbox,
  RadioButton,

  // Data
  Card,
  Collapsible,
} from '@shopify/polaris';

// Icons
export * from '@shopify/polaris-icons';

// ═══════════════════════════════════════════════════════════════
// CUSTOM COMPONENTS (Barn + PushOwl specific)
// ═══════════════════════════════════════════════════════════════

// Forms
export { Input } from './components/forms/Input';
export { TextArea } from './components/forms/TextArea';
export { FormField } from './components/forms/FormField';

// Feedback
export { Alert, AlertType } from './components/feedback/Alert';
export { Toast } from './components/feedback/Toast';
export { ProgressBar } from './components/feedback/ProgressBar';

// Layout
export { Drawer } from './components/layout/Drawer';
export { Grid } from './components/layout/Grid';

// Navigation
export { Breadcrumbs } from './components/navigation/Breadcrumbs';
export { Sidebar } from './components/navigation/Sidebar';

// Data Display
export { Table } from './components/data-display/Table';

// ═══════════════════════════════════════════════════════════════
// TOKENS & UTILITIES
// ═══════════════════════════════════════════════════════════════

export { tokens } from './tokens';
export { polarisMapping } from './tokens/polaris-mapping';
export { useResponsive } from './hooks/useResponsive';
export { cn } from './utils/cn';
```

### 1.2 Usage Example

```typescript
// ❌ BEFORE: Scattered imports
import { Button, Text, BlockStack } from '@shopify/polaris';
import { Alert } from 'barn/components/Alert';
import tokens from 'barn/tokens';

// ✅ AFTER: Single source of truth
import {
  Button,
  Text,
  BlockStack,
  Alert,
  tokens
} from 'src/design-system';
```

---

## Phase 2: Token Unification

### 2.1 Polaris Token Mapping

```typescript
// src/design-system/tokens/polaris-mapping.ts

/**
 * Maps Barn token indices to Polaris spacing values
 *
 * Usage:
 *   <BlockStack gap={polarisMapping.spacing[5]}>  // gap="400" (16px)
 */
export const polarisMapping = {

  // ┌─────────────────────────────────────────────────────────────┐
  // │ SPACING: Barn index → Polaris gap value                    │
  // └─────────────────────────────────────────────────────────────┘
  spacing: {
    0: '0',       // 0px
    1: '050',     // 2px
    2: '100',     // 4px
    3: '200',     // 8px   ← Most common
    4: '300',     // 12px
    5: '400',     // 16px  ← Default
    6: '500',     // 20px
    7: '600',     // 24px
    8: '800',     // 32px
    9: '1000',    // 40px
    10: '1200',   // 48px
  } as const,

  // ┌─────────────────────────────────────────────────────────────┐
  // │ COLORS: Semantic mapping to Polaris CSS variables          │
  // └─────────────────────────────────────────────────────────────┘
  colors: {
    // Semantic colors
    primary: 'var(--p-color-bg-fill-brand)',
    success: 'var(--p-color-bg-fill-success)',
    warning: 'var(--p-color-bg-fill-warning)',
    critical: 'var(--p-color-bg-fill-critical)',
    info: 'var(--p-color-bg-fill-info)',

    // Text colors
    text: 'var(--p-color-text)',
    textSubdued: 'var(--p-color-text-subdued)',
    textDisabled: 'var(--p-color-text-disabled)',
    textInverse: 'var(--p-color-text-inverse)',

    // Surface colors
    surface: 'var(--p-color-bg-surface)',
    surfaceHover: 'var(--p-color-bg-surface-hover)',
    surfaceActive: 'var(--p-color-bg-surface-active)',

    // Border colors
    border: 'var(--p-color-border)',
    borderSubdued: 'var(--p-color-border-subdued)',

    // Barn greys → Polaris mapping
    'greys.0': 'var(--p-color-text)',
    'greys.5': 'var(--p-color-border)',
    'greys.7': 'var(--p-color-bg-surface)',
    'greys.8': 'var(--p-color-bg)',
  } as const,

  // ┌─────────────────────────────────────────────────────────────┐
  // │ TYPOGRAPHY: Polaris Text component variants                │
  // └─────────────────────────────────────────────────────────────┘
  text: {
    // Headings
    heading2xl: { as: 'h1', variant: 'heading2xl' },
    headingXl: { as: 'h1', variant: 'headingXl' },
    headingLg: { as: 'h2', variant: 'headingLg' },
    headingMd: { as: 'h3', variant: 'headingMd' },
    headingSm: { as: 'h4', variant: 'headingSm' },
    headingXs: { as: 'h5', variant: 'headingXs' },

    // Body text
    bodyLg: { as: 'p', variant: 'bodyLg' },
    bodyMd: { as: 'p', variant: 'bodyMd' },
    bodySm: { as: 'p', variant: 'bodySm' },
    bodyXs: { as: 'p', variant: 'bodyXs' },
  } as const,

  // ┌─────────────────────────────────────────────────────────────┐
  // │ SHADOWS: Polaris elevation tokens                          │
  // └─────────────────────────────────────────────────────────────┘
  shadow: {
    none: 'var(--p-shadow-none)',
    xs: 'var(--p-shadow-100)',
    sm: 'var(--p-shadow-200)',
    md: 'var(--p-shadow-300)',
    lg: 'var(--p-shadow-400)',
    xl: 'var(--p-shadow-500)',
  } as const,

  // ┌─────────────────────────────────────────────────────────────┐
  // │ BORDER RADIUS: Polaris radius tokens                       │
  // └─────────────────────────────────────────────────────────────┘
  radius: {
    none: 'var(--p-border-radius-0)',
    sm: 'var(--p-border-radius-100)',
    md: 'var(--p-border-radius-200)',
    lg: 'var(--p-border-radius-300)',
    xl: 'var(--p-border-radius-400)',
    full: 'var(--p-border-radius-full)',
  } as const,
};

// Type exports for TypeScript support
export type SpacingToken = keyof typeof polarisMapping.spacing;
export type ColorToken = keyof typeof polarisMapping.colors;
export type TextVariant = keyof typeof polarisMapping.text;
```

### 2.2 Unified Token Export

```typescript
// src/design-system/tokens/index.ts

import barnTokens from 'barn/tokens';
import { polarisMapping } from './polaris-mapping';

/**
 * Unified token system combining Barn and Polaris
 *
 * Usage:
 *   tokens.colors.greens[5]           // Barn color
 *   tokens.polaris.colors.primary     // Polaris CSS var
 *   tokens.gap(5)                     // Returns '400'
 */
export const tokens = {
  // Include all Barn tokens
  ...barnTokens,

  // Add Polaris mapping
  polaris: polarisMapping,

  // ═══════════════════════════════════════════════════════════════
  // UTILITY FUNCTIONS
  // ═══════════════════════════════════════════════════════════════

  /**
   * Get Polaris gap value from Barn spacing index
   * @param index - Barn spacing index (0-10)
   * @returns Polaris gap string (e.g., '400')
   */
  gap: (index: number): string => {
    return polarisMapping.spacing[index as keyof typeof polarisMapping.spacing] || '200';
  },

  /**
   * Get Polaris color CSS variable
   * @param key - Color key from polaris mapping
   * @returns CSS variable string
   */
  color: (key: string): string => {
    return polarisMapping.colors[key as keyof typeof polarisMapping.colors]
      || barnTokens.colors.greys[0];
  },

  /**
   * Get spacing in pixels for styled-components
   * @param index - Barn spacing index
   * @returns Pixel value string (e.g., '16px')
   */
  spacing: (index: number): string => {
    return barnTokens.space.margin[index] || barnTokens.space.margin[5];
  },
};

export type Tokens = typeof tokens;
```

### 2.3 Spacing Quick Reference

```
┌──────┬────────────┬─────────────────┬────────────────────────┐
│ Barn │ Polaris    │ Pixels          │ Common Use             │
├──────┼────────────┼─────────────────┼────────────────────────┤
│  0   │ '0'        │ 0px             │ No spacing             │
│  1   │ '050'      │ 2px             │ Hairline               │
│  2   │ '100'      │ 4px             │ Tight                  │
│  3   │ '200'      │ 8px             │ Compact ⭐             │
│  4   │ '300'      │ 12px            │ Default inline         │
│  5   │ '400'      │ 16px            │ Standard ⭐            │
│  6   │ '500'      │ 20px            │ Comfortable            │
│  7   │ '600'      │ 24px            │ Spacious               │
│  8   │ '800'      │ 32px            │ Section gap ⭐         │
│  9   │ '1000'     │ 40px            │ Large section          │
│ 10   │ '1200'     │ 48px            │ Page section           │
└──────┴────────────┴─────────────────┴────────────────────────┘
```

---

## Phase 3: Validation & Checks

### 3.1 ESLint Configuration

```javascript
// .eslintrc.js

module.exports = {
  // ... existing config ...

  rules: {
    // ═══════════════════════════════════════════════════════════
    // DESIGN SYSTEM ENFORCEMENT
    // ═══════════════════════════════════════════════════════════

    'no-restricted-imports': ['error', {
      paths: [
        {
          name: '@shopify/polaris',
          message: '🎨 Import from "src/design-system" instead for consistency.',
        },
      ],
      patterns: [
        {
          group: ['barn/*', 'barn/**'],
          message: '🎨 Import from "src/design-system" instead.',
        },
      ],
    }],

    // Warn on inline styles (prefer tokens)
    'react/forbid-component-props': ['warn', {
      forbid: [{
        propName: 'style',
        message: '🎨 Avoid inline styles. Use design system tokens instead.',
      }],
    }],

    // Enforce consistent naming
    'react/jsx-pascal-case': 'error',
  },

  overrides: [
    {
      // Allow direct imports only in design-system folder
      files: ['src/design-system/**/*.{ts,tsx}'],
      rules: {
        'no-restricted-imports': 'off',
      },
    },
  ],
};
```

### 3.2 Pre-commit Hooks

```yaml
# lefthook.yml

pre-commit:
  parallel: true
  commands:

    # ─────────────────────────────────────────────────────────────
    # CODE QUALITY
    # ─────────────────────────────────────────────────────────────

    lint:
      glob: "*.{ts,tsx,js,jsx}"
      run: yarn eslint --fix {staged_files} --max-warnings 0
      fail_text: "❌ ESLint errors found. Please fix before committing."

    format:
      glob: "*.{ts,tsx,js,jsx,json,md,css,scss}"
      run: yarn prettier --write {staged_files}

    typecheck:
      glob: "*.{ts,tsx}"
      run: yarn tsc --noEmit
      fail_text: "❌ TypeScript errors found. Please fix before committing."

    # ─────────────────────────────────────────────────────────────
    # DESIGN SYSTEM VALIDATION
    # ─────────────────────────────────────────────────────────────

    design-system:
      glob: "src/**/*.{ts,tsx}"
      exclude: "src/design-system/**"
      run: node scripts/validate-design-system.js {staged_files}
      fail_text: "❌ Design system violations found."

    # ─────────────────────────────────────────────────────────────
    # TESTS
    # ─────────────────────────────────────────────────────────────

    test:
      glob: "*.{ts,tsx}"
      run: yarn test --findRelatedTests --passWithNoTests {staged_files}
      fail_text: "❌ Tests failed. Please fix before committing."

# Post-commit message
post-commit:
  commands:
    success:
      run: echo "✅ Commit successful! All checks passed."
```

### 3.3 Design System Validator Script

```javascript
// scripts/validate-design-system.js

#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

// ═══════════════════════════════════════════════════════════════════════
// CONFIGURATION
// ═══════════════════════════════════════════════════════════════════════

const RULES = {
  // Direct imports that should use design-system instead
  forbiddenImports: [
    { pattern: /@shopify\/polaris['"]/, message: 'Import from src/design-system' },
    { pattern: /from ['"]barn\//, message: 'Import from src/design-system' },
  ],

  // Hardcoded values that should use tokens
  hardcodedValues: [
    { pattern: /#[0-9a-fA-F]{3,8}/, message: 'Use tokens.colors instead of hex colors' },
    { pattern: /hsl\([^)]+\)/, message: 'Use tokens.colors instead of hsl()' },
    { pattern: /rgb\([^)]+\)/, message: 'Use tokens.colors instead of rgb()' },
    { pattern: /\d+px/, message: 'Consider using tokens.spacing for pixel values' },
  ],

  // Patterns to encourage
  suggestions: [
    {
      pattern: /<(div|span|p|h[1-6])(?![^>]*className)/,
      message: 'Consider using Polaris Text or Box components',
      severity: 'warn'
    },
  ],
};

// ═══════════════════════════════════════════════════════════════════════
// VALIDATOR
// ═══════════════════════════════════════════════════════════════════════

function validateFile(filePath) {
  const content = fs.readFileSync(filePath, 'utf8');
  const lines = content.split('\n');
  const errors = [];
  const warnings = [];

  lines.forEach((line, index) => {
    const lineNum = index + 1;

    // Check forbidden imports
    RULES.forbiddenImports.forEach(rule => {
      if (rule.pattern.test(line)) {
        errors.push({
          file: filePath,
          line: lineNum,
          message: rule.message,
          code: line.trim(),
        });
      }
    });

    // Check hardcoded values (only in JSX/styled-components)
    if (line.includes('style=') || line.includes('styled.') || line.includes('css`')) {
      RULES.hardcodedValues.forEach(rule => {
        if (rule.pattern.test(line)) {
          warnings.push({
            file: filePath,
            line: lineNum,
            message: rule.message,
            code: line.trim(),
          });
        }
      });
    }
  });

  return { errors, warnings };
}

// ═══════════════════════════════════════════════════════════════════════
// MAIN
// ═══════════════════════════════════════════════════════════════════════

const files = process.argv.slice(2);
let hasErrors = false;

console.log('\n🎨 Design System Validation\n');
console.log('─'.repeat(60));

files.forEach(file => {
  if (!fs.existsSync(file)) return;

  const { errors, warnings } = validateFile(file);

  if (errors.length > 0 || warnings.length > 0) {
    console.log(`\n📄 ${path.relative(process.cwd(), file)}`);

    errors.forEach(err => {
      console.log(`   ❌ Line ${err.line}: ${err.message}`);
      console.log(`      ${err.code}`);
      hasErrors = true;
    });

    warnings.forEach(warn => {
      console.log(`   ⚠️  Line ${warn.line}: ${warn.message}`);
      console.log(`      ${warn.code}`);
    });
  }
});

console.log('\n' + '─'.repeat(60));

if (hasErrors) {
  console.log('❌ Validation failed. Please fix errors above.\n');
  process.exit(1);
} else {
  console.log('✅ All files passed validation.\n');
  process.exit(0);
}
```

### 3.4 TypeScript Configuration

```json
// tsconfig.json

{
  "compilerOptions": {
    // ═══════════════════════════════════════════════════════════
    // STRICT MODE (Enable for better type safety)
    // ═══════════════════════════════════════════════════════════
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "strictFunctionTypes": true,
    "strictBindCallApply": true,
    "strictPropertyInitialization": true,
    "noImplicitThis": true,
    "alwaysStrict": true,

    // ═══════════════════════════════════════════════════════════
    // CODE QUALITY
    // ═══════════════════════════════════════════════════════════
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true,
    "noUncheckedIndexedAccess": true,

    // ═══════════════════════════════════════════════════════════
    // EXISTING CONFIG
    // ═══════════════════════════════════════════════════════════
    "target": "ES5",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "esModuleInterop": true,
    "allowSyntheticDefaultImports": true,
    "module": "esnext",
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,

    // Path aliases
    "baseUrl": ".",
    "paths": {
      "barn": ["./barn"],
      "barn/*": ["./barn/*"],
      "src/*": ["./src/*"],
      "test/*": ["./test/*"],
      "@design-system": ["./src/design-system"],
      "@design-system/*": ["./src/design-system/*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx"],
  "exclude": ["node_modules", ".next", "out"]
}
```

---

## Phase 4: Documentation (Storybook)

### 4.1 Installation

```bash
# Install Storybook with React & TypeScript support
npx storybook@latest init --type react

# Additional addons
yarn add -D @storybook/addon-a11y @storybook/addon-designs
```

### 4.2 Configuration

```typescript
// .storybook/main.ts

import type { StorybookConfig } from '@storybook/react-vite';

const config: StorybookConfig = {
  stories: [
    '../src/design-system/**/*.mdx',
    '../src/design-system/**/*.stories.@(js|jsx|mjs|ts|tsx)',
    '../stories/**/*.mdx',
    '../stories/**/*.stories.@(js|jsx|mjs|ts|tsx)',
  ],

  addons: [
    '@storybook/addon-essentials',
    '@storybook/addon-a11y',        // Accessibility testing
    '@storybook/addon-designs',      // Figma integration
  ],

  framework: {
    name: '@storybook/react-vite',
    options: {},
  },

  docs: {
    autodocs: 'tag',
  },

  typescript: {
    check: true,
  },
};

export default config;
```

```typescript
// .storybook/preview.ts

import type { Preview } from '@storybook/react';
import { AppProvider } from '@shopify/polaris';
import enTranslations from '@shopify/polaris/locales/en.json';
import '@shopify/polaris/build/esm/styles.css';

const preview: Preview = {
  decorators: [
    (Story) => (
      <AppProvider i18n={enTranslations}>
        <Story />
      </AppProvider>
    ),
  ],

  parameters: {
    actions: { argTypesRegex: '^on[A-Z].*' },
    controls: {
      matchers: {
        color: /(background|color)$/i,
        date: /Date$/i,
      },
    },
    a11y: {
      element: '#storybook-root',
      manual: false,
    },
  },
};

export default preview;
```

### 4.3 Story Structure

```
stories/
│
├── 📄 Introduction.mdx              # Welcome & overview
│
├── 📁 Foundations/
│   ├── 📄 Colors.mdx                # Color palette showcase
│   ├── 📄 Spacing.mdx               # Spacing scale guide
│   ├── 📄 Typography.mdx            # Text styles
│   └── 📄 Icons.mdx                 # Icon library
│
├── 📁 Components/
│   ├── 📁 Forms/
│   │   ├── Input.stories.tsx
│   │   ├── TextArea.stories.tsx
│   │   ├── Select.stories.tsx
│   │   └── FormField.stories.tsx
│   │
│   ├── 📁 Feedback/
│   │   ├── Alert.stories.tsx
│   │   ├── Toast.stories.tsx
│   │   └── Banner.stories.tsx
│   │
│   ├── 📁 Layout/
│   │   ├── Card.stories.tsx
│   │   ├── Drawer.stories.tsx
│   │   └── Grid.stories.tsx
│   │
│   └── 📁 Navigation/
│       ├── Breadcrumbs.stories.tsx
│       └── Tabs.stories.tsx
│
└── 📁 Patterns/
    ├── 📄 FormLayouts.mdx           # Common form patterns
    ├── 📄 PageLayouts.mdx           # Page structure patterns
    └── 📄 DataDisplay.mdx           # Table & list patterns
```

### 4.4 Component Story Template

```typescript
// stories/Components/Feedback/Alert.stories.tsx

import type { Meta, StoryObj } from '@storybook/react';
import { Alert, AlertType, BlockStack, Text } from 'src/design-system';

// ═══════════════════════════════════════════════════════════════════════
// META
// ═══════════════════════════════════════════════════════════════════════

const meta: Meta<typeof Alert> = {
  title: 'Components/Feedback/Alert',
  component: Alert,
  tags: ['autodocs'],

  parameters: {
    docs: {
      description: {
        component: `
Alert displays contextual feedback messages to users.

## Usage

\`\`\`tsx
import { Alert, AlertType } from 'src/design-system';

<Alert type={AlertType.Warning}>
  Your subscription expires in 3 days.
</Alert>
\`\`\`

## When to use
- Inline validation feedback
- Status updates
- Important notices that don't require immediate action
        `,
      },
    },
  },

  argTypes: {
    type: {
      control: 'select',
      options: Object.values(AlertType),
      description: 'Visual style indicating the alert severity',
      table: {
        defaultValue: { summary: 'AlertType.Info' },
      },
    },
    children: {
      control: 'text',
      description: 'Alert content',
    },
  },
};

export default meta;
type Story = StoryObj<typeof Alert>;

// ═══════════════════════════════════════════════════════════════════════
// STORIES
// ═══════════════════════════════════════════════════════════════════════

export const Default: Story = {
  args: {
    type: AlertType.Info,
    children: 'This is an informational message.',
  },
};

export const Info: Story = {
  args: {
    type: AlertType.Info,
    children: 'Your changes have been saved automatically.',
  },
};

export const Warning: Story = {
  args: {
    type: AlertType.Warning,
    children: 'Your subscription expires in 3 days. Renew now to avoid interruption.',
  },
};

export const Error: Story = {
  args: {
    type: AlertType.Error,
    children: 'Failed to save changes. Please try again.',
  },
};

export const AllVariants: Story = {
  render: () => (
    <BlockStack gap="400">
      <Alert type={AlertType.Info}>
        <Text>Info: Your changes have been saved.</Text>
      </Alert>
      <Alert type={AlertType.Warning}>
        <Text>Warning: Your subscription expires soon.</Text>
      </Alert>
      <Alert type={AlertType.Error}>
        <Text>Error: Failed to process request.</Text>
      </Alert>
    </BlockStack>
  ),
};
```

---

## Phase 5: AI Generation Guidelines

### 5.1 Component Generation Checklist

```markdown
## ✅ Polaris Component Checklist

Before submitting AI-generated components, verify:

### 📦 Imports
- [ ] All imports from `src/design-system` (not @shopify/polaris or barn/)
- [ ] No unused imports
- [ ] Icons from design-system export

### 🏗️ Structure
- [ ] TypeScript with explicit prop types
- [ ] Props interface exported
- [ ] JSDoc comments on component and complex props
- [ ] File follows naming convention (PascalCase.tsx)

### 📐 Layout
- [ ] Uses `BlockStack` for vertical layouts
- [ ] Uses `InlineStack` for horizontal layouts
- [ ] Uses `Box` for spacing/positioning
- [ ] Standard gap values: `100`, `200`, `400`, `600`, `800`
- [ ] Responsive breakpoints via `useBreakpoints`

### ✍️ Typography
- [ ] All text wrapped in `Text` component
- [ ] Semantic variants used (`headingMd`, `bodyMd`, etc.)
- [ ] No hardcoded font sizes
- [ ] Proper heading hierarchy (h1 → h2 → h3)

### 🎨 Colors
- [ ] All colors via `tokens.colors` or `tokens.polaris.colors`
- [ ] No hardcoded hex/hsl/rgb values
- [ ] Semantic color usage (success, warning, critical)

### 📝 Forms
- [ ] Uses design-system form components
- [ ] Proper labels and descriptions
- [ ] Error state handling
- [ ] Disabled state styling

### ♿ Accessibility
- [ ] Interactive elements keyboard accessible
- [ ] Proper ARIA attributes where needed
- [ ] Focus states visible
- [ ] Color contrast meets WCAG AA
```

### 5.2 Generation Prompt Template

```markdown
## 🤖 Generate Polaris Component

### Component Details
- **Name**: [ComponentName]
- **Type**: [Form | Feedback | Layout | Navigation | Data Display]
- **Description**: [Brief description of purpose]

### Requirements
1. Import all dependencies from `src/design-system`
2. Use TypeScript with exported Props interface
3. Follow Polaris spacing scale: 100 (4px), 200 (8px), 400 (16px), 600 (24px), 800 (32px)
4. Wrap all text in `Text` component with semantic variants
5. Use `tokens.colors` or CSS variables for colors
6. Include JSDoc documentation

### Props
| Prop | Type | Required | Default | Description |
|------|------|----------|---------|-------------|
| prop1 | string | Yes | - | Description |
| prop2 | boolean | No | false | Description |

### Expected Output
1. `ComponentName.tsx` - Main component file
2. `ComponentName.types.ts` - TypeScript interfaces (if complex)
3. `ComponentName.styled.ts` - Styled components (if custom styling needed)
4. `ComponentName.test.tsx` - Basic unit tests
5. `ComponentName.stories.tsx` - Storybook stories

### Example Usage
```tsx
import { ComponentName } from 'src/design-system';

<ComponentName prop1="value" prop2 />
```
```

### 5.3 Code Template

```typescript
// Template: src/design-system/components/[category]/[ComponentName].tsx

import React from 'react';
import {
  BlockStack,
  InlineStack,
  Text,
  Box,
  tokens
} from 'src/design-system';

// ═══════════════════════════════════════════════════════════════════════
// TYPES
// ═══════════════════════════════════════════════════════════════════════

export interface ComponentNameProps {
  /** Primary content */
  children: React.ReactNode;
  /** Visual variant */
  variant?: 'default' | 'primary' | 'secondary';
  /** Disabled state */
  disabled?: boolean;
  /** Click handler */
  onClick?: () => void;
}

// ═══════════════════════════════════════════════════════════════════════
// COMPONENT
// ═══════════════════════════════════════════════════════════════════════

/**
 * ComponentName - Brief description
 *
 * @example
 * ```tsx
 * <ComponentName variant="primary">
 *   Content here
 * </ComponentName>
 * ```
 */
export const ComponentName: React.FC<ComponentNameProps> = ({
  children,
  variant = 'default',
  disabled = false,
  onClick,
}) => {
  return (
    <Box
      padding="400"
      borderRadius="200"
      background={disabled ? 'bg-surface-disabled' : 'bg-surface'}
    >
      <BlockStack gap="200">
        <Text variant="headingSm" as="h3">
          Title
        </Text>
        <Text variant="bodyMd" as="p">
          {children}
        </Text>
      </BlockStack>
    </Box>
  );
};

// Default export for lazy loading
export default ComponentName;
```

---

## Implementation Roadmap

### Timeline Overview

```
Week 1                Week 2                Week 3                Week 4
┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐
│  🏗️ FOUNDATION  │   │  ✅ VALIDATION  │   │  📚 DOCS        │   │  🔄 MIGRATION   │
│                 │   │                 │   │                 │   │                 │
│  • Directory    │   │  • ESLint rules │   │  • Storybook    │   │  • Update       │
│    structure    │   │  • Pre-commit   │   │    setup        │   │    imports      │
│  • Barrel       │   │    hooks        │   │  • Write        │   │  • CI checks    │
│    exports      │   │  • TypeScript   │   │    stories      │   │  • Team         │
│  • Token        │   │    strict       │   │  • Usage        │   │    training     │
│    mapping      │   │  • Validator    │   │    guidelines   │   │                 │
│                 │   │    script       │   │                 │   │                 │
└─────────────────┘   └─────────────────┘   └─────────────────┘   └─────────────────┘
```

### Detailed Tasks

#### Week 1: Foundation

| # | Task | Priority | Effort |
|---|------|----------|--------|
| 1 | Create `src/design-system/` directory structure | 🔴 High | 2h |
| 2 | Set up barrel exports (index.ts files) | 🔴 High | 2h |
| 3 | Move/wrap existing Barn components | 🔴 High | 4h |
| 4 | Create token mapping file | 🔴 High | 3h |
| 5 | Add TypeScript path alias `@design-system` | 🟡 Medium | 1h |
| 6 | Create utility functions (cn, validators) | 🟡 Medium | 2h |

#### Week 2: Validation

| # | Task | Priority | Effort |
|---|------|----------|--------|
| 7 | Update ESLint with design-system rules | 🔴 High | 2h |
| 8 | Enable TypeScript strict mode | 🔴 High | 4h |
| 9 | Fix existing TypeScript errors | 🔴 High | 8h |
| 10 | Set up Lefthook pre-commit hooks | 🔴 High | 2h |
| 11 | Create validation script | 🟡 Medium | 3h |
| 12 | Add CI workflow for design system checks | 🟡 Medium | 2h |

#### Week 3: Documentation

| # | Task | Priority | Effort |
|---|------|----------|--------|
| 13 | Install and configure Storybook | 🔴 High | 3h |
| 14 | Write stories for form components | 🔴 High | 4h |
| 15 | Write stories for feedback components | 🔴 High | 3h |
| 16 | Write stories for layout components | 🟡 Medium | 3h |
| 17 | Create token documentation (colors, spacing) | 🟡 Medium | 3h |
| 18 | Write pattern documentation | 🟢 Low | 2h |

#### Week 4: Integration

| # | Task | Priority | Effort |
|---|------|----------|--------|
| 19 | Create import migration script | 🔴 High | 4h |
| 20 | Update high-traffic modules | 🔴 High | 8h |
| 21 | Add design system checks to CI pipeline | 🔴 High | 2h |
| 22 | Create contribution guidelines | 🟡 Medium | 2h |
| 23 | Team training session | 🟡 Medium | 2h |
| 24 | Document migration path for remaining modules | 🟢 Low | 2h |

---

## Quick Reference

### Import Cheatsheet

```typescript
// ✅ CORRECT - Single source import
import {
  Button,
  Text,
  BlockStack,
  Alert,
  Input,
  tokens
} from 'src/design-system';

// ❌ WRONG - Direct imports
import { Button } from '@shopify/polaris';
import { Alert } from 'barn/components/Alert';
import tokens from 'barn/tokens';
```

### Spacing Cheatsheet

```typescript
// Polaris gap values
<BlockStack gap="100">  {/* 4px - tight */}
<BlockStack gap="200">  {/* 8px - compact */}
<BlockStack gap="400">  {/* 16px - standard */}
<BlockStack gap="600">  {/* 24px - spacious */}
<BlockStack gap="800">  {/* 32px - section */}

// Token utility
tokens.gap(5)  // Returns '400' (16px)
```

### Typography Cheatsheet

```typescript
// Headings
<Text variant="heading2xl">Page Title</Text>      {/* 28px */}
<Text variant="headingLg">Section Title</Text>    {/* 20px */}
<Text variant="headingMd">Card Title</Text>       {/* 16px */}
<Text variant="headingSm">Subsection</Text>       {/* 14px */}

// Body
<Text variant="bodyLg">Large text</Text>          {/* 16px */}
<Text variant="bodyMd">Regular text</Text>        {/* 14px */}
<Text variant="bodySm">Small text</Text>          {/* 13px */}
```

### Color Cheatsheet

```typescript
// Semantic colors (Polaris CSS vars)
tokens.polaris.colors.primary    // Brand blue
tokens.polaris.colors.success    // Green
tokens.polaris.colors.warning    // Yellow
tokens.polaris.colors.critical   // Red

// Barn colors (for styled-components)
tokens.colors.greens[5]
tokens.colors.blues[3]
tokens.colors.greys[7]
```

---

## Success Metrics

| Metric | Target | Measurement |
|--------|--------|-------------|
| **Import Consistency** | 100% of new code | ESLint rule violations = 0 |
| **Type Safety** | Strict mode enabled | `tsc --noEmit` passes |
| **Documentation** | All components documented | Storybook coverage |
| **Pre-commit Quality** | All hooks pass | Commit success rate |
| **Accessibility** | WCAG AA | Storybook a11y addon |

---

## Resources

- [Shopify Polaris Documentation](https://polaris.shopify.com/)
- [Polaris Component Reference](https://polaris.shopify.com/components)
- [Polaris Design Tokens](https://polaris.shopify.com/tokens)
- [Barn Design System](https://barn.vercel.app)
- [Storybook Documentation](https://storybook.js.org/docs)

---

<div align="center">

**Built with 💚 for PushOwl**

</div>
