public class Ackermann {
    int a;
    int m;
    int n;

    public Ackermann(int valor1, int valor2) {
        this.m = valor1;
        this.n = valor2;
    }

    public int getA() {
        return a;
    }

    public int getM() {
        return m;
    }

    public int getN() {
        return n;
    }

    public void setM(int m) {
        this.m = m;
    }

    public void setN(int n) {
        this.n = n;
    }

    public int ackermann(int m, int n) {
        while (m > 0) {
            if (n > 0) {
                a = ackermann(m - 1, ackermann(m, n - 1));
            }
            a = ackermann(m - 1, 1) + 1;
        }
        if (m == 0) {
            n++;
        }
        return a;
    }
}
