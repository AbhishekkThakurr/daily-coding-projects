# Photo Gallery (HTML/CSS)

A responsive six-tile photo gallery built with **pure HTML and CSS,
no JavaScript**. Each tile is a CSS gradient "photo" with a caption,
so the page works fully offline with no image files.

## What it does

Shows six places — Mountain, Beach, Forest, City, Desert and Snow —
in a grid that fits as many columns as the screen allows. Hovering a
tile zooms it slightly and adds a shadow. On small screens the tiles
stack in a single column.

## Concepts

- CSS Grid — `repeat(auto-fit, minmax(220px, 1fr))` makes the columns responsive without extra code
- `aspect-ratio: 4 / 3` — every tile keeps the same shape at any width
- Semantic HTML — `<figure>` and `<figcaption>` for each tile
- `linear-gradient` — one gradient "photo" per place, no image files needed
- `:hover` with `transform: scale(1.04)` and `box-shadow` — tiles lift on hover
- `transition` — smooth hover animation
- Flexbox — captions sit at the bottom of each tile
- Media query (`@media max-width: 520px`) — single column on small screens

## How to run

Open `index.html` in any browser — no build step, no server needed.
