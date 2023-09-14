
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Scanner;

import animal.*;
import bioma.*;
import empleado.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;



public class ZooApp {

    public static void main(String[] args){
        app();
    }
    static RemoteFileManagement rfm = new RemoteFileManagement();

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

    private static String pedirClave(Scanner sc) {
        System.out.println("Ingrese la el ID para poder encontrarlo:");
        return sc.nextLine().replaceAll("\\s", "");
    }
    // EMPRESAURIOS 4EVER XD
    /**
     * Metodo para desplegar el menu para elegir que tipo de entidad estamos manejando
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     * @return  Regresa el tipo de entidad, o una opci;ón para salir del menú
     */
    private static String elegirTipo(Scanner sc, String tipo_Menu){
        boolean isItAnExit = false;
        do {
            System.out.println(setMenu(menuSigns(1), tipo_Menu));
            String input = sc.nextLine().replaceAll("\\s", "");
            try {
                int option = Integer.parseInt(input);
                switch (option) {
                    case 1:
                        return "Veterinarios";
                    case 2: 
                        return "Biomas";
                    case 3:
                        return "Animales";
                    case 4: // Salir del menu
                        return "Salir";
                    default: // Opción incorrecta
                        System.out.println("\nIngrese un número de nuestro menu, en un rango de [1, 5].\n");
                        break;
                }          
            } catch (java.lang.NumberFormatException e) {
                System.err.println("\nSolo ingrese un número de nuestro menu de opciones sin ningún otro caracter.\n");
            }
        }while (!isItAnExit);
        return "Salir";
    }

    /**
     * Metodo que realiza todo el ciclo o bucle del submenu Agregar, es decir, es el menu con
     * el puedes realizar todas las operaciones que soporta la operacion Agregar.
     * 
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     */
    private static void menuAgregar(Scanner sc) {
        String tipo = elegirTipo(sc, "Agregar");
        
        if (tipo.equals("Salir")) return;
        
        // Datos Veterinario
        String rfc, nombre, apellidoPaterno, apellidoMaterno, 
        direccion, telefono, correoElectronico, genero, especialidad,
        fechaInicioContratoS, fechaFinContratoS, fechaNacimientoS;
        double salario;
        Date fechaNacimiento, fechaInicioContrato, fechaFinContrato;

        // Formato para la fecha 
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

        //Datos Bioma
        int idBioma, numeroJaulas, numeroCuidadores, 
        numeroVeterinarios, numeroAnimales;
        String tipoBioma;
        
        // Datos Animal
        int idAnimal, numeroJaula;
        double peso, altura;
        String sexo, alimentacion, 
        indicacionesMedicas, nombreAnimal, especie;


        
        System.out.println("Ingrese lo siguiente por comas:\n" +
            "nombre(s), apellidoMaterno, ");
        switch(tipo){
            case ("Veterinario"):
                System.out.println("Ingrese su RFC:");
                rfc = sc.nextLine().replaceAll("\\s", "");
                
                System.out.println("Ingrese su nombre:");
                nombre = sc.nextLine().replaceAll("\\s", "");

                System.out.println("Ingrese su apellido paterno:");
                apellidoPaterno = sc.nextLine().replaceAll("\\s", "");

                System.out.println("Ingrese su apellido materno:");
                apellidoMaterno = sc.nextLine().replaceAll("\\s", "");

                System.out.println("Ingrese su dirección:");
                direccion = sc.nextLine().replaceAll("\\s", "");
                
                System.out.println("Ingrese su teléfono:");
                telefono = sc.nextLine().replaceAll("\\s", "");
                
                System.out.println("Ingrese su fecha de inicio de contrato (dd/MM/yyyy):");
                fechaInicioContratoS = sc.nextLine().replaceAll("\\s", "");
                fechaInicioContrato = dateFormat.parse(fechaInicioContratoS);
                
                System.out.println("Ingrese su fecha de fin de contrato (dd/MM/yyyy):");
                fechaFinContratoS = sc.nextLine().replaceAll("\\s", "");
                fechaFinContrato = dateFormat.parse(fechaFinContratoS);
                
                System.out.println("Ingrese su fecha de nacimiento (dd/MM/yyyy):");
                fechaNacimientoS = sc.nextLine().replaceAll("\\s", "");
                fechaNacimiento = dateFormat.parse(fechaNacimientoS);

                System.out.println("Ingrese su correo electrónico:");
                correoElectronico = sc.nextLine().replaceAll("\\s", "");
                
                System.out.println("Ingrese su género:");
                genero = sc.nextLine().replaceAll("\\s", "");

                System.out.println("Ingrese su especialidad:");
                especialidad = sc.nextLine().replaceAll("\\s", "");

                System.out.println("Ingrese su salario:");
                salario = sc.nextDouble();

                //CREAR OBJETO
                Veterinario veterinario = new Veterinario(rfc, nombre, apellidoPaterno, 
                apellidoMaterno, direccion, telefono, fechaInicioContrato, fechaFinContrato,
                fechaNacimiento, correoElectronico, genero, especialidad, salario);  
                
            case("Bioma"):
                System.out.println("Ingrese el ID del bioma:");
                idBioma = sc.nextInt();

                System.out.println("Ingrese el tipo del bioma:");
                tipoBioma = sc.nextLine().replaceAll("\\s", "");
                
                System.out.println("Ingrese el número de jaulas del bioma:");
                numeroJaulas = sc.nextInt();

                System.out.println("Ingrese el número de cuidadores del bioma:");
                numeroCuidadores = sc.nextInt();

                System.out.println("Ingrese el número de veterinarios del bioma:");
                numeroVeterinarios = sc.nextInt();
                
                System.out.println("Ingrese el número de animales del bioma:");
                numeroAnimales = sc.nextInt();
                
                // CREAR OBJETO
                Bioma bioma = new Bioma(idBioma, tipoBioma, numeroJaulas, numeroCuidadores,
                numeroVeterinarios, numeroAnimales);
                

            case("Animal"):
            
            default:
                System.out.println("Error al elegir el tipo (Caso casí imposible?)");
                break
                
        }
        // Poner metodo para construir un objeto dependiendo del tipo
        rfm.agregar(anadir, tipo);
        
    }

