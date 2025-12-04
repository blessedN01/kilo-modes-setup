# **shadcn Figma Guidelines**

structured **Figma Guidelines Setup** for implementing **shadcn design principles**

## 1. Grids & Layout
- **Desktop Frame Preset:** 1440px width.
- **Grid System:** 12 columns, 72px gutters, 24px margins.
- **Base Unit:** 4px.

✅ _Add Layout Grids to every frame._  
✅ _Use Auto Layout for sections and components._

---

## 2. Typography
- **Font:** `Inter` (fallback: system sans-serif).
- **Styles:**
  - Heading 1 — 48px / 600 weight / 1.2 line-height
  - Heading 2 — 36px / 600
  - Heading 3 — 28px / 600
  - Body Text — 16px / 400 / 1.5 line-height
  - Caption — 14px / 400

✅ _Create Text Styles in Figma: H1, H2, H3, Body, Caption._  
✅ _Ensure consistent letter-spacing (0.5%)._

---

## 3. Color Styles
- **Primary Grays:** 
  - Gray 50 `#F8FAFC`
  - Gray 100 `#F1F5F9`
  - Gray 900 `#0F172A`
- **Accent:** 
  - Blue 600 `#2563EB`
- **Backgrounds:**
  - Light: `#FFFFFF`
  - Dark Mode Base: `#020617`

✅ _Create Color Styles: Primary, Secondary, Accent, Error, Background._  
✅ _Use contrast check plugin to ensure WCAG AA compliance._

---

## 4. Components
- **Corner Radii:** 
  - Small elements: 4px
  - Buttons/Inputs: 6px
  - Cards/Modals: 8px
- **Elevation:** 
  - Soft Shadow for Cards: 0px 4px 6px rgba(0, 0, 0, 0.1)
- **Button States:**
  - Default → Hover → Focus → Disabled

✅ _Use Variants in Figma for components (e.g., Button: Default, Hover, Focus)._  
✅ _Define Auto Layout Padding for buttons and cards (e.g., 12px vertical padding)._

---

## 5. Spacing System
- **Spacing Tokens:**
  - 4px, 8px, 12px, 16px, 24px, 32px, 48px, 64px
- **Spacing Rules:**
  - Padding inside cards: 24px
  - Section spacing: 48px–64px

✅ _Create a "Spacing Token" component set._  
✅ _Use consistent vertical spacing between sections._

---

## 6. Motion
- **Interaction Timings:**
  - Fast Micro-interaction: 150ms
  - Modal/Overlay transitions: 200ms fade/slide.
- **Easing:** `ease-in-out`

✅ _Use Figma's Smart Animate for button hover/focus transitions._  
✅ _Add Fade and Slide animations to Modals and Dropdowns._

---

## 7. Design Tokens (Optional Advanced)
If you're scaling:
- Export tokens via Figma plugins like **Figma Tokens**.
- Define colors, typography, border-radius, spacing tokens for use across codebases.

✅ _Enable multi-theme support (Light/Dark) with tokenized styles._

---

# 🎨 Summary for Setting Up Your Figma File
| Element              | Action                                     |
|----------------------|--------------------------------------------|
| Layout Grid          | 12 columns, 24px margins, 4px base         |
| Typography Styles    | H1, H2, H3, Body, Caption (Inter Font)     |
| Color Styles         | Primary, Accent, Background, Error        |
| Components           | Variants + Auto Layout + 6-8px Radius      |
| Spacing System       | 4px-64px consistent padding/margins       |
| Interaction Styles   | 150-200ms motion w/ ease-in-out            |

---
 