"""
Caesar Cipher
-------------
Encrypts or decrypts a message by shifting every letter forward (or
backward) by a fixed number of places in the alphabet. It is one of
the oldest ciphers — Julius Caesar reportedly used a shift of 3.

Only letters are shifted; spaces, digits and punctuation stay as they
are, and letter case is preserved. Decrypting is just encrypting with
the opposite shift.

Concepts: functions, ord/chr, modulo wrap-around, string building,
argparse command-line options, input validation.

Run:   python3 caesar_cipher.py --text "Hello World" --shift 3
       python3 caesar_cipher.py --text "Khoor Zruog" --shift 3 --decrypt
       python3 caesar_cipher.py          (asks for text and shift)
"""

import argparse
import sys

ALPHABET_SIZE = 26


def shift_char(ch, shift):
    """Shift one character; non-letters are returned unchanged."""
    if "a" <= ch <= "z":
        base = ord("a")
    elif "A" <= ch <= "Z":
        base = ord("A")
    else:
        return ch
    return chr((ord(ch) - base + shift) % ALPHABET_SIZE + base)


def caesar(text, shift):
    """Encrypt text with the given shift (use a negative shift to decrypt)."""
    shift %= ALPHABET_SIZE
    return "".join(shift_char(ch, shift) for ch in text)


def main():
    parser = argparse.ArgumentParser(description="Caesar cipher encrypt/decrypt.")
    parser.add_argument("--text", default=None, help="message to encrypt or decrypt")
    parser.add_argument("--shift", type=int, default=None,
                        help="number of places to shift (any integer)")
    parser.add_argument("--decrypt", action="store_true",
                        help="decrypt instead of encrypt")
    args = parser.parse_args()

    text = args.text
    shift = args.shift

    if text is None:
        text = input("Enter the message: ")
    if shift is None:
        try:
            shift = int(input("Enter the shift (e.g. 3): "))
        except ValueError:
            print("The shift must be a whole number.")
            return 1

    if args.decrypt:
        result = caesar(text, -shift)
        print(f"Decrypted (shift {shift}): {result}")
    else:
        result = caesar(text, shift)
        print(f"Encrypted (shift {shift}): {result}")
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except (EOFError, KeyboardInterrupt):
        print("\nStopped.")
        sys.exit(1)
