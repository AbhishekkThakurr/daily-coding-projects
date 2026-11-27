import java.util.Scanner;

/**
 * Decimal to Binary Converter
 *
 * Converts a non-negative decimal (base 10) number into binary (base 2).
 *
 * Method: keep dividing the number by 2 and collect the remainders.
 * The remainders, read in reverse order, give the binary form.
 * Example: 13 / 2 = 6 rem 1, 6 / 2 = 3 rem 0, 3 / 2 = 1 rem 1,
 *          1 / 2 = 0 rem 1  ->  remainders reversed: 1101
 */
public class DecimalToBinary {

    // Manual conversion: repeated division by 2, remainders reversed.
    public static String toBinary(long n) {
        if (n == 0) {
            return "0";
        }
        StringBuilder binary = new StringBuilder();
        while (n > 0) {
            long remainder = n % 2;
            binary.append(remainder);
            n = n / 2;
        }
        // Remainders were collected last-digit-first, so reverse them.
        return binary.reverse().toString();
    }

    public static void main(String[] args) {
        long n;

        if (args.length >= 1) {
            // Usage: java DecimalToBinary 13
            n = Long.parseLong(args[0]);
        } else {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Enter a non-negative decimal number: ");
            n = scanner.nextLong();
            scanner.close();
        }

        if (n < 0) {
            System.out.println("Please enter a non-negative number (0 or above).");
            return;
        }

        String binary = toBinary(n);
        System.out.println("Decimal: " + n);
        System.out.println("Binary:  " + binary);

        // Cross-check with the built-in method (works for int range).
        if (n <= Integer.MAX_VALUE) {
            String builtIn = Integer.toBinaryString((int) n);
            System.out.println("Check (Integer.toBinaryString): " + builtIn
                    + (binary.equals(builtIn) ? "  (match)" : "  (MISMATCH)"));
        }
    }
}
