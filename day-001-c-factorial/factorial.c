#include <stdio.h>

/*
 * Day 1 (C) - Factorial of a number
 * Concepts: loop, long long data type, printf and scanf.
 */
int main(void) {
    int n;
    long long factorial = 1;

    printf("Enter a non-negative number: ");
    if (scanf("%d", &n) != 1 || n < 0) {
        printf("Please enter a valid non-negative number.\n");
        return 1;
    }

    for (int i = 1; i <= n; i++) {
        factorial *= i;
    }

    printf("Factorial of %d is %lld\n", n, factorial);
    return 0;
}
