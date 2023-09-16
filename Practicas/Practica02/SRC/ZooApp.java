
import java.util.Date;
import java.util.Locale;
import java.text.SimpleDateFormat;
import java.util.Scanner;

import animal.*;
import bioma.*;
import bioma.Bioma.ServiciosVisitantes;
import empleado.*;



public class ZooApp {

    public static void main(String[] args){
        app();
    }
    static RemoteFileManagement rfm = new RemoteFileManagement();
    public static String[] veterinario_atributos = new String[]{"Nombre","Apellido Paterno",
                                "Apellido Materno", "Direccion", "Telefono", "Fecha de Inicio del Contrato",
                                "Fecha de Fin del Contrato", "Fecha de Nacimiento", "Correo Electronico",
                                "Genero", "Especialidad", "Salario"};
    public static String[] bioma_atributos = new String[]{"Tipo de Bioma", "Numero de Jaulas", "Numero de Cuidadores",
                                "Numero de Veterinarios", "Numero de Animales", "Numero de Banos",
                                "Numero de Tiendas", "Numero de Comida"};
    public static String[] animal_atributos = new String[]{"Nombre del Animal", "Especie", "Peso", "Altura", "Sexo", 
                                "Numero de Jaula", "Alimentacion", "Indicaciones Medicas"};

    /**
     * Metodo que nos regresa un String, el cual es el menu de opciones principales
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
                "5.- Salir\n";
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
                        System.out.println("\n¡Adios! Ten un buen dia :)");
                        break;
                    default:
                        System.out.println("\nIngrese un numero de nuestro menu, en un rango de [1, 5].\n");
                        break;
                }
            } catch (java.lang.NumberFormatException e) {
                System.err.println("\nSolo ingrese un numero de nuestro menu de opciones sin ningun otro caracter.\n");
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
    private static String menuSigns(String option) {
        switch (option) {
            case "Agregar":
                return  "\n------------------------------------------------\n" +
                        "|                MENU \"AGREGAR\"                |\n" +
                        "------------------------------------------------\n\n";
            case "Consultar":
                return  "\n------------------------------------------------\n" +
                        "|              MENU \"CONSULTAR\"                |\n" +
                        "------------------------------------------------\n\n";
            case "Editar":
                return  "\n------------------------------------------------\n" +
                        "|               MENU \"EDITAR\"                  |\n" +
                        "------------------------------------------------\n\n";
            default:
                return  "\n------------------------------------------------\n" +
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
     * Metodo para que el usuario ingrese la clave, ya sea para consulta, editar o eliminar.
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     * @return  La clave que el usuario ingreso
     */
    private static String pedirClave(Scanner sc) {
        System.out.println("\nIngrese el ID para poder encontrarlo:\n");
        return sc.nextLine().replaceAll("\\s", "").replace(",", "~");
    }

