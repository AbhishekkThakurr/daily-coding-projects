# Decimal to Binary Converter (Java)

Converts a non-negative decimal (base 10) number into binary (base 2)
by **repeated division by 2**.

## What it does

Reads a number and prints its binary form. The method: keep dividing
the number by 2 and collect the remainders; the remainders, read in
reverse order, give the binary digits. The result is cross-checked
against Java's built-in `Integer.toBinaryString()`.

## Concepts

- Repeated division: `n % 2` gives the next binary digit, `n / 2` shrinks the number
- `StringBuilder` with `append()` and `reverse()` — remainders come out last-digit-first
- `while` loop — runs until the number becomes 0
- Special case: input `0` converts to `"0"`
- Input validation — negative numbers are rejected with a clear message
- `Integer.toBinaryString()` — built-in cross-check of the manual result
- Command-line args (`java DecimalToBinary 13`) with a `Scanner` fallback

## How to run

```bash
javac DecimalToBinary.java
java DecimalToBinary 13
```

Or run without arguments and type the number when asked:

```bash
java DecimalToBinary
```

## Sample run

```
Decimal: 13
Binary:  1101
Check (Integer.toBinaryString): 1101  (match)
```

More examples: 10 → 1010, 42 → 101010, 255 → 11111111, 0 → 0.
