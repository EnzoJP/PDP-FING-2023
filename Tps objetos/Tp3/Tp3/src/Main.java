import java.util.Arrays;

public class Main {
    public static void main (String [] args){
        Cuenta C_pepe = new Cuenta(123123, 111, 500.0,10);
        C_pepe.ingresar(300.0);
        double s=C_pepe.getSaldo();
        System.out.println(s);
        Fecha date = new Fecha(1,1,1);
        String [] palabra = {"a","b"};
        Ahorcado ahorcado = new Ahorcado(palabra);
        ahorcado.hit(palabra,"a");
        ahorcado.win(palabra);
        try {
            String a = palabra [5];
        }catch (ArrayIndexOutOfBoundsException ex){
            System.out.println(ex.getMessage());
        }finally {
            System.out.println("error");
        }
        try {
            throw new MiExcepcion("Esto es una excepción personalizada");
        } catch (MiExcepcion e) {
            System.out.println(e.getMensaje());
        }
    }
}

class Cuenta {
    private int NCuenta;
    private int DNI;
    private Double saldo;
    private float interes;

    public Cuenta(int NCuenta, int DNI,Double saldo,float interes ) {
        this.DNI=DNI;
        this.NCuenta=NCuenta;
        this.interes=interes;
        this.saldo=saldo;
    }
    public void ingresar(Double plata){
        saldo= saldo + plata;
    }
    public void retirar(Double plata){
        saldo= saldo - plata;
    }
    public int getNCuenta() {
        return NCuenta;
    }

    public void setNCuenta(int NCuenta) {
        this.NCuenta = NCuenta;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }
    public Double getSaldo() {
        return saldo;
    }

    public void setSaldo(Double saldo) {
        this.saldo = saldo + (interes/365);
    }

    public float getInteres() {
        return interes;
    }

    public void setInteres(float interes) {
        this.interes = interes;
    }
}

class Fecha {
    private int dia;
    private int mes;
    private int año;

    public Fecha( int dia, int mes, int año){
        this.dia =dia;
        this.mes =mes;
        this.año=año;
        //verificacion
        valida();
    }
    public Fecha(){
        this.dia = 1;
        this.mes =1;
        this.año =1900;
    }

    public boolean bisiesto() {
        if ((año % 4 == 0 && año % 100 != 0) || año % 400 == 0) {
            return true; // El año es bisiesto
        } else {
            return false; // El año no es bisiesto
        }
    }

    private void valida() {
        if (año < 1900 || año > 2050) {
            año = 1900;
        }

        if (mes < 1 || mes > 12) {
            mes = 1;
        }

        if (dia < 1) {
            dia = 1;
        } else {
            int[] diasPorMes = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
            if (bisiesto() && mes == 2) {
                diasPorMes[2] = 29;
            }
            if (dia > diasPorMes[mes]) {
                dia = diasPorMes[mes];
            }
        }
    }
    public void siguiente() {
        int[] diasPorMes = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        if (bisiesto() && mes == 2) {
            diasPorMes[2] = 29;
        }

        dia++;
        if (dia > diasPorMes[mes]) {
            dia = 1;
            mes++;
            if (mes > 12) {
                mes = 1;
                año++;
                if (año > 2050) {
                    año = 1900;
                }
            }
        }
    }
    public int diasTranscurridos() {
        // Dias hasta la fecha
        int contDias = 0;
        int[] diasPorMes = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

        if (this.año != 1900) {
            contDias = contDias + ((this.año - 1900) * 365);
        }
        for (int i = 1; i < this.mes; i++) {
            contDias = contDias + diasPorMes[i];
        }
        contDias = contDias + this.dia - 1;
        return contDias;
    }
}

class Ahorcado{
    private String[] palabra;
    private int oportunidades = 3;
    //private int cont= this.palabra.length;

    private boolean finish = false;

    public Ahorcado(String [] palabra){
        this.palabra  = palabra;
    }
    public boolean contiene(String [] palabra, String letra){
       if (this.finish == false) {
           boolean esta = false;
           for (String s : palabra) {
               if (s.equals(letra)) {
                   esta = true;
                   break;
               }
           }
           return esta;
       }
        return false;
    }

    public void hit(String [] palabra, String letra){
        if (contiene(palabra, letra)){
            System.out.println("acertaste");
            for (int i=0; i<palabra.length;i++){
                if (palabra[i].equals(letra)) {
                    this.palabra[i]="@";
                }
            }
        }
        else{
            System.out.println("no acertaste");
            this.oportunidades = this.oportunidades-1;
        }
    }

    public boolean win(String [] palabra){
        for (String s : palabra) {
            if (!s.equals("@")) {
                System.out.println("todavia no");
                return false;
            }
            }
        System.out.println("sii");
        return true;
    }

    public void tryagain(){
        if (this.oportunidades==0){
            System.out.println("perdiste :[");
        }
    }
}

class MiExcepcion extends Exception {

    private final String mensaje;

    public MiExcepcion(String mensaje) {
        this.mensaje = mensaje;
    }
    public String getMensaje() {
        return this.mensaje;
    }
}