import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        /* EJERCICIO 1 */
        int num1 = 10;
        int n;
        n = Fibonacci(num1);
        System.out.println("fibo" + n);

        int ind = 0;
        String str = "Un tete a tete con Tete";
        List<Integer> list = new ArrayList<>();
        String str2 = "te";
        poscDe(str, list, str2, 0);

        int pos;
        pos = Allways(5);
        System.out.println(pos);

    }

    public static int Fibonacci(int n) {
        // Devuelve el número de Fibonacci
        if (n < 2) {
            return n;
        }
        return Fibonacci(n - 1) + Fibonacci(n - 2);
    }

    public static void poscDe(String st1, List<Integer> list, String st2, int ind) {
        // La función agrega las posiciones donde se encuentra st2 dentro de st1 en la lista
        /*
        String News;
        System.out.println("Substring");
        News = st1.substring(ind);
        System.out.println(News);
        */
        int len2 = st2.length();
        int cont1 = st1.length();
        int cont2 = cont1 - len2;
        list = PoscR(st1, list, st2, ind, cont1, cont2, len2);
        System.out.println(list);


    }

    public static List<Integer> PoscR(String st1, List<Integer> list, String st2, int ind, int cont1, int cont2, int len2) {
        if (cont2 <= ind) {
            return list;
        }
        if (st1.substring(cont2, cont1).equals(st2)) {
            list.add(cont2);
        }
        cont1 = cont1-1;
        cont2 = cont2 -1;
        PoscR(st1, list, st2, ind, cont1, cont2, len2);
        return list;
    }

    public static int Allways(int n) {
        //base
        if (n<=2){
            return n ;
        }
        else{
            return Allways(n-1) + Allways(n-2);
        }

    }
}



/* Ejercicio 8
from random import randint

def ratatuille(n):
    return ratatuilleR(n,0)

def ratatuilleR(n,t):
    #Caso base
    if(n == 3):
        t = t+7
        print("Va por el camino 3")
        return t
    if(n == 2):
        t = t+5
        print("Va por el camino 2")
        return ratatuilleR(randint(1,3),t)
    if(n == 1):
        t = t+3
        print("Va por el camino 1")
        return ratatuilleR(randint(1,3),t)


print("Tiempo total: ",ratatuille(randint(1,3)))
 */
