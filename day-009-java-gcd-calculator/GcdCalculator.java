// GCD Calculator
// Finds the Greatest Common Divisor of two numbers
// using the Euclidean algorithm.
//
// The Euclidean algorithm works on a simple idea:
// gcd(a, b) = gcd(b, a % b), repeated until the remainder is 0.
// The last non-zero remainder is the GCD.
//
// Example: gcd(48, 18)
//   48 % 18 = 12  ->  gcd(18, 12)
//   18 % 12 = 6   ->  gcd(12, 6)
//   12 % 6  = 0   ->  GCD is 6

import java.util.Scanner;

public class GcdCalculator {

    // Returns the GCD of a and b. Works for negative numbers too.
    public static int gcd(int a, int b) {
        a = Math.abs(a);
        b = Math.abs(b);
        while (b != 0) {
            int temp = b;
            b = a % b;
            a = temp;
        }
        return a;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter first number: ");
        int a = sc.nextInt();

        System.out.print("Enter second number: ");
        int b = sc.nextInt();

        System.out.println("GCD of " + a + " and " + b + " is: " + gcd(a, b));

        sc.close();
    }
}