    /**
     * Metodo para desplegar el menu para elegir que tipo de entidad estamos manejando
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     * @return  Regresa el tipo de entidad, o una opci;on para salir del menu
     */
    private static String elegirTipo(Scanner sc, String tipo_Menu){
        boolean isItAnExit = false;
        do {
            System.out.println(setMenu(menuSigns(tipo_Menu), tipo_Menu));
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
                    default: // Opcion incorrecta
                        System.out.println("\nIngrese un numero de nuestro menu, en un rango de [1, 4].\n");
                        break;
                }          
            } catch (java.lang.NumberFormatException e) {
                System.err.println("\nSolo ingrese un numero de nuestro menu de opciones sin ningun otro caracter.\n");
            }
        }while (!isItAnExit);
        return "Salir";
    }
    
    /**
     * Verifica si el usuario ingreso un entero
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     * @param mensaje el mensaje que va a tener el dato que requiere.
     * @return Regresa un string que es el dato que se pide en el scanner, null si el usuario quiere terminar la ejecucion.
     */
    private static String verificarEsUnEntero(String mensaje) {
        while (true) {
            String input = pedirDatosAgregar(mensaje);
            if (input == null) {return null;}
            try {
                input = input.replaceAll("\\s", "");
                int entero = Integer.parseInt(input);
                return String.valueOf(entero);
            } catch (Exception e) {
                System.err.println("\nNo se permite ingresar otros caracteres mas que numeros.\n");
            }
        }
    }
    
    /**
     * Verifica si el usuario ingreso un double
     * @param mensaje el mensaje que va a tener el dato que requiere.
     * @return Regresa un string que es el dato que se pide en el scanner, null si el usuario quiere terminar la ejecucion.
     */
    private static String verificarEsUnDouble(String mensaje) {
        while (true) {
            String input = pedirDatosAgregar(mensaje);
            if (input == null) {return null;}
            try {
                input = input.replaceAll("\\s", "");
                double entero = Double.parseDouble(input);
                return String.valueOf(entero);
            } catch (Exception e) {
                System.err.println("\nNo se permite ingresar otros caracteres mas que numeros.\n");
            }
        }
    }

    /**
     * Verifica si el usuario ingreso un double
     * @param mensaje el mensaje que va a tener el dato que requiere.
     * @return Regresa un string que es el dato que se pide en el scanner, null si el usuario quiere terminar la ejecucion.
     */
