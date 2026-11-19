# Reverse a String (C)

Reads a string from the user and prints it reversed, using the classic
two-pointer swap: one pointer starts at the first character, the other at
the last, and they swap characters while moving towards the middle.

## Concepts
- Character arrays (`char str[100]`) and strings in C
- `fgets` for safe input, `strlen` from `<string.h>`
- Two-pointer technique and swapping with a temporary variable
- Removing the trailing newline with `strcspn`

## How to run
```bash
gcc -o reverse_string reverse_string.c
./reverse_string
```

## Sample run
```
Enter a string: hello
Reversed string: olleh
```
```
Enter a string: Lucifer
Reversed string: reficuL
```
