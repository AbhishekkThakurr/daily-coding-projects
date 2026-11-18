// Armstrong Number Checker
// An Armstrong number (narcissistic number) equals the sum of its own
// digits each raised to the power of the number of digits.
// Example: 153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
//          9474 = 9^4 + 4^4 + 7^4 + 4^4 = 6561 + 256 + 2401 + 256 = 9474
//
// Usage: java ArmstrongNumber <number>
//        (no argument prints Armstrong numbers from 1 to 1000 instead)

public class ArmstrongNumber {

    // Returns how many digits a non-negative number has.
    static int countDigits(int n) {
        if (n == 0) {
            return 1;
        }
        int count = 0;
        while (n > 0) {
            count++;
            n /= 10;
        }
        return count;
    }

    // Returns true if n is an Armstrong number.
    static boolean isArmstrong(int n) {
        if (n < 0) {
            return false;
        }
        int digits = countDigits(n);
        int sum = 0;
        int temp = n;
        while (temp > 0) {
            int digit = temp % 10;              // last digit
            sum += (int) Math.pow(digit, digits);
            temp /= 10;                         // drop the last digit
        }
        return sum == n;
    }

    public static void main(String[] args) {
        if (args.length == 0) {
            // No number given: list every Armstrong number from 1 to 1000.
            System.out.println("Armstrong numbers from 1 to 1000:");
            for (int i = 1; i <= 1000; i++) {
                if (isArmstrong(i)) {
                    System.out.print(i + " ");
                }
            }
            System.out.println();
            return;
        }

        int number = Integer.parseInt(args[0]);
        if (isArmstrong(number)) {
            System.out.println(number + " is an Armstrong number.");
        } else {
            System.out.println(number + " is NOT an Armstrong number.");
        }
    }
}
