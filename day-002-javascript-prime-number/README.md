# Prime Number Checker (JavaScript)

Checks whether a number is prime. Tests a list of numbers by default, or a
single number passed on the command line.

## Concepts

- Functions (`isPrime`)
- Early returns
- The square-root optimisation: a divisor larger than √n would pair with a
  smaller one, so testing up to √n is enough
- `process.argv` for command-line input

## How to run

```bash
node prime.js
node prime.js 29
```

## Sample run

```text
$ node prime.js
2 is prime
7 is prime
10 is not prime
13 is prime
25 is not prime
29 is prime
97 is prime
100 is not prime

$ node prime.js 29
29 is prime
```
