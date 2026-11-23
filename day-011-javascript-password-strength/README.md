# Password Strength Checker (JavaScript)

Checks a password against five simple rules and rates it **Weak**, **Medium**,
or **Strong**.

## What it does

For any password it checks:

1. At least 8 characters
2. Contains an uppercase letter (A–Z)
3. Contains a lowercase letter (a–z)
4. Contains a digit (0–9)
5. Contains a special character (anything that is not a letter or digit)

Each passed rule gives 1 point. Score 0–2 = Weak, 3–4 = Medium, 5 = Strong.

## Concepts used

- Functions (`checkPassword`, `report`)
- Regular expressions (`/[A-Z]/`, `/[0-9]/`, ...)
- `Array.filter` to count the passed checks
- `process.argv` to read a password from the command line

## How to run

```bash
node password-strength.js "YourPassword123!"
```

With no argument it checks three built-in examples instead:

```bash
node password-strength.js
```

## Sample run

```text
$ node password-strength.js
Password: <redacted>
  [FAIL] At least 8 characters
  [FAIL] Contains an uppercase letter (A-Z)
  [PASS] Contains a lowercase letter (a-z)
  [FAIL] Contains a digit (0-9)
  [FAIL] Contains a special character (!@#$...)
Score: 1/5  ->  Weak

Password: <redacted>
  [PASS] At least 8 characters
  [PASS] Contains an uppercase letter (A-Z)
  [PASS] Contains a lowercase letter (a-z)
  [PASS] Contains a digit (0-9)
  [FAIL] Contains a special character (!@#$...)
Score: 4/5  ->  Medium

Password: <redacted>
  [PASS] At least 8 characters
  [PASS] Contains an uppercase letter (A-Z)
  [PASS] Contains a lowercase letter (a-z)
  [PASS] Contains a digit (0-9)
  [PASS] Contains a special character (!@#$...)
Score: 5/5  ->  Strong
```
