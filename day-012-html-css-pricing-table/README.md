# Pricing Table (HTML/CSS)

A clean three-plan pricing page — Basic, Pro and Premium — built with
**pure HTML and CSS, no JavaScript**.

## What it does

Shows three pricing cards side by side, with the middle (Pro) plan
highlighted as "Most Popular". Each card lists its price, features and a
call-to-action button. On small screens the cards stack vertically.

## Concepts

- Flexbox — `.plans` lays the three cards out in a row; `flex-wrap` lets them stack
- `flex-grow` — makes the feature list fill the card so buttons line up
- `:hover` with `transform: translateY(-6px)` — cards lift on hover
- `transition` — smooth hover animation
- `position: absolute` — the "Most Popular" badge sits on the featured card's border
- Media query (`@media max-width: 640px`) — stacks cards on small screens
- `box-sizing: border-box` — padding stays inside the card width

## How to run

Open `index.html` in any browser — no build step, no server needed.
