#include <stdio.h>
#include <string.h>

int main(void) {
    char str[100];

    printf("Enter a string: ");
    fgets(str, sizeof(str), stdin);
    str[strcspn(str, "\n")] = '\0';  /* remove the trailing newline */

    int left = 0;
    int right = strlen(str) - 1;

    /* Swap characters from both ends, moving towards the middle. */
    while (left < right) {
        char temp = str[left];
        str[left] = str[right];
        str[right] = temp;
        left++;
        right--;
    }

    printf("Reversed string: %s\n", str);
    return 0;
}
