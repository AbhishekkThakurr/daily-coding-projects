#include <stdio.h>
#include <stdlib.h>

// Sum of Digits
// Takes an integer and prints the sum of its digits.
// Negative numbers are handled by using their absolute value.

int main(void) {
    long long number;

    printf("Enter an integer: ");
    if (scanf("%lld", &number) != 1) {
        printf("Invalid input. Please enter an integer.\n");
        return 1;
    }

    long long n = llabs(number);
    long long sum = 0;

    // A number 0 has digit sum 0, so the loop is skipped correctly.
    while (n > 0) {
        sum += n % 10;   // take the last digit
        n /= 10;         // drop the last digit
    }

    printf("Sum of digits of %lld is %lld\n", number, sum);
    return 0;
}
