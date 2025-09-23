import java.util.Scanner;

public class app {
    public static void main(String[] args) {
        Scanner t = new Scanner(System.in);

        System.out.println("Insira m: ");
        int m = t.nextInt();
        System.out.println("Insira n: ");
        int n = t.nextInt();

        Ackermann r = new Ackermann(m, n);

        System.out.println("----------------");
        System.out.println("Função: A(" + m + ", " + n + ")");
        r.ackermann(m, n);
        System.out.println("----------------");
        System.out.println("RESULTADO:" + r.getA());
        System.out.println("----------------");

    }
}
