# LCM Calculator (Java)

Finds the Least Common Multiple of two numbers using the **GCD formula**:
`lcm(a, b) = |a * b| / gcd(a, b)`.

## What it does

Reads two integers and prints both their GCD and their LCM — the smallest
positive number divisible by both of them.

## Concepts

- Euclidean algorithm for GCD: `gcd(a, b) = gcd(b, a % b)` until the remainder is 0
- LCM from GCD: `lcm(a, b) = |a * b| / gcd(a, b)`
- `long` — so the product does not overflow for ordinary inputs
- `Math.abs()` — so negative inputs work too
- Command-line args (`java LcmCalculator 12 18`) with a `Scanner` fallback
- Methods — the GCD and LCM logic each live in their own method

## How to run

```bash
javac LcmCalculator.java
java LcmCalculator 12 18
```

Or run without arguments and type the numbers when asked:

```bash
java LcmCalculator
```

## Sample run

```
GCD of 12 and 18 is: 6
LCM of 12 and 18 is: 36
```

More examples: LCM of 7 and 5 is 35, LCM of 48 and 18 is 144, LCM of 0 and 5 is 0.
