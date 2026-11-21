# GCD Calculator (Java)

Finds the Greatest Common Divisor of two numbers using the **Euclidean algorithm**.

## What it does

Reads two integers from the user and prints their GCD — the largest number that divides both of them without leaving a remainder.

## Concepts

- Euclidean algorithm: `gcd(a, b) = gcd(b, a % b)`, repeated until the remainder is 0
- `while` loop
- `Math.abs()` — so negative inputs work too
- `Scanner` for console input
- Methods — the GCD logic lives in its own `gcd()` method

## How to run

```bash
javac GcdCalculator.java
java GcdCalculator
```

## Sample run

```
Enter first number: 48
Enter second number: 18
GCD of 48 and 18 is: 6
```

More examples: GCD of 17 and 13 is 1, GCD of 0 and 5 is 5.
