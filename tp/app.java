import java.util.Scanner;

public class app {
    public static void main(String[] args) {
        Scanner t = new Scanner(System.in);

        System.out.println("Insira m: ");
        int m = t.nextInt();
        System.out.println("Insira n: ");
        int n = t.nextInt();

        System.out.println("----------------");
        System.out.println("Função: A(" + m + ", " + n + ")");
        int r = ackermann(m, n);
        System.out.println("----------------");
        System.out.println("RESULTADO:" + r);
        System.out.println("----------------");
    }

    public static int ackermann(int m, int n) {
        int a = 0;
        if (m == 0) {
            return n + 1;
        }
        if (m > 0 && n == 0) {
            return ackermann(m - 1, 1) + 1;
        }
        if (m > 0 && n > 0) {
            return ackermann(m - 1, ackermann(m, n - 1));
        }
        return a;
    }
}
