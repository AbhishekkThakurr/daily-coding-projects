# Sum of Digits (C)

Reads an integer and prints the sum of its digits. Negative numbers are
handled by using their absolute value, and 0 correctly gives a sum of 0.

## Concepts

- `while` loop with digit extraction (`n % 10` takes the last digit, `n / 10` drops it)
- `llabs()` from `<stdlib.h>` for the absolute value of a `long long`
- Input validation with the return value of `scanf`

## How to run

```bash
gcc -o sum_of_digits sum_of_digits.c
./sum_of_digits
```

## Sample run

```
Enter an integer: 12345
Sum of digits of 12345 is 15
```

More examples:

```
Enter an integer: -987
Sum of digits of -987 is 24

Enter an integer: 0
Sum of digits of 0 is 0
```
