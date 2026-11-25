# Vowel and Consonant Counter (C)

Reads one line of text and counts its vowels and consonants. Digits,
spaces and punctuation are not letters, so they are counted separately
as "other characters".

## Concepts

- `fgets` for safe line input (no buffer overflow like `gets`)
- `ctype.h`: `isalpha` to test for letters, `tolower` for case-insensitive checks
- `switch` with fall-through cases for the five vowels
- `strcspn` to strip the trailing newline from `fgets`

## How to run

```bash
gcc vowel_consonant_counter.c -o vowel_consonant_counter
./vowel_consonant_counter
```

## Sample run

```
Enter a sentence: Hello World 123
Text: "Hello World 123"
Vowels: 3
Consonants: 7
Other characters: 5
```

(Hello World has vowels e, o, o = 3; consonants H, l, l, W, r, l, d = 7;
the 2 spaces and 3 digits make 5 other characters.)
