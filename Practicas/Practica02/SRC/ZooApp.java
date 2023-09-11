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
        return  "------------------------------------------------------------------------\n" +
                "|                                                                      |\n" +
                "|                      ZOOLOGICO DE HUITZILTEPEC                       |\n" +
                "|                                                                      |\n" +
                "------------------------------------------------------------------------\n\n" +
                "1.- Agregar\n" +
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
        //FileManagementProxy conection = new RemoteFileManagement();
        Scanner sc = new Scanner(System.in);
        boolean isItAnExit = false;
        do {
            System.out.println(menu()); 
            String input = sc.nextLine().replaceAll("\\s", "");
            try {
                int option = Integer.parseInt(input);
                switch (option) {
                    case 1: // Agregar
                        //conection.agregar();
                        menuAgregar(sc);
                        break;
                    case 2: // Consultar
                        //conection.consultar();
                        menuConsultar(sc);
                        break;
                    case 3: // Editar
                        //conection.editar();
                        menuEditar(sc);
                        break;
                    case 4: // Eliminar
                        //conection.eliminar();
                        menuEliminar(sc);
                        break;
                    case 5: // Salir
                        isItAnExit = true;
                        System.out.println("\n¡Adios! Ten un buen día :)");
                        break;
                    default:
                        System.out.println("\nIngrese un número de nuestro menu, en un rango de [1, 5].\n");
                        break;
                }
            } catch (java.lang.NumberFormatException e) {
                System.err.println("\nSolo ingrese un número de nuestro menu de opciones sin ningún otro caracter.\n");
            }
        } while(!isItAnExit);
        sc.close();
    }

    /**
     * Metodo que nos regresa un letrero o cabacera en formato de String de las opciones del
     * menu (Agregar, Consultar, Editar y Eliminar).
     * 
     * @param option es el numero del letro que se desea obtener.
     *      - Option 1: "Agregar".
     *      - Option 2: "Consultar".
     *      - Option 3: "Editar".
     *      - Option C.O.C: "Eliminar".
     * @return un String el cual representa la cabecera del menu correspondiente
     * a la opcion especificada.
     */
    private static String menuSigns(int option) {
        switch (option) {
            case 1:
                return  "------------------------------------------------\n" +
                        "|                MENU \"AGREGAR\"                |\n" +
                        "------------------------------------------------\n\n";
            case 2:
                return  "------------------------------------------------\n" +
                        "|              MENU \"CONSULTAR\"                |\n" +
                        "------------------------------------------------\n\n";
            case 3:
                return  "------------------------------------------------\n" +
                        "|               MENU \"EDITAR\"                  |\n" +
                        "------------------------------------------------\n\n";
            default:
                return  "------------------------------------------------\n" +
                        "|               MENU \"ELIMINAR\"                |\n" +
                        "------------------------------------------------\n\n";
        }
    }

    /**
     * Metodo que nos regresa un submenu de las opciones que puede realizar el 
     * zoologico, es decir, nos regresa el submenu de todas las opciones que puede realizar
     * con Agregar, Consultar, Editar y Eliminar.
     * 
     * @param signage Es el letrero o cabezara que va a llevar, es el titular del menu.
     * @param option Es un string, el cual solo puede ser la palabra Agregar, Consultar,
     * Editar o Eliminar
     * @return un String, el cual nos da las opciones del submenu que se puede realizar.
     */
    private static String setMenu(String signage, String option) {
        return signage + 
            "1.- " + option + " Empleado: Veterinario.\n" +
            "2.- " + option + " Bioma.\n" +
            "3.- " + option + " Animal.\n" +
            "4.- Regresar/Atras.\n";
    }

    /**
     * Metodo que realiza todo el ciclo o bucle del submenu Agregar, es decir, es el menu con
     * el puedes realizar todas las operaciones que soporta la operacion Agregar.
     * 
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     */
    private static void menuAgregar(Scanner sc) {
        boolean isItAnExit = false;
        do {
            System.out.println(setMenu(menuSigns(1), "Agregar"));
            String input = sc.nextLine().replaceAll("\\s", "");
            try {
                int option = Integer.parseInt(input);
                switch (option) {
                    case 1:
                        System.out.println("AQUI AGREGAR VETERINARIO");    
                        break;
                    case 2:
                        System.out.println("AQUI AGREGAR BIOMA"); 
                        break;
                    case 3:
                        System.out.println("AQUI AGREGAR ANIMAL"); 
                        break;
                    case 4:
                        isItAnExit = true;
                        break;
                    default:
                        System.out.println("\nIngrese un número de nuestro menu, en un rango de [1, 5].\n");
                        break;
                }          
            } catch (java.lang.NumberFormatException e) {
                System.err.println("\nSolo ingrese un número de nuestro menu de opciones sin ningún otro caracter.\n");
            }
        } while (!isItAnExit);
    }

    /**
     * Metodo que realiza todo el ciclo o bucle del submenu Consultar, es decir, es el menu con
     * el puedes realizar todas las operaciones que soporta la operacion Consultar.
     * 
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     */
    private static void menuConsultar(Scanner sc) {
        boolean isItAnExit = false;
        do {
            System.out.println(setMenu(menuSigns(2), "Consultar"));
            String input = sc.nextLine().replaceAll("\\s", "");
            try {
                int option = Integer.parseInt(input);
                switch (option) {
                    case 1:
                        System.out.println("AQUI CONSULTAR VETERINARIO");    
                        break;
                    case 2:
                        System.out.println("AQUI CONSULTAR BIOMA"); 
                        break;
                    case 3:
                        System.out.println("AQUI CONSULTAR ANIMAL"); 
                        break;
                    case 4:
                        isItAnExit = true;
                        break;
                    default:
                        System.out.println("\nIngrese un número de nuestro menu, en un rango de [1, 5].\n");
                        break;
                }          
            } catch (java.lang.NumberFormatException e) {
                System.err.println("\nSolo ingrese un número de nuestro menu de opciones sin ningún otro caracter.\n");
            }
        } while (!isItAnExit);
    }

    /**
     * Metodo que realiza todo el ciclo o bucle del submenu Editar, es decir, es el menu con
     * el puedes realizar todas las operaciones que soporta la operacion Editar.
     * 
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     */
    private static void menuEditar(Scanner sc) {
        boolean isItAnExit = false;
        do {
            System.out.println(setMenu(menuSigns(3), "Editar"));
            String input = sc.nextLine().replaceAll("\\s", "");
            try {
                int option = Integer.parseInt(input);
                switch (option) {
                    case 1:
                        System.out.println("AQUI Editar VETERINARIO");    
                        break;
                    case 2:
                        System.out.println("AQUI Editar BIOMA"); 
                        break;
                    case 3:
                        System.out.println("AQUI Editar ANIMAL"); 
                        break;
                    case 4:
                        isItAnExit = true;
                        break;
                    default:
                        System.out.println("\nIngrese un número de nuestro menu, en un rango de [1, 5].\n");
                        break;
                }          
            } catch (java.lang.NumberFormatException e) {
                System.err.println("\nSolo ingrese un número de nuestro menu de opciones sin ningún otro caracter.\n");
            }
        } while (!isItAnExit);
    }

    /**
     * Metodo que realiza todo el ciclo o bucle del submenu Eliminar, es decir, es el menu con
     * el puedes realizar todas las operaciones que soporta la operacion Eliminar.
     * 
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     */
    private static void menuEliminar(Scanner sc) {
        boolean isItAnExit = false;
        do {
            System.out.println(setMenu(menuSigns(4), "Eliminar"));
            String input = sc.nextLine().replaceAll("\\s", "");
            try {
                int option = Integer.parseInt(input);
                switch (option) {
                    case 1:
                        System.out.println("AQUI Eliminar VETERINARIO");    
                        break;
                    case 2:
                        System.out.println("AQUI ELIMINAR BIOMA"); 
                        break;
                    case 3:
                        System.out.println("AQUI ELIMINAR ANIMAL"); 
                        break;
                    case 4:
                        isItAnExit = true;
                        break;
                    default:
                        System.out.println("\nIngrese un número de nuestro menu, en un rango de [1, 5].\n");
                        break;
                }          
            } catch (java.lang.NumberFormatException e) {
                System.err.println("\nSolo ingrese un número de nuestro menu de opciones sin ningún otro caracter.\n");
            }
        } while (!isItAnExit);
    }
}