private static Date verificarEsUnaFecha(String mensaje) {
        while (true) {
            String input = pedirDatosAgregar(mensaje);
            if (input == null) {
                return null;
            }
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy" );
            input = input.replaceAll("\\s", "");
            try {
                Date fecha = dateFormat.parse(input);
                return fecha;
            } catch (Exception e) {
                System.err.println("\nFormato de fecha incorrecto. Ingrese la fecha en formato dd/MM/yyyy.\n");
            }
        }
    }

    /**
     * Metodo para crear un objeto tipo Veterinario
     * @param tipo tipo del objeto
     * @return Un objeto Veterinario
     */
    private static Veterinario crearVeterinario(String tipo){
        // Datos Veterinario
        String rfc, nombre, apellidoPaterno, apellidoMaterno, 
        direccion, telefono, correoElectronico, genero, especialidad;
        double salario;
        Date fechaNacimiento, fechaInicioContrato, fechaFinContrato;

        try{
                rfc = pedirDatosAgregar("Ingrese su RFC:");
                if ( (rfm.consultar(rfc, tipo) != null)){
                System.out.println("El RfC ya esta ocupado. Intenta con agregar un RfC diferente.");
                return null;
                }
                System.out.println ("Por lo tanto la llave es unica");
            
                nombre = pedirDatosAgregar("Ingrese su nombre:");
                if (nombre == null) return null;
                
                apellidoPaterno = pedirDatosAgregar("Ingrese su apellido paterno:");
                if (apellidoPaterno == null) return null;
                
                apellidoMaterno = pedirDatosAgregar("Ingrese su apellido materno:");
                if (apellidoMaterno == null) return null;

                direccion = pedirDatosAgregar("Ingrese su direccion:");
                if (direccion == null) return null;
                
                telefono = verificarEsUnEntero("Ingrese su telefono:");
                if (telefono == null) return null;

                fechaInicioContrato = verificarEsUnaFecha("Ingrese su fecha de inicio de contrato (dd/MM/yyyy):");
                if (fechaInicioContrato == null) return null;

                fechaFinContrato = verificarEsUnaFecha("Ingrese su fecha de fin de contrato (dd/MM/yyyy):");
                if (fechaFinContrato == null) return null;

                fechaNacimiento = verificarEsUnaFecha("Ingrese su fecha de nacimiento (dd/MM/yyyy):");
                if (fechaNacimiento == null) return null;

                correoElectronico = pedirDatosAgregar("Ingrese su correo electronico:");
                if (correoElectronico == null) return null;

                genero = pedirDatosAgregar("Ingresa su genero:");
                if (genero == null) return null;
                
                especialidad = pedirDatosAgregar("Ingrese su especialidad:");
                if (especialidad == null) return null;

                String salarioString = verificarEsUnDouble("Ingrese su salario:");
                if (salarioString == null) return null;
                salario = Double.parseDouble(salarioString);

                Veterinario veterinario = new Veterinario(rfc, nombre, apellidoPaterno, 
                apellidoMaterno, direccion, telefono, fechaInicioContrato, fechaFinContrato,
                fechaNacimiento, correoElectronico, genero, especialidad, salario); 
                
                return veterinario;
            }catch (Exception e) {e.getMessage();}
        return null;
    }

    /**
     * Metodo para crear un objeto tipo Bioma
     * @param tipo tipo del objeto
     * @return Un objeto bioma
     */
    private static Bioma crearBioma(String tipo){
        
        //Datos Bioma
        String idBiomaString, tipoBioma, numeroJaulasString, numeroCuidadoresString, numeroVeterinariosString,
                numeroAnimalesString, numeroBanosString, numeroTiendasString, numeroComidaString;
        int idBioma, numeroJaulas, numeroCuidadores, numeroVeterinarios, numeroAnimales, numeroBanios, 
                numeroTiendas, numeroComida;

        idBiomaString = verificarEsUnEntero("Ingrese el ID del bioma:");
        if (idBiomaString == null) return null;
        idBioma = Integer.parseInt(idBiomaString);
        if ( (rfm.consultar(idBiomaString, tipo) != null)){
            System.out.println("El ID del bioma ya esta ocupado. Intenta con agregar un Id diferente.");
            return null;
        }
        System.out.println ("Por lo tanto la llave es unica");

        tipoBioma = pedirDatosAgregar("Ingrese el tipo del bioma:");
        if (tipoBioma == null) return null;
        
        numeroJaulasString = verificarEsUnEntero("Ingrese el numero de jaulas de animales:");
        if (numeroJaulasString == null) return null;
        numeroJaulas = Integer.parseInt(numeroJaulasString);

        numeroCuidadoresString = verificarEsUnEntero("Ingrese el numero de cuidadores del bioma:");
        if (numeroCuidadoresString == null) return null;
        numeroCuidadores = Integer.parseInt(numeroCuidadoresString);

        numeroVeterinariosString = verificarEsUnEntero("Ingrese el numero de veterinarios del bioma:");
        if (numeroVeterinariosString == null) return null;
        numeroVeterinarios = Integer.parseInt(numeroVeterinariosString);

        numeroAnimalesString = verificarEsUnEntero("Ingrese el numero de animales del bioma:");
        if (numeroAnimalesString == null) return null;
        numeroAnimales = Integer.parseInt(numeroAnimalesString);

        numeroBanosString = verificarEsUnEntero("Ingrese el numero de banos del bioma:");
        if (numeroBanosString == null) return null;
        numeroBanios = Integer.parseInt(numeroBanosString);

        numeroTiendasString = verificarEsUnEntero("Ingrese el numero de tiendas del bioma:");
        if (numeroTiendasString  == null) return null;
        numeroTiendas = Integer.parseInt(numeroTiendasString );

        numeroComidaString = verificarEsUnEntero("Ingrese el numero de Comidas del bioma:");
        if (numeroComidaString  == null) return null;
        numeroComida = Integer.parseInt(numeroComidaString);
        
        ServiciosVisitantes serviciosVisitantes = new ServiciosVisitantes(numeroBanios, numeroTiendas, numeroComida);
        
        Bioma bioma = new Bioma(idBioma, tipoBioma, numeroJaulas, numeroCuidadores,
        numeroVeterinarios, numeroAnimales, 
        serviciosVisitantes);
        return bioma;
    }

    /**
     * Metodo para crear un objeto tipo Animal
     * @param tipo tipo del objeto
     * @return Un objeto animal
     */
    private static Animal crearAnimal(String tipo){
        
        // Datos Animal
        int idAnimal, numeroJaula;
        double peso, altura;
        String sexo, alimentacion, 
        indicacionesMedicas, nombreAnimal, especie;
        String idAnimalS = verificarEsUnEntero("Ingrese el ID del animal:");
        if (idAnimalS == null) return null;
        idAnimal = Integer.parseInt(idAnimalS);
        if ( (rfm.consultar(idAnimalS, tipo) != null)){
            System.out.println("El ID del animal ya esta ocupado. Intenta con agregar un Id diferente.");
            return null;
        }
        System.out.println ("Por lo tanto la llave es unica");
        
        String nombreAnimalS = pedirDatosAgregar("Ingrese el nombre del animal:");
        if (nombreAnimalS == null) return null;
        nombreAnimal = nombreAnimalS;
        
        especie = pedirDatosAgregar("Ingrese la especie del animal:");
        if (especie == null) return null;

        String numeroJaulaS = verificarEsUnEntero("Ingrese el numero de jaula del animal:");
        if (numeroJaulaS == null) return null;
        numeroJaula = Integer.parseInt(numeroJaulaS);

        String pesoS = verificarEsUnDouble("Ingrese el peso del animal:");
        if (pesoS == null) return null;
        peso = Double.parseDouble(pesoS);

        String alturaS = verificarEsUnDouble("Ingrese la altura del animal:");
        if (alturaS == null) return null;
        altura = Double.parseDouble(alturaS);

        sexo = pedirDatosAgregar("Ingrese el sexo del animal:");
        if (sexo == null) return null;

        alimentacion = pedirDatosAgregar("Ingrese la alimentacion del animal:");
        if (alimentacion == null) return null;

        indicacionesMedicas = pedirDatosAgregar("Ingrese las indicaciones medicas del animal:");
        if (indicacionesMedicas == null) return null;
        
        Animal animal = new Animal(idAnimal, nombreAnimal, especie, 
        peso, altura, sexo, numeroJaula, alimentacion, indicacionesMedicas);

        return animal;
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

        // String resultado
        String resultado = "";


        switch(tipo){
            case ("Veterinarios"):
                Veterinario veterinario = crearVeterinario(tipo);
                if (veterinario == null) return;
                System.out.println(veterinario.toStringConsola());
                resultado = veterinario.toString();
                break;

            case("Biomas"):
                Bioma bioma = crearBioma(tipo);
                if (bioma == null) return;
                System.out.println(bioma.toStringConsola());
                resultado = bioma.toString();
                break;

            case("Animales"):
                Animal animal = crearAnimal(tipo);
                if (animal == null) return;
                System.out.println(animal.toStringConsola()); 
                resultado = animal.toString();
                System.out.println(animal.toStringConsola());
                break;

            default:
                System.out.println("Error al elegir el tipo (Caso casi imposible?)");
                break;
        }
        rfm.agregar(resultado, tipo);        
    }

    /**
     * Metodo para mostrar un mensaje de agregacion de atributos de entidades
     * 
     * @param sc es el Scannner con el cual vamos a realizar la entrada al usuario.
     * @param mensaje es el mensaje del atributo en forma de pregunta que vamos a realizar al usuario.4EVER
     * 
     * @return un String en caso de que el usuario este de acuerdo en ingresar a guardar ese dato. Regresa 
     * Null en caso de regresar.
     */
    private static String pedirDatosAgregar(String mensaje) {
        Scanner scNuevo = new Scanner(System.in);
        boolean haveIAResponse = false;
        do {
            System.out.println(mensaje);
            String input = scNuevo.nextLine();
            input = input.replaceAll(",", "~");
            boolean amISure = false;
            while (!amISure) {
                System.out.println("¿Esta seguro que desea guardar este dato?\n" +
                    "1.- SI.\n" +
                    "2.- NO.\n" +
                    "3.- REGRESAR.");
                String newInput = scNuevo.nextLine().toLowerCase().replaceAll("\\s", "~");
                if (newInput.equals("1") || newInput.equals("si")) {
                    return input;
                } else if (newInput.equals("2") || newInput.equals("no")) {
                    amISure = true;
                } else if (newInput.equals("3") || newInput.equals("regresar")) {
                    return null;
                } else {
                    System.out.println("\nIngrese el numero de la opcion a realizar o escriba \"SI\" O \"NO\".\n");
                }
            } 
        } while (!haveIAResponse);
        scNuevo.close();
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
        if (tipo == "Salir") return;
        String clave = pedirClave(sc);
        String entidad = rfm.consultar(clave, tipo);
        if (entidad == null) return;
        String[] atr = entidad.split(",");
        for (int i = 0; i < atr.length; i++) {
            atr[i] = atr[i].replaceAll("~", ",");
        }
        switch (tipo) {
            case "Veterinarios":
                try {
                    SimpleDateFormat dateFormat = new SimpleDateFormat(" EE MMM dd HH:mm:ss z yyyy" , Locale.ENGLISH);
                    Veterinario veterinario = new Veterinario(atr[0], atr[1],
                    atr[2],atr[3], atr[4], atr[5], dateFormat.parse(atr[6]),
                    dateFormat.parse(atr[7]), dateFormat.parse(atr[8]), atr[9],
                    atr[10], atr[11], Double.parseDouble(atr[12]));
                    System.out.println(veterinario.toStringConsola());
                } catch (java.text.ParseException e) {
                    System.out.println("Error al crear veterinario");
                    e.printStackTrace();
                }
                break;
            case "Biomas":
                Bioma bioma = new Bioma( Integer.parseInt(atr[0]), atr[1],
                            Integer.parseInt(atr[2]), Integer.parseInt(atr[3]),
                            Integer.parseInt(atr[4]), Integer.parseInt(atr[5]),
                            new ServiciosVisitantes(Integer.parseInt(atr[6]), Integer.parseInt(atr[7]), Integer.parseInt(atr[8])));
                System.out.println(bioma.toStringConsola());
                break;
            case "Animales":
                Animal animal = new Animal(Integer.parseInt(atr[0]) , atr[1], atr[2],
                            Double.parseDouble(atr[3]), Double.parseDouble(atr[4]), atr[5],
                            Integer.parseInt(atr[6]), atr[7], atr[8]);
                System.out.println(animal.toStringConsola());
                break;
            default:
                System.out.println("Ocurrio un error en la seleccion del tipo");
                break;
        }
    }

    /**
     * Metodo que nos regresa los diferentes tipos de atributos que se pueden editar segun el tipo 
     * de dato queremos editar
     * 
     * @param option es el numero de menu que se desea obtener.
     *      - Option 1: Veterinario.
     *      - Option 2: Bioma
     *      - Option 3: Animal
     *      - Option C.O.C: Regresar
     * @return un String el cual representa la cabecera del menu correspondiente
     * a la opcion especificada.
     */
    private static void menuEdit(String option) {
        String[] opcion_Menu;
        switch (option) {
            case "Veterinarios":
                opcion_Menu = veterinario_atributos;
                break;
            case "Biomas":
                opcion_Menu = bioma_atributos;
                break;
            case "Animales":
                opcion_Menu = animal_atributos;
                break;
            default:
            System.out.println("Opcion invalida, ¿Como llegaste aqui ._. ?");
            return;
        }
        System.out.println("\nIngrese el numero del atributo a editar.");
        for ( int i = 0 ; i < opcion_Menu.length; i++) {
            System.out.println(String.format("%d.- %s", i+1, opcion_Menu[i]));            
        }
        System.out.println( "0.- Volver\n");
    }


    /**
     * Metodo para editar un atributo de una entidad.
     * @param atributo Numero del atributo de la entidad.
     * @param entidad Entidad la cual se va a editar.
     * @param tipo Tipo del atributo de la entidad.
     * @param int Numero del atributo en la entidad
     */
    private static String editarAtributo(String atributo, String entidad, String tipo, int num_atributo){
        String atributo_nuevo = "";
        String entidad_actualizada = "";
        boolean salir = true;
        String[] entidad_separada = entidad.split(",");
        do {
            switch (tipo) {
                case "Double":
                    atributo_nuevo = verificarEsUnDouble("Ingrese el "+ atributo  + " nuevo.\n");
                    if (atributo_nuevo == null) return null;
                    salir = false;
                    break;

                case "String":
                    atributo_nuevo = pedirDatosAgregar("\nIngrese el "+ atributo  + " nuevo.\n");
                    if (atributo_nuevo == null) return null;
                    salir = false;
                    break;
                    
                case "Int":
                    atributo_nuevo = verificarEsUnEntero("\nIngrese el "+ atributo  + " nuevo.\n");
                    if (atributo_nuevo == null) return null;
                    salir = false;
                    break;
                    
                case "Date":
                    Date fecha = verificarEsUnaFecha("\nIngrese la "+ atributo  + " nuevo.\n");
                    if (fecha == null) return null;
                    atributo_nuevo = " " + fecha.toString();
                    salir = false;
                    break;
                    
                default:
                    System.out.println("Error al tipo que pertenece el atributo");
                    continue;
            }
        } while (salir);
        entidad_separada[num_atributo] = atributo_nuevo;
        for (String  each_String: entidad_separada) {
            entidad_actualizada += each_String + ",";
        }
        entidad_actualizada = entidad_actualizada.substring(0, entidad_actualizada.length()-1);
        return entidad_actualizada;
    }

    /**
     * Metodo que realiza todo el ciclo o bucle del submenu Editar, es decir, es el menu con
     * el puedes realizar todas las operaciones que soporta la operacion Editar.
     * 
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     */
    private static void menuEditar(Scanner sc) {
        String tipo = elegirTipo(sc, "Editar");
        if (tipo == "Salir") return;
        String clave = pedirClave(sc);
        String entidad = rfm.consultar(clave, tipo);
        if (entidad == null) return;
        System.out.println("\nLa entidad a editar es: " + entidad.split(",")[1]);
        String nueva_entidad_tipo = "";
        String[] entidad_atributo = veterinario_atributos;
        boolean salir = false;
        int option;
        do {
            menuEdit(tipo);
            String input = sc.nextLine().replaceAll("\\s", "");
            option = Integer.parseInt(input);
            try {
                switch (tipo) {
                    case "Veterinarios":
                        if (option <= -1 || option >= 13){
                            System.out.println("\nIngrese un numero del menu, en el rango especificado.\n");
                            continue;
                        }

                        if (option == 0) return;
                        
                        salir = true;
                        entidad_atributo = veterinario_atributos;
                        if (option == 12 ){ nueva_entidad_tipo = "Double"; break;}
                        if (option >= 6 && option <=  8 ){ nueva_entidad_tipo = "Date"; break;} 
                        nueva_entidad_tipo = "String";
                        break;

                    case "Biomas": 
                        if (option <= -1 || option >= 9){
                            System.out.println("\nIngrese un numero del menu, en el rango especificado.\n");
                            continue;
                        }

                        if (option == 0) return;

                        salir = true;
                        entidad_atributo = bioma_atributos;
                        if (option == 1) { nueva_entidad_tipo = "String"; break;}
                        nueva_entidad_tipo = "Int";
                        break;
                    case "Animales":
                        if (option <= -1 || option >= 9){
                            System.out.println("\nIngrese un numero del menu, en el rango especificado.\n");
                            continue;
                        }
                        
                        if (option == 0) return;

                        salir = true;
                        entidad_atributo = animal_atributos;
                        if (option == 6 ) {nueva_entidad_tipo = "Int"; break;}
                        if (option == 3 || option == 4) {nueva_entidad_tipo = "Double"; break;}
                        nueva_entidad_tipo = "String" ;
                        break;
                    default:
                        System.out.println("\nError en el el tipo.\n");
                        continue;
                }          
            } catch (java.lang.NumberFormatException e) {
                System.err.println("\nSolo ingrese un numero de nuestro menu de opciones sin ningun otro caracter.\n");
            }
        }while (!salir);
        String nueva_entidad = editarAtributo( entidad_atributo[option-1], entidad, nueva_entidad_tipo, option );
        if (nueva_entidad == null) return;
        rfm.eliminar(clave, tipo);
        rfm.agregar(nueva_entidad, tipo);
        nueva_entidad = rfm.consultar(clave, tipo);
        String[] sep = nueva_entidad.split(",");
        System.out.println("Se ha actualizado la entidad");
        switch (tipo) {
            case "Veterinarios":
                try {
                    SimpleDateFormat dateFormat = new SimpleDateFormat(" EE MMM dd HH:mm:ss z yyyy" , Locale.ENGLISH);
                    Veterinario veterinario = new Veterinario(sep[0], sep[1],
                    sep[2],sep[3], sep[4], sep[5], dateFormat.parse(sep[6]),
                    dateFormat.parse(sep[7]), dateFormat.parse(sep[8]), sep[9],
                    sep[10], sep[11], Double.parseDouble(sep[12]));
                    System.out.println(veterinario.toStringConsola());
                } catch (java.text.ParseException e) {
                    System.out.println("Error al crear veterinario");
                    e.printStackTrace();
                }
                break;
            case "Biomas":
                Bioma bioma = new Bioma( Integer.parseInt(sep[0]), sep[1],
                            Integer.parseInt(sep[2]), Integer.parseInt(sep[3]),
                            Integer.parseInt(sep[4]), Integer.parseInt(sep[5]),
                            new ServiciosVisitantes(Integer.parseInt(sep[6]), Integer.parseInt(sep[7]), Integer.parseInt(sep[8])));
                System.out.println(bioma.toStringConsola());
                break;
            case "Animales":
                Animal animal = new Animal(Integer.parseInt(sep[0]) , sep[1], sep[2],
                            Double.parseDouble(sep[3]), Double.parseDouble(sep[4]), sep[5],
                            Integer.parseInt(sep[6]), sep[7], sep[8]);
                System.out.println(animal.toStringConsola());
                break;
        }
    }

    /**
     * Metodo que realiza todo el ciclo o bucle del submenu Eliminar, es decir, es el menu con
     * el puedes realizar todas las operaciones que soporta la operacion Eliminar.
     * 
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     */
    private static void menuEliminar(Scanner sc) {
        String tipo = elegirTipo(sc, "Eliminar");
        if (tipo == "Salir") return;
        String clave = pedirClave(sc);
        String entidad = rfm.consultar(clave, tipo);
        if (entidad == null) return;
        System.out.println("\nLa entidad a eliminar es: " + entidad.split(",")[1]);
        boolean isItAnExit = false;
        do {
            System.out.println("¿Esta seguro que desea eliminarlo?\n" +
                "1.- SI.\n" +
                "2.- NO.\n");
            String input = sc.nextLine().toLowerCase().replaceAll("\\s", "");
            if (input.equals("1") || input.equals("si")) {
                rfm.eliminar(clave, tipo);
                isItAnExit = true;
            } else if (input.equals("2") || input.equals("no")) {
                isItAnExit = true;
            } else {
                System.out.println("\nIngrese el numero de la opcion a realizar o escriba \"SI\" O \"NO\".\n");
            }
        } while(!isItAnExit);
    }
}