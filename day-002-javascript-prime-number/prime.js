// Prime Number Checker
// Checks whether a number is prime and tests a list of numbers.
//
// Run with: node prime.js
// (Optional) Check one number from the command line: node prime.js 29

function isPrime(n) {
    if (n < 2) return false;          // 0, 1 and negatives are not prime
    if (n === 2) return true;         // 2 is the only even prime
    if (n % 2 === 0) return false;    // other even numbers are not prime

    // Only need to test divisors up to the square root of n.
    for (let i = 3; i * i <= n; i += 2) {
        if (n % i === 0) return false;
    }
    return true;
}

// Numbers to test (change this list to try your own).
const numbers = [2, 7, 10, 13, 25, 29, 97, 100];

// A number passed on the command line replaces the list.
const arg = process.argv[2];
const toCheck = arg !== undefined ? [Number(arg)] : numbers;

for (const n of toCheck) {
    console.log(n + (isPrime(n) ? " is prime" : " is not prime"));
}
