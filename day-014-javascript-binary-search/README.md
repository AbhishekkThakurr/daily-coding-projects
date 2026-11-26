# Binary Search (JavaScript)

Searches for a value in a **sorted** array by repeatedly halving the search
range — the classic divide-and-conquer search taught in every DSA course.
Time complexity: O(log n).

## What it does

Given a sorted array and a target value, it finds the index of the target
(or reports "not found") using two versions of the same idea:

1. **Iterative** — a `while` loop with `low`, `high`, and `mid` pointers.
2. **Recursive** — the function calls itself on the left or right half.

Both versions print the same result, so you can compare the two styles.

## Concepts used

- Functions (`binarySearchIterative`, `binarySearchRecursive`, `report`)
- `while` loop with low/high pointers
- Recursion (base case + recursive calls on halves)
- `Math.floor` for the middle index
- `process.argv` to read the target (and optionally a custom array) from the command line
- `Array.sort` with a numeric comparator when a custom array is given

## How to run

Search the built-in sorted array `[10, 20, 30, 40, 50, 60, 70]`:

```bash
node binary-search.js 30
```

Search your own array (it is sorted for you first):

```bash
node binary-search.js 7 3 1 7 9 5
```

With no arguments it runs three built-in examples:

```bash
node binary-search.js
```

## Sample run

```text
$ node binary-search.js
Array: [10, 20, 30, 40, 50, 60, 70]
Searching for: 30
Iterative result: found at index 2
Recursive result: found at index 2

Array: [10, 20, 30, 40, 50, 60, 70]
Searching for: 70
Iterative result: found at index 6
Recursive result: found at index 6

Array: [10, 20, 30, 40, 50, 60, 70]
Searching for: 25
Iterative result: not found
Recursive result: not found
```
