# Fibonacci Series (Java)

Prints the first N terms of the Fibonacci series, where each term is the sum
of the two terms before it: 0, 1, 1, 2, 3, 5, 8, ...

## Concepts

- `for` loop
- Variables and swapping values with a temporary variable
- `long` type (Fibonacci numbers grow fast)
- Command-line arguments (`args[0]` sets the number of terms)

## How to run

```bash
javac FibonacciSeries.java
java FibonacciSeries        # default: 10 terms
java FibonacciSeries 5      # first 5 terms
```

## Sample run

```
$ java FibonacciSeries
Fibonacci series (10 terms): 0, 1, 1, 2, 3, 5, 8, 13, 21, 34

$ java FibonacciSeries 5
Fibonacci series (5 terms): 0, 1, 1, 2, 3
```
