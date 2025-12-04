# **shadcn UI/UX Design System**

## 1. Geometry & Layout
- **Use a 12-column grid** with 4px baseline increments.
- **Align primary content** center-aligned at max-width `1280px` (`w-full max-w-7xl` in Tailwind).
- **Apply vertical margins** between sections: 48px–64px on desktop, 32px on mobile.
- **Avoid asymmetry** unless intentionally highlighting an element.

## 2. Typography
- **Set the base font** to `Inter` or `Sans` at 16px body size.
- **Heading Scale:**
  - H1: 48px / Bold
  - H2: 36px / Semibold
  - H3: 28px / Semibold
  - Body: 16px / Regular
- **Apply 1.5 line-height** for all body text.
- **Never mix more than two font weights** on the same view.

## 3. Color Palette
- **Primary Gray Scale:** `#F8FAFC` to `#0F172A` (gray-50 to gray-900).
- **Accent Colors:** Pick muted brand colors (e.g., `blue-600`, `indigo-700`) sparingly.
- **Use ≥ 4.5:1 contrast ratio** for body text/background.
- **Dark Mode:** Invert backgrounds to dark grays (`#020617`) and text to near-white.

## 4. Backgrounds
- **Keep background flat** — solid color (`bg-white` or `bg-slate-50`) or subtle gradient (`from-slate-50 to-slate-100`).
- **Apply light shadows** only for cards and popups (`shadow-md`, `shadow-lg`).
- **Blurred overlays** (e.g., `backdrop-blur-sm`) for modals and navbars only.

## 5. Corner Radius
- **Default radius:** `rounded-md` (6px).
- **Cards/Modals:** `rounded-lg` (8px).
- **Small buttons/inputs:** `rounded-sm` (4px).
- **Psychological Principle:** Small curves = sharper, focused; Large curves = friendly, inviting.

## 6. Spacing System
- **Base scale:** 4px.
- **Standard increments:** 4/8/12/16/24/32/48/64px.
- **Apply consistent internal padding:** 
  - Buttons: 12px vertical / 20px horizontal.
  - Inputs: 12px padding all sides.
- **At breakpoints** (`sm`, `md`, `lg`), double vertical paddings progressively.

## 7. Interactive Elements
- **Hover:** 
  - Background-color opacity shift (`opacity-90`) or slight color darkening.
  - Add 2%–5% `scale` on hover for buttons.
- **Focus:** Always outline buttons/inputs with `outline-ring` at 2px thickness.
- **Animation Timing:** 150ms–200ms, `ease-in-out`.
- **Framer Motion Preset:** For page loads and transitions, use 0.2s fade + slide-up animation.

## 8. Design Philosophy
- **Prioritize function over decoration.**
- **Components must work unstyled.** Style enhancement is additive, not mandatory.
- **Minimalism ≠ emptiness:** Fill space meaningfully; don't leave blank screens.
- **Avoid heavy shadows, large gradients, or over-animation.**
- **Shadcn ≠ Tailwind UI:** Build **custom-first** components; **Shadcn is raw, expandable.**
- **Shadcn ≠ Material Design:** No pre-baked elevations, density rules, or forced structures — **you define UX patterns**.

---

**Reference Links:**  
- [Official shadcn/ui Docs](https://ui.shadcn.com/docs)  
- [Styling and Theming in shadcn-ui](https://www.newline.co/@eyalcohen/styling-and-theming-in-shadcn-ui-how-to-apply-themes-and-customize-styles--5299464e)  
- [Material Design vs shadcn Comparison](https://djangostars.com/blog/shadcn-ui-and-material-design-comparison/)

---
