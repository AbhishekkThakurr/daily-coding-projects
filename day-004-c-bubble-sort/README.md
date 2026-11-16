# Bubble Sort (C)

Sorts a list of numbers in ascending order using bubble sort.

## Concepts

- Arrays and passing an array to a function
- Nested loops — one pass per element, one comparison per pair
- Swapping two values with a temporary variable
- The `swapped` flag: if a full pass makes no swap, the array is already sorted and the loop stops early

## How it works

Each pass walks through the array comparing neighbouring numbers and swapping them when they are in the wrong order. After each pass the largest unsorted number "bubbles" to its correct place at the end, so the next pass can stop one step earlier.

## How to run

```bash
gcc bubble_sort.c -o bubble_sort
./bubble_sort
```

## Sample run

```
Before sorting: 64 34 25 12 22 11 90
After sorting:  11 12 22 25 34 64 90
```
