"""
Number Guessing Game
---------------------
The computer picks a secret number between 1 and 100 and the player has
10 attempts to guess it. After every wrong guess the game says whether
the secret number is higher or lower, and invalid input does not cost
an attempt.

Concepts: random.randint, while loop, try/except, input validation,
f-strings, command-line arguments (optional --seed for a fixed target).

Run:   python3 number_guessing_game.py
       python3 number_guessing_game.py --seed 7   (same target every run)
"""

import argparse
import random
import sys

LOW = 1
HIGH = 100
MAX_ATTEMPTS = 10


def play(seed=None):
    if seed is not None:
        random.seed(seed)
    secret = random.randint(LOW, HIGH)

    print(f"I picked a number between {LOW} and {HIGH}.")
    print(f"You have {MAX_ATTEMPTS} attempts. Good luck!")

    attempts = 0
    while attempts < MAX_ATTEMPTS:
        try:
            guess = int(input(f"Attempt {attempts + 1}/{MAX_ATTEMPTS}: "))
        except ValueError:
            print("Please enter a whole number — that guess did not count.")
            continue
        except (EOFError, KeyboardInterrupt):
            print("\nGame stopped. The number was", secret)
            return

        if guess < LOW or guess > HIGH:
            print(f"Out of range — enter a number between {LOW} and {HIGH}.")
            continue

        attempts += 1

        if guess == secret:
            print(f"Correct! You guessed it in {attempts} attempt(s).")
            return
        if guess < secret:
            print("Too low — try a higher number.")
        else:
            print("Too high — try a lower number.")

    print(f"Out of attempts! The number was {secret}.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Guess the secret number.")
    parser.add_argument("--seed", type=int, default=None,
                        help="fixed random seed (same target every run)")
    args = parser.parse_args()
    try:
        play(seed=args.seed)
    except BrokenPipeError:
        sys.exit(0)
