# Simple Calculator UI (HTML/CSS)

A clean, static calculator layout — display on top, a 4-column keypad
below. The keys are styled (orange operators, red clear, green equals)
and have a small press effect on click.

This is a front-end-only layout: there is no JavaScript yet, so the keys
do not calculate. Wiring the keys up with JS would be a natural next step.

## Concepts

- CSS Grid (`grid-template-columns: repeat(4, 1fr)`) for the keypad
- `grid-column: span 2` so the 0 key is twice as wide, like a real calculator
- Flexbox to centre the calculator on the page
- `:hover` and `:active` with `transform: scale()` for the press effect
- `box-sizing: border-box` so padding stays inside the set widths

## How to run

Open `index.html` in any browser — no server or build step needed.
