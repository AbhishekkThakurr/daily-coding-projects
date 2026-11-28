/*
 * Selection Sort
 * --------------
 * Sorts a list of integers in ascending order using the selection sort
 * algorithm: repeatedly find the smallest element in the unsorted part
 * of the array and swap it into place.
 *
 * You can pass the numbers as command-line arguments, or type them
 * when the program asks.
 *
 * Concepts: arrays, nested loops, finding a minimum index, swapping
 * with a temporary variable, argc/argv, atoi.
 *
 * Compile:  gcc selection_sort.c -o selection_sort
 * Run:      ./selection_sort 64 25 12 22 11
 *           ./selection_sort            (then type the numbers)
 */

#include <stdio.h>
#include <stdlib.h>

#define MAX_NUMBERS 100

/* Prints the array on one line, separated by spaces. */
static void print_array(const int arr[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%d", arr[i]);
        if (i < n - 1) {
            printf(" ");
        }
    }
    printf("\n");
}

/* Sorts arr[0..n-1] in ascending order using selection sort. */
static void selection_sort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        /* Find the index of the smallest element in arr[i..n-1]. */
        int min_index = i;
        for (int j = i + 1; j < n; j++) {
            if (arr[j] < arr[min_index]) {
                min_index = j;
            }
        }
        /* Swap that smallest element into position i. */
        if (min_index != i) {
            int temp = arr[i];
            arr[i] = arr[min_index];
            arr[min_index] = temp;
        }
    }
}

int main(int argc, char *argv[]) {
    int arr[MAX_NUMBERS];
    int n = 0;

    if (argc > 1) {
        /* Numbers came from the command line. */
        if (argc - 1 > MAX_NUMBERS) {
            printf("Too many numbers (maximum %d).\n", MAX_NUMBERS);
            return 1;
        }
        for (int i = 1; i < argc; i++) {
            arr[n++] = atoi(argv[i]);
        }
    } else {
        /* Ask the user how many numbers, then read them. */
        printf("How many numbers do you want to sort? ");
        if (scanf("%d", &n) != 1 || n < 1 || n > MAX_NUMBERS) {
            printf("Please enter a count between 1 and %d.\n", MAX_NUMBERS);
            return 1;
        }
        printf("Enter %d numbers separated by spaces: ", n);
        for (int i = 0; i < n; i++) {
            if (scanf("%d", &arr[i]) != 1) {
                printf("That was not a whole number.\n");
                return 1;
            }
        }
    }

    printf("Before sorting: ");
    print_array(arr, n);

    selection_sort(arr, n);

    printf("After sorting:  ");
    print_array(arr, n);
    return 0;
}
