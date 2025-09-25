import java.util.Scanner;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class App {

    public static final long INCREMENTO_BASE = 1;
    public static final long VALOR_INICIAL = 1;

    public static void main(String[] args) {
        LocalDate dataAtual = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        System.out.println("\nVariante da Função de Ackermann - " + dataAtual.format(formatter));
        System.out.println("Autores: Gustavo Flores e Otávio Kozak");
        System.out.println();

        Scanner t = new Scanner(System.in);

        while (true) {
            System.out.println(
                    "- Digite os parâmetros m e n para calcular A(m, n).\n- Insira um número negativo para abortar a execução.");

            System.out.println("\nInsira m: ");
            long m = t.nextInt();

            if (m < 0) {
                System.out.println("Execução abortada.");
                break;
            }

            System.out.println("Insira n: ");
            long n = t.nextInt();

            if (n < 0) {
                System.out.println("Execução abortada.");
                break;
            }

            System.out.println("----------------");
            System.out.println("Função: A(" + m + ", " + n + ")");
            long r = ackermann(m, n);
            System.out.println("----------------");
            System.out.println("A(" + m + ", " + n + ") = " + r);
            System.out.println("----------------");
        }

        t.close();
    }

    public static long ackermann(long m, long n) {
        if (m == 0) {
            return n + INCREMENTO_BASE;
        }
        if (m > 0 && n == 0) {
            return ackermann(m - 1, VALOR_INICIAL) + 1;
        }
        if (m > 0 && n > 0) {
            return ackermann(m - 1, ackermann(m, n - 1));
        }
        return 0;
    }
}