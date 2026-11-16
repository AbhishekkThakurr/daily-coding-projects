# Word Frequency Counter (Python)

Counts how many times each word appears in a sentence and prints the words from most to least frequent.

## Concepts

- Dictionaries for counting (`collections.Counter`)
- `str.lower()` and `str.split()` to normalise and break a sentence into words
- Sorting results with `Counter.most_common()`
- Functions and the `if __name__ == "__main__":` guard

## How it works

The sentence is lower-cased (so "Java" and "java" count as the same word) and split into words. A `Counter` dictionary tallies each word, and `most_common()` returns the words ordered by frequency.

## How to run

```bash
python3 word_frequency.py
```

## Sample run

```
Sentence: java is fun and java is powerful and python is fun too

Word frequencies (most frequent first):
  is: 3
  java: 2
  fun: 2
  and: 2
  powerful: 1
  python: 1
  too: 1
```
