// Simple Interest Calculator
// Usage: node simple-interest.js <principal> <rate> <time-in-years>
// Example: node simple-interest.js 10000 5 2

function simpleInterest(principal, rate, time) {
    return (principal * rate * time) / 100;
}

function main() {
    const args = process.argv.slice(2);

    if (args.length !== 3) {
        console.log("Usage: node simple-interest.js <principal> <rate> <time-in-years>");
        console.log("Example: node simple-interest.js 10000 5 2");
        return;
    }

    const principal = parseFloat(args[0]);
    const rate = parseFloat(args[1]);
    const time = parseFloat(args[2]);

    if (isNaN(principal) || isNaN(rate) || isNaN(time)) {
        console.log("Error: principal, rate and time must all be numbers.");
        return;
    }

    if (principal < 0 || rate < 0 || time < 0) {
        console.log("Error: principal, rate and time must not be negative.");
        return;
    }

    const interest = simpleInterest(principal, rate, time);
    const total = principal + interest;

    console.log("Principal : Rs. " + principal.toFixed(2));
    console.log("Rate      : " + rate + "% per year");
    console.log("Time      : " + time + " year(s)");
    console.log("Interest  : Rs. " + interest.toFixed(2));
    console.log("Total     : Rs. " + total.toFixed(2));
}

main();
