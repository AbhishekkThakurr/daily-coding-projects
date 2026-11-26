// Binary Search
// Searches for a value in a SORTED array by halving the search range
// again and again. Time complexity: O(log n).
//
// Usage:
//   node binary-search.js 30
//   node binary-search.js 30 10 20 30 40 50
//   node binary-search.js            (runs a few built-in examples)

function binarySearchIterative(arr, target) {
    let low = 0;
    let high = arr.length - 1;

    while (low <= high) {
        const mid = Math.floor((low + high) / 2);
        if (arr[mid] === target) {
            return mid;
        } else if (arr[mid] < target) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    return -1;
}

function binarySearchRecursive(arr, target, low, high) {
    if (low > high) {
        return -1;
    }
    const mid = Math.floor((low + high) / 2);
    if (arr[mid] === target) {
        return mid;
    } else if (arr[mid] < target) {
        return binarySearchRecursive(arr, target, mid + 1, high);
    } else {
        return binarySearchRecursive(arr, target, low, mid - 1);
    }
}

function report(arr, target) {
    const index = binarySearchIterative(arr, target);
    const indexRec = binarySearchRecursive(arr, target, 0, arr.length - 1);
    console.log(`Array: [${arr.join(", ")}]`);
    console.log(`Searching for: ${target}`);
    if (index === -1) {
        console.log(`Iterative result: not found`);
        console.log(`Recursive result: not found`);
    } else {
        console.log(`Iterative result: found at index ${index}`);
        console.log(`Recursive result: found at index ${indexRec}`);
    }
    console.log();
}

const args = process.argv.slice(2);

if (args.length === 0) {
    // No arguments: run built-in examples.
    const sample = [10, 20, 30, 40, 50, 60, 70];
    report(sample, 30);
    report(sample, 70);
    report(sample, 25);
} else if (args.length === 1) {
    const target = Number(args[0]);
    if (Number.isNaN(target)) {
        console.error("Please give a numeric target, e.g. node binary-search.js 30");
        process.exit(1);
    }
    report([10, 20, 30, 40, 50, 60, 70], target);
} else {
    const target = Number(args[0]);
    const arr = args.slice(1).map(Number);
    if (Number.isNaN(target) || arr.some(Number.isNaN)) {
        console.error("All values must be numbers, e.g. node binary-search.js 30 10 20 30 40 50");
        process.exit(1);
    }
    arr.sort((a, b) => a - b);
    console.log("(Array sorted before searching, binary search needs sorted input.)");
    report(arr, target);
}
