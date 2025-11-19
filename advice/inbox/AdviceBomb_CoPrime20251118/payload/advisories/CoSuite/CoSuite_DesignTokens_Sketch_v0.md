# CoSuite Design Tokens Sketch v0

**From**: Products look & feel mobile session  
**To**: CoPrime20251118 (Co1)  
**Purpose**: Provide a concrete starter sketch of color, typography, spacing, and component tokens that can be translated directly into code.

This file is intentionally simple and opinionated. Co1 can adjust values, rename tokens, or split this into separate files (e.g., `colors`, `typography`, `spacing`). It is meant as a **quick-start scaffold**, not a final system.

---

## 1. Color token sketch

These are suggested **example values** only. Co1 can swap them for actual brand decisions.

```jsonc
{
  "color": {
    "cs-neutral-100": "#F5F7FA",
    "cs-neutral-200": "#E4E7EB",
    "cs-neutral-300": "#CBD2E0",
    "cs-neutral-400": "#9AA5B1",
    "cs-neutral-600": "#52606D",
    "cs-neutral-800": "#102A43",

    "cs-accent-civic": "#2C7BE5",   // civic primary
    "cs-accent-human": "#F76C5E",   // human accent

    "cs-status-success": "#2EBD85",
    "cs-status-warning": "#F2C94C",
    "cs-status-danger":  "#EB5757",
    "cs-status-info":    "#2D9CDB"
  }
}
```

Co1 can convert this into Tailwind config, CSS variables, or a tokens JSON file in a design-system repo.

---

## 2. Typography token sketch

Example typography definitions in CSS-ish form:

```jsonc
{
  "typography": {
    "cs-font-family-base": "'Inter', system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif",
    "cs-font-family-mono": "'JetBrains Mono', ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, 'Liberation Mono', 'Courier New', monospace",

    "cs-font-h1": { "fontSize": "1.9rem", "fontWeight": 700, "lineHeight": 1.2 },
    "cs-font-h2": { "fontSize": "1.5rem", "fontWeight": 600, "lineHeight": 1.3 },
    "cs-font-h3": { "fontSize": "1.2rem", "fontWeight": 500, "lineHeight": 1.35 },
    "cs-font-body": { "fontSize": "1.0rem", "fontWeight": 400, "lineHeight": 1.5 },
    "cs-font-meta": { "fontSize": "0.85rem", "fontWeight": 400, "lineHeight": 1.4 }
  }
}
```

Again, values are placeholders and can be tuned by Co1 or any future dedicated design lead.

---

## 3. Spacing and radius token sketch

```jsonc
{
  "spacing": {
    "cs-space-xxs": 4,
    "cs-space-xs":  8,
    "cs-space-sm":  12,
    "cs-space-md":  16,
    "cs-space-lg":  24,
    "cs-space-xl":  32,
    "cs-space-xxl": 40
  },
  "radius": {
    "cs-radius-sm": 4,
    "cs-radius-md": 8,
    "cs-radius-lg": 16
  },
  "shadow": {
    "cs-shadow-sm": "0 1px 2px rgba(15, 23, 42, 0.06)",
    "cs-shadow-md": "0 4px 12px rgba(15, 23, 42, 0.10)"
  }
}
```

---

## 4. Component token sketch

This section hints at how tokens might be applied to core components. Co1 can translate this into actual component code or Storybook stories.

```jsonc
{
  "components": {
    "buttonPrimary": {
      "backgroundColor": "{color.cs-accent-civic}",
      "textColor": "#FFFFFF",
      "borderRadius": "{radius.cs-radius-md}",
      "paddingX": "{spacing.cs-space-md}",
      "paddingY": "{spacing.cs-space-xs}",
      "font": "{typography.cs-font-body}"
    },
    "buttonSecondary": {
      "backgroundColor": "transparent",
      "borderColor": "{color.cs-accent-civic}",
      "textColor": "{color.cs-accent-civic}",
      "borderRadius": "{radius.cs-radius-md}",
      "paddingX": "{spacing.cs-space-md}",
      "paddingY": "{spacing.cs-space-xs}",
      "font": "{typography.cs-font-body}"
    },
    "card": {
      "backgroundColor": "{color.cs-neutral-200}",
      "borderRadius": "{radius.cs-radius-md}",
      "padding": "{spacing.cs-space-md}",
      "shadow": "{shadow.cs-shadow-sm}"
    },
    "tag": {
      "borderRadius": "{radius.cs-radius-sm}",
      "paddingX": "{spacing.cs-space-xs}",
      "paddingY": 2,
      "font": "{typography.cs-font-meta}"
    }
  }
}
```

---

## 5. How Co1 might evolve this

Suggested steps for Co1:

1. Decide on final brand colors (or hand this to a design collaborator).
2. Adjust these token values accordingly.
3. Store tokens in a centralized design-system module (e.g., `@cosuite/design-tokens`).
4. Update at least one product (recommended: CoAgent) to consume these tokens instead of ad-hoc styles.
5. Over time, migrate other products to the same token source.

This file can be safely edited, split, or superseded once a more robust design-tokens implementation is in place.
