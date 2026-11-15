// Fibonacci Series — prints the first N terms of the Fibonacci series.
// Each term is the sum of the two terms before it: 0, 1, 1, 2, 3, 5, 8, ...

public class FibonacciSeries {
    public static void main(String[] args) {
        int n = 10; // how many terms to print

        if (args.length > 0) {
            n = Integer.parseInt(args[0]);
        }

        if (n <= 0) {
            System.out.println("Please enter a positive number of terms.");
            return;
        }

        long first = 0, second = 1;

        System.out.print("Fibonacci series (" + n + " terms): ");
        for (int i = 1; i <= n; i++) {
            System.out.print(first);
            if (i < n) {
                System.out.print(", ");
            }
            long next = first + second;
            first = second;
            second = next;
        }
        System.out.println();
    }
}
