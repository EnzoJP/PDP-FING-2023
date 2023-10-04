import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class Tp2 {
    public static void main(String[] args) {

        System.out.println("EJ2");
        // inciso 4
        int rad = 5;
        double vol = Ej2.calculateCircleVolume(rad);
        System.out.println("the volume is  " + vol);

        System.out.println("EJ3");
        // inciso 1
        int[] vec = new int[10]; // Crear un arreglo con espacio para 10 elementos
        Ej3.randomVector(vec);
        // Imprimir el arreglo generado
        for (int value : vec) {
            System.out.print(value + " ");
        }
        // inciso 3
        int sum;
        sum = Ej3.SumVector(vec);
        System.out.println("the sum is " + sum);
        // inciso 5
        int[][] mat = new int[20][20];
        Ej3.MatRelleno(mat);
        // Imprimir la matriz
        for (int fila = 0; fila < 20; fila++) {
            for (int columna = 0; columna < 20; columna++) {
                System.out.print("    "+ mat[fila][columna]);
            }
            System.out.println();
        }

        System.out.println("Ej4");
        // inciso 1
        Scanner entrada = new Scanner(System.in);
        boolean cond = false;
        char sal = 'x';
        while (!cond){
            System.out.println("Ingrese un char");
            char caracter = entrada.next().charAt(0);
            if (sal == caracter){
                cond=true;
            }
        }
        //inciso 5
        int n1; int n2;int result;
        try{
            n1 = entrada.nextInt();
            System.out.println(n1);
            n2= entrada.nextInt();
            result = n1/n2;
            System.out.println(result);
        }catch (ArithmeticException ex){
            System.out.println("error");
        }
        // inciso 7
        String cadena;
        System.out.println("Ingresa un día de la semana   ");
        Scanner entrada2 = new Scanner(System.in);
        cadena = entrada2.nextLine();
        switch (cadena) {
            case "lunes":
            case "martes":
            case "miercoles":
            case "jueves":
            case "viernes":
                System.out.println("Día laboral");
                break;
            case "sabado":
            case "domingo":
                System.out.println("Fin de semana, no laboral");
                break;
            default:
                System.out.println("Día no válido");
                break;
        }

    }
}
class Ej2 {
    // inciso 4 //
    static double calculateCircleVolume(double rad) {
        double  Vol;
        rad=Math.pow(rad, 3);
        return (Math.PI * (rad)*(4.0/3.0));
    }

}
class Ej3{
    //inciso 1
    static void randomVector (int [] vec){
        Random Rnumber = new Random();
        for (int i=0; i<10;i++){
            vec[i] = Rnumber.nextInt(10);
        }
    }
    //inciso 3
    static int SumVector(int [] vec){
        int sum;
        sum =Arrays.stream(vec).sum();
        return sum;
    }
    // inciso 5
    static void MatRelleno (int [][] mat){
        for( byte i =0; i<20; i++  ){
            for (byte j=0; j<20; j++){
                mat[i][j] = i * 20 + j;
            }
        }
    }

}
class Arbol {
    private int altura;
    private String nombre;

    // Constructor para árbol genérico
    public Arbol() {
        System.out.println("Se ha creado un árbol genérico.");
    }

    // Constructor con altura
    public Arbol(int altura) {
        this.altura = altura;
        System.out.println("Se ha creado un árbol con altura " + altura + ".");
    }

    // Constructor con nombre
    public Arbol(String nombre) {
        this.nombre = nombre;
        System.out.println("Se ha creado un árbol llamado " + nombre + ".");
    }

    // Constructor con altura y nombre
    public Arbol(int altura, String nombre) {
        this.altura = altura;
        this.nombre = nombre;
        System.out.println("Se ha creado un árbol llamado " + nombre + " con altura " + altura + ".");
    }
}

class Persona{
    private short edad;
    private int DNI;
    private float altura;
    //constructor
    public Persona(short edad, int DNI,float altura){
        this.altura=altura;
        this.DNI=DNI;
        this.edad=edad;
        System.out.println("Se ha creado una persona");
    }

    public void imprimirInformacion() {
        System.out.println("Información de la persona:");
        System.out.println("Edad: " + edad);
        System.out.println("DNI: " + DNI);
        System.out.println("Altura: " + altura);
    }

    public boolean esDNIValido(int DNI) {
        String cad;
        cad=String.valueOf(DNI);
        if (cad.length()>9){
            return false;
        }else{
            return  true;
        }

    }

    public float calcularIMC(int peso) {
        // Calcular el índice de masa corporal (IMC) basado en la altura
        float alturaMetros = altura / 100; // Convertir la altura de cm a metros
        float imc = peso / (alturaMetros * alturaMetros);
        return imc;
    }
    public short getEdad() {
        return edad;
    }

    public void setEdad(short edad) {
        this.edad = edad;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public float getAltura() {
        return altura;
    }

    public void setAltura(float altura) {
        this.altura = altura;
    }
}

class Sumatoria {
    private int[] vector;

    public Sumatoria() {
        vector = new int[2];
        for (int i = 0; i < vector.length; i++) {
            vector[i] = (int) (Math.random() * 10) + 1; // Valores entre 1 y 10
        }
    }

    public Sumatoria(int valor1, int valor2) {
        vector = new int[2];
        vector[0] = valor1;
        vector[1] = valor2;
    }

    public void mostrarTablasMultiplicar() {
        for (int i = 0; i < vector.length; i++) {
            System.out.println("Tabla de multiplicar para " + vector[i] + ":");
            for (int j = 1; j <= 10; j++) {
                int resultado = vector[i] * j;
                System.out.println(vector[i] + " * " + j + " = " + resultado);
            }
            System.out.println();
        }
    }

    public int calcularSuma() {
        int suma = 0;
        for (int valor : vector) {
            suma += valor;
        }
        return suma;
    }
}
