# Simple Interest Calculator

Calculates simple interest and the total amount from a principal, an annual
interest rate, and a time period in years.

## Concepts

- Functions (`simpleInterest`)
- `process.argv` for command-line arguments
- `parseFloat` and `isNaN` for input validation
- `toFixed(2)` for clean money formatting

## How to run

```bash
node simple-interest.js <principal> <rate> <time-in-years>
```

Example:

```bash
node simple-interest.js 10000 5 2
```

## Sample run

```
Principal : Rs. 10000.00
Rate      : 5% per year
Time      : 2 year(s)
Interest  : Rs. 1000.00
Total     : Rs. 11000.00
```

Formula used: Interest = (Principal × Rate × Time) / 100
