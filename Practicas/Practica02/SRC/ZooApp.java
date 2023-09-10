package SRC;

import java.util.Scanner;

public class ZooApp {

    public static void main(String[] args){
        app();
    }

    /**
     * Método que nos regresa un String, el cual es el menu de opciones principales
     * del Zoologico de Huitziltepec.
     * 
     * @return un String, el cual es el numero de opciones del menu enumerados en
     * un intervalo de [1, 5].
     */
    private static String menu() {
        return "1.- Agregar\n" +
               "2.- Consultar\n" +
               "3.- Editar\n" +
               "4.- Eliminar\n" +
               "5.- Salir";
    }

    /**
     * Metodo que realiza la seleccion de opciones del Zoologico de Huitziltepec.
     * Es decir, aqui se va a encontrar el flujo de lo que el usuario puede realizar.
     */
    private static void app() {
        FileManagementProxy conection = new RemoteFileManagement();
        Scanner sc = new Scanner(System.in);
        boolean isItAnExit = false;
        do {
            System.out.println(menu()); 
            String input = sc.nextLine(); // Agregar un try-catch para solo aceptar numeros
            try {
                int option = Integer.parseInt(input);    
                switch (option) {
                    case 1: // Agregar
                        conection.agregar();
                        break;
                    case 2: // Consultar
                        conection.consultar();
                        break;
                    case 3: // Editar
                        conection.editar();
                        break;
                    case 4: // Eliminar
                        conection.eliminar();
                        break;
                    case 5: // Salir
                        isItAnExit = true;
                        break;
                    default:
                        System.out.println("INGRESE UN NÚMERO VALIDO.");
                        break;
                }
            } catch (Exception e) {
                // TODO: handle exception
                // Falta cambiar la excepcion por una mas particular, 
                // ademas, debemos primero quitar los espacios en blanco.
            }
        } while(!isItAnExit);
        sc.close();
    }
}