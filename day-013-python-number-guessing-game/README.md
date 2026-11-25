# Number Guessing Game (Python)

The computer picks a secret number between 1 and 100 and you get 10
attempts to guess it. After each wrong guess the game tells you whether
the secret number is higher or lower. Typing something that is not a
number, or a number outside 1–100, does not cost an attempt.

## Concepts

- `random.randint` to pick the secret number
- `while` loop with a fixed attempt limit
- `try`/`except` for input validation (`ValueError`, `EOFError`)
- f-strings for the hints and result messages
- `argparse` for the optional `--seed` flag (same target every run, handy for testing)

## How to run

```bash
python3 number_guessing_game.py
python3 number_guessing_game.py --seed 7   # fixed target, for practice
```

## Sample run

```
$ printf '50\n25\n42\n' | python3 number_guessing_game.py --seed 7
I picked a number between 1 and 100.
You have 10 attempts. Good luck!
Attempt 1/10: Too high — try a lower number.
Attempt 2/10: Too low — try a higher number.
Attempt 3/10: Correct! You guessed it in 3 attempt(s).
```

(With `--seed 7` the secret number is 42, so 50 is too high, 25 is too
low, and 42 wins on the third attempt.)
