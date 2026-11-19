# Leap Year Checker (Python)

Checks whether a year entered by the user is a leap year, using the real
Gregorian calendar rule: divisible by 400, or divisible by 4 but not by 100.
That is why 2000 is a leap year but 1900 is not.

## Concepts
- Functions and return values
- The modulo operator (`%`) for divisibility checks
- `if` / `elif` logic in the right order (400 first, then 100, then 4)
- f-strings for output

## How to run
```bash
python3 leap_year.py
```

## Sample run
```
Enter a year: 2024
2024 is a leap year.
```
```
Enter a year: 1900
1900 is not a leap year.
```
```
Enter a year: 2000
2000 is a leap year.
```
```
Enter a year: 2025
2025 is not a leap year.
```
