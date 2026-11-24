import java.util.Scanner;

/**
 * LCM Calculator
 *
 * Finds the Least Common Multiple of two integers.
 * The LCM of two numbers is the smallest positive number that is
 * divisible by both of them.
 *
 * It is computed from the GCD with this formula:
 *     lcm(a, b) = |a * b| / gcd(a, b)
 */
public class LcmCalculator {

    // Euclidean algorithm: gcd(a, b) = gcd(b, a % b) until remainder is 0.
    public static long gcd(long a, long b) {
        a = Math.abs(a);
        b = Math.abs(b);
        while (b != 0) {
            long temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    // LCM from GCD. Uses long so the product does not overflow for
    // the inputs this program is meant for.
    public static long lcm(long a, long b) {
        if (a == 0 || b == 0) {
            return 0;
        }
        return Math.abs(a * b) / gcd(a, b);
    }

    public static void main(String[] args) {
        long a;
        long b;

        if (args.length >= 2) {
            // Usage: java LcmCalculator 12 18
            a = Long.parseLong(args[0]);
            b = Long.parseLong(args[1]);
        } else {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Enter first number: ");
            a = scanner.nextLong();
            System.out.print("Enter second number: ");
            b = scanner.nextLong();
            scanner.close();
        }

        System.out.println("GCD of " + a + " and " + b + " is: " + gcd(a, b));
        System.out.println("LCM of " + a + " and " + b + " is: " + lcm(a, b));
    }
}
