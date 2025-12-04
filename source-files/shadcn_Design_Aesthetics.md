# shadcn/ui Design Brief: Core UI/UX Aesthetics

## 1. Geometry & Layout

**Implementation Instructions:**
- Use a 12-column grid system with 16px gutters between columns
- Set container max-widths at: SM (640px), MD (768px), LG (1024px), XL (1280px), 2XL (1536px)
- Maintain 24px padding on containers at mobile sizes, increasing to 32px at desktop
- Create component frames with consistent dimensions: buttons (h: 40px), form inputs (h: 44px)
- Keep content container width at 65-70 characters (~600px) for optimal readability
- Implement asymmetry by using a content-to-sidebar ratio of 2:1 in dashboard layouts

## 2. Typography

**Implementation Instructions:**
- Install Inter as the primary font family with these weights: 400 (regular), 500 (medium), 600 (semibold), 700 (bold)
- Set font sizes using this scale: body (14px/0.875rem), h6 (16px/1rem), h5 (18px/1.125rem), h4 (20px/1.25rem), h3 (24px/1.5rem), h2 (30px/1.875rem), h1 (36px/2.25rem)
- Apply these line heights: headings (1.2), body text (1.5), small text (1.4)
- Use font weights strategically: headings (600/700), body (400), UI labels (500)
- Set letter spacing: -0.025em for headings, normal for body text
- Implement a proper hierarchical structure with no more than 3 levels of headings per page

## 3. Color Palette

**Implementation Instructions:**
- Primary palette: Slate-50 (#f8fafc) to Slate-950 (#020617) for neutrals, plus an accent color of your choice
- Use specific semantic colors:
  * Primary: #0ea5e9 (sky-500)
  * Success: #22c55e (green-500)
  * Warning: #f59e0b (amber-500)
  * Destructive: #ef4444 (red-500)
  * Muted: slate-200 (light mode), slate-800 (dark mode)
- Apply a 10-step gradient for each color ranging from 50 (lightest) to 950 (darkest)
- Ensure all text meets WCAG AA standards: 4.5:1 for normal text, 3:1 for large text
- Set up CSS variables in a root scope that can be easily modified for theming:
  ```css
  :root {
    --background: hsl(0 0% 100%);
    --foreground: hsl(222.2 84% 4.9%);
    --primary: hsl(221.2 83.2% 53.3%);
    --primary-foreground: hsl(210 40% 98%);
    /* Add additional variables for all semantic colors */
  }
  ```

## 4. Backgrounds

**Implementation Instructions:**
- Primary backgrounds: white (#ffffff) for light mode, slate-950 (#020617) for dark mode
- Secondary surfaces: slate-50 (#f8fafc) for light mode, slate-900 (#0f172a) for dark mode
- Add subtle depth with shadow scales:
  * xs: `0 1px 2px rgba(0, 0, 0, 0.05)`
  * sm: `0 1px 3px rgba(0, 0, 0, 0.1), 0 1px 2px rgba(0, 0, 0, 0.06)`
  * md: `0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06)`
  * lg: `0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05)`
- Implement card backgrounds with 1px borders: light mode (white bg, slate-200 border), dark mode (slate-800 bg, slate-700 border)
- Use background blur of 8px with 40% opacity for overlay elements like dialogs and dropdowns

## 5. Corner Radius

**Implementation Instructions:**
- Implement this corner radius scale:
  * none: 0px
  * sm: 2px
  * DEFAULT: 4px
  * md: 6px
  * lg: 8px
  * xl: 12px
  * full: 9999px
- Apply radius consistently:
  * Buttons, input fields: radius-md (6px)
  * Cards, dialogs: radius-lg (8px)
  * Pills, tags: radius-full
  * Alert banners: radius-DEFAULT (4px)
  * Nested elements (button groups): radius-sm (2px) for inner elements
- Never mix more than 3 different radius values on the same screen to maintain visual harmony

## 6. Spacing System

**Implementation Instructions:**
- Base spacing unit: 4px (0.25rem)
- Apply this spacing scale:
  * 0: 0px
  * 1: 4px (0.25rem)
  * 2: 8px (0.5rem)
  * 3: 12px (0.75rem)
  * 4: 16px (1rem)
  * 5: 20px (1.25rem)
  * 6: 24px (1.5rem)
  * 8: 32px (2rem)
  * 10: 40px (2.5rem)
  * 12: 48px (3rem)
  * 16: 64px (4rem)
- Use consistent spacing for:
  * Button padding: px-4 py-2 (16px horizontal, 8px vertical)
  * Form field spacing: mb-4 (16px bottom margin)
  * Section spacing: my-8 (32px vertical margin)
  * Container padding: p-6 (24px all sides)
  * Component groups: gap-2 (8px gap between items)
- Scale spacing down by 25% on mobile devices (below 640px width)

## 7. Interactive Elements

**Implementation Instructions:**
- Button states:
  * Default: Solid fill with contrasting text
  * Hover: 10% darker fill, cursor: pointer
  * Active/Pressed: 15% darker fill, translate-y: 1px
  * Focus: 2px outline in primary color at 50% opacity, offset by 2px
  * Disabled: 40% opacity, cursor: not-allowed
- Animation timings:
  * Quick interactions (buttons, toggles): 150ms
  * Expansion/collapse: 200-250ms
  * Enter/exit transitions: 300ms
- Use CSS transitions with ease-out for entrances, ease-in-out for state changes
- Implement hover transitions on all interactive elements with transform-origin appropriate to the interaction (bottom for dropdown triggers, center for buttons)
- Provide visible feedback on all user interactions with at least 2 visual properties changing (e.g., color + scale)

## 8. Design Philosophy & Implementation

**Implementation Instructions:**
- Prioritize component isolation with zero external dependencies
- Structure components using compound patterns (e.g., Dialog.Root, Dialog.Trigger, Dialog.Content)
- Keep component props minimal but flexible (prefer children over content props)
- Implement variants using cva (class-variance-authority):
  ```tsx
  const buttonVariants = cva(
    "inline-flex items-center justify-center rounded-md text-sm font-medium transition-colors focus-visible:outline-none",
    {
      variants: {
        variant: {
          default: "bg-primary text-primary-foreground hover:bg-primary/90",
          secondary: "bg-secondary text-secondary-foreground hover:bg-secondary/80",
          outline: "border border-input bg-background hover:bg-accent",
          // Add more variants
        },
        size: {
          default: "h-10 py-2 px-4",
          sm: "h-9 px-3",
          lg: "h-11 px-8",
        },
      },
      defaultVariants: {
        variant: "default",
        size: "default",
      },
    }
  )
  ```
- Use CSS custom properties for theming rather than hardcoded values
- Maintain a tokens.json file for design token configuration
- Implement responsive design using mobile-first approach with breakpoints at 640px, 768px, 1024px, and 1280px

### References:
 https://go.lightnode.com/tech/shadcn-ui [2] https://ui.shadcn.com/docs [3] https://manupa.dev/blog/anatomy-of-shadcn-ui [4] https://www.shadcndesign.com [5] https://dev.to/gimkelum/exploring-the-shadcn-ui-library-a-comprehensive-guide-4l0b [6] https://gist.github.com/eonist/fc3ae41d70d38af42db462015fece5a2 [7] https://www.achrafgarai.com/understanding-shadcn-for-ui-designers/ [8] https://www.reddit.com/r/react/comments/1gqirzv/how_do_i_use_shadcnui_according_to_best_practices/