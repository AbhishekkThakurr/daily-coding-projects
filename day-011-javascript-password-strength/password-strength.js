// Password Strength Checker
// Checks a password against five rules and rates it Weak / Medium / Strong.
//
// Usage:
//   node password-strength.js "YourPassword123!"
//   node password-strength.js            (checks a few built-in examples)

function checkPassword(password) {
    const checks = [
        { name: "At least 8 characters", passed: password.length >= 8 },
        { name: "Contains an uppercase letter (A-Z)", passed: /[A-Z]/.test(password) },
        { name: "Contains a lowercase letter (a-z)", passed: /[a-z]/.test(password) },
        { name: "Contains a digit (0-9)", passed: /[0-9]/.test(password) },
        { name: "Contains a special character (!@#$...)", passed: /[^A-Za-z0-9]/.test(password) },
    ];

    const score = checks.filter((c) => c.passed).length;
    let rating;
    if (score <= 2) {
        rating = "Weak";
    } else if (score <= 4) {
        rating = "Medium";
    } else {
        rating = "Strong";
    }

    return { checks, score, rating };
}

function report(password) {
    const result = checkPassword(password);
    console.log(`Password: "${password}"`);
    for (const check of result.checks) {
        console.log(`  ${check.passed ? "[PASS]" : "[FAIL]"} ${check.name}`);
    }
    console.log(`Score: ${result.score}/5  ->  ${result.rating}`);
    console.log();
}

const input = process.argv[2];

if (input !== undefined) {
    report(input);
} else {
    // No argument given: check a few examples instead.
    report("hello");
    report("Thakur2026");
    report("Thakur@2026!");
}
