/*
 * Vowel and Consonant Counter
 * ---------------------------
 * Reads one line of text and counts how many vowels and consonants it
 * contains. Anything that is not a letter (digits, spaces, punctuation)
 * is ignored for the vowel/consonant counts but reported separately.
 *
 * Concepts: fgets, ctype.h (isalpha, tolower), switch, loops.
 *
 * Compile:  gcc vowel_consonant_counter.c -o vowel_consonant_counter
 * Run:      ./vowel_consonant_counter
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main(void) {
    char text[256];
    int vowels = 0, consonants = 0, others = 0;

    printf("Enter a sentence: ");
    if (fgets(text, sizeof(text), stdin) == NULL) {
        printf("No input received.\n");
        return 1;
    }
    text[strcspn(text, "\n")] = '\0';   /* strip the trailing newline */

    for (int i = 0; text[i] != '\0'; i++) {
        char ch = tolower((unsigned char)text[i]);

        if (!isalpha((unsigned char)text[i])) {
            others++;
            continue;
        }

        switch (ch) {
            case 'a': case 'e': case 'i': case 'o': case 'u':
                vowels++;
                break;
            default:
                consonants++;
                break;
        }
    }

    printf("Text: \"%s\"\n", text);
    printf("Vowels: %d\n", vowels);
    printf("Consonants: %d\n", consonants);
    printf("Other characters: %d\n", others);
    return 0;
}
