#!/usr/bin/env python3
"""
Word Frequency Counter — count how many times each word appears in a sentence.

How it works: the sentence is lower-cased and split into words, then a
dictionary tallies each word. Finally the words are printed from most
to least frequent, so the most repeated word comes first.

Run:  python3 word_frequency.py
"""

from collections import Counter


def word_frequency(text):
    """Return a list of (word, count) pairs, most frequent first."""
    words = text.lower().split()
    return Counter(words).most_common()


def main():
    sentence = "java is fun and java is powerful and python is fun too"
    print("Sentence:", sentence)
    print()
    print("Word frequencies (most frequent first):")
    for word, count in word_frequency(sentence):
        print(f"  {word}: {count}")


if __name__ == "__main__":
    main()