    /**
     * Metodo para mostrar un mensaje 
     */
    public static String pedirDatosAgregar(Scanner sc, String mensaje) {
        boolean haveIAResponse = false;
        do {
            System.out.println(mensaje);
            String input = sc.nextLine();
            boolean amISure = false;
            while (!amISure) {
                System.out.println("¿Esta seguro que desea guardar este dato?\n" +
                    "1.- SI.\n" +
                    "2.- NO.\n" +
                    "3.- REGRESAR.");
                String newInput = sc.nextLine().toLowerCase().replaceAll("\\s", "");
                if (newInput == "1" || newInput =="si") {
                    return input;
                } else if (newInput == "2" || newInput == "no") {
                    amISure = true;
                } else if (newInput == "3" || newInput == "regresar") {
                    return null;
                } else {
                    System.out.println("\nIngrese el número de la opción a realizar o escriba \"SI\" O \"NO\".\n");
                }
            } 
        } while (!haveIAResponse);
        return null;
    }

    /**
     * Metodo que realiza todo el ciclo o bucle del submenu Consultar, es decir, es el menu con
     * el puedes realizar todas las operaciones que soporta la operacion Consultar.
     * 
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     */
    private static void menuConsultar(Scanner sc) {
        String tipo = elegirTipo(sc, "Consultar");
        String clave = pedirClave(sc);
        String entidad = rfm.consultar(clave, tipo);
        if (entidad.equals("")) return;
        switch (tipo) {
            case "Veterinario":
                break;
            case "Biomas":
                break;
            case "Animales":
            default:
                break;
        }
    }

    /**
     * Metodo que realiza todo el ciclo o bucle del submenu Editar, es decir, es el menu con
     * el puedes realizar todas las operaciones que soporta la operacion Editar.
     * 
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     */
    private static void menuEditar(Scanner sc) {
        String tipo = elegirTipo(sc, "Consultar");
        String clave = pedirClave(sc);
        String entidad = rfm.consultar(clave, tipo);
        if (entidad.equals("")) return;
        String nueva_entidad = "";
        switch (tipo) {
            case "Veterinario":
                break;
            case "Biomas":
                break;
            case "Animales":
                break;
            default:
                System.out.println("Error al elegir el tipo (Caso casí imposible?)");
                break;
        }
        rfm.eliminar(clave, tipo);
        rfm.agregar(nueva_entidad, tipo);
        rfm.consultar(clave, tipo);
        
    }

    /**
     * Metodo que realiza todo el ciclo o bucle del submenu Eliminar, es decir, es el menu con
     * el puedes realizar todas las operaciones que soporta la operacion Eliminar.
     * 
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     */
    private static void menuEliminar(Scanner sc) {
        String tipo = elegirTipo(sc, "Eliminar");
        String clave = pedirClave(sc);
        boolean isItAnExit = false;
        do {
            System.out.println("¿Esta seguro que desea eliminarlo?\n" +
                "1.- SI.\n" +
                "2.- NO.\n");
            String input = sc.nextLine().toLowerCase().replaceAll("\\s", "");
            if (input == "1" || input =="si") {
                rfm.eliminar(clave, tipo);
            } else if (input == "2" || input == "no") {
                isItAnExit = true;
            } else {
                System.out.println("\nIngrese el número de la opción a realizar o escriba \"SI\" O \"NO\".\n");
            }
        } while(!isItAnExit);
    }
}