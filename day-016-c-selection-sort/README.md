# Selection Sort (C)

Sorts a list of integers in ascending order using the selection sort
algorithm. On each pass it finds the smallest element in the still
unsorted part of the array and swaps it into place, so after pass 1 the
smallest number is first, after pass 2 the second smallest is second,
and so on.

You can give the numbers as command-line arguments, or run it with no
arguments and type them when asked.

## Concepts

- Arrays and nested loops (outer loop = position being filled, inner loop = search for the minimum)
- Tracking the index of the minimum element instead of the value
- Swapping two elements with a temporary variable
- `argc`/`argv` with `atoi` for command-line input, `scanf` for typed input

## How to run

```bash
gcc selection_sort.c -o selection_sort
./selection_sort 64 25 12 22 11
./selection_sort            # then type the numbers
```

## Sample run

```
$ ./selection_sort 64 25 12 22 11
Before sorting: 64 25 12 22 11
After sorting:  11 12 22 25 64
```

Negative numbers work too:

```
$ ./selection_sort -5 0 -1 42 7
Before sorting: -5 0 -1 42 7
After sorting:  -5 -1 0 7 42
```
