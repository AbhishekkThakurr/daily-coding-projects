# Caesar Cipher (Python)

Encrypts or decrypts a message by shifting every letter by a fixed
number of places in the alphabet — one of the oldest ciphers in
history (Julius Caesar reportedly used a shift of 3). Only letters are
shifted: spaces, digits and punctuation stay unchanged, and uppercase
stays uppercase. Decrypting is simply encrypting with the opposite
shift.

## Concepts

- Functions with one small job each (`shift_char`, `caesar`)
- `ord`/`chr` to convert between characters and numbers
- Modulo (`% 26`) so the shift wraps around from `z` back to `a`
- Building the result string with `"".join(...)` and a generator
- `argparse` for `--text`, `--shift` and `--decrypt` options, with typed input as a fallback

## How to run

```bash
python3 caesar_cipher.py --text "Hello World" --shift 3
python3 caesar_cipher.py --text "Khoor Zruog" --shift 3 --decrypt
python3 caesar_cipher.py            # asks for the message and shift
```

## Sample run

```
$ python3 caesar_cipher.py --text "Hello World" --shift 3
Encrypted (shift 3): Khoor Zruog

$ python3 caesar_cipher.py --text "Khoor Zruog" --shift 3 --decrypt
Decrypted (shift 3): Hello World
```

The shift wraps around the end of the alphabet, and non-letters are
left alone:

```
$ python3 caesar_cipher.py --text "Attack at Dawn! 123" --shift 5
Encrypted (shift 5): Fyyfhp fy Ifbs! 123

$ python3 caesar_cipher.py --text "xyz XYZ" --shift 3
Encrypted (shift 3): abc ABC
```
