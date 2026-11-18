# Armstrong Number Checker (Java)

Checks whether a number is an **Armstrong number** — a number that equals
the sum of its own digits, each raised to the power of the number of digits.

Example: `153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153`

## Concepts

- `while` loop and `%` / `/` to split a number into digits
- `Math.pow()` for the digit powers
- Methods (`countDigits`, `isArmstrong`) to keep the logic reusable
- Command-line arguments (`args`); with no argument it lists every
  Armstrong number from 1 to 1000

## How to run

```bash
javac ArmstrongNumber.java
java ArmstrongNumber 153        # check one number
java ArmstrongNumber            # list all Armstrong numbers up to 1000
```

## Sample run

```
$ java ArmstrongNumber 153
153 is an Armstrong number.

$ java ArmstrongNumber 9474
9474 is an Armstrong number.

$ java ArmstrongNumber 123
123 is NOT an Armstrong number.

$ java ArmstrongNumber
Armstrong numbers from 1 to 1000:
1 2 3 4 5 6 7 8 9 153 370 371 407
```
