/*
 * Bubble Sort — sort a list of numbers in ascending order.
 *
 * How it works: walk through the array comparing neighbouring numbers
 * and swapping them when they are in the wrong order. After each pass
 * the largest unsorted number "bubbles" to its correct place at the end,
 * so the next pass can stop one step earlier.
 *
 * Compile:  gcc bubble_sort.c -o bubble_sort
 * Run:      ./bubble_sort
 */
#include <stdio.h>

void bubble_sort(int arr[], int n)
{
    for (int i = 0; i < n - 1; i++) {
        int swapped = 0; /* stops early if the array is already sorted */
        for (int j = 0; j < n - 1 - i; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
                swapped = 1;
            }
        }
        if (!swapped) {
            break;
        }
    }
}

void print_array(int arr[], int n)
{
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main(void)
{
    int numbers[] = {64, 34, 25, 12, 22, 11, 90};
    int n = sizeof(numbers) / sizeof(numbers[0]);

    printf("Before sorting: ");
    print_array(numbers, n);

    bubble_sort(numbers, n);

    printf("After sorting:  ");
    print_array(numbers, n);

    return 0;
}
