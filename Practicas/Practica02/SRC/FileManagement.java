public class FileManagement implements FileManagementProxy {

    private static FileManagement instance;

    /**
     * Método contructor privado para poder usar el patron de disenno de sofware
     * Singleton.
     */
    private FileManagement(){}

    public static synchronized FileManagement getInstance() {
        if (instance == null) {
            instance = new FileManagement();
        }
        return instance;
    }

    /**
     * LOS SIGUIENTES METODOS SOLO VAN A SER DE CONSULTA, ES DECIR, AQUI NO DEBEMOS
     * A HACER LOGICA DE VERIFICACIONES DE QUE SI EL USUARIO INGRESO COSAS COMO "" (CADENA VACIA)
     * O INGRESO LETRAS EN LUGAR DE NUMEROS, ETC.
     * 
     * ES DECIR EN LOS SIGUIENTES METODOS YA DEBEMOS ESTAR SEGURO DE LO QUE AGREGAMOS.
     */

    public boolean agregar() {
        System.out.println("\nAQUI DEBEMOS A HACER LA AGREGACION.\n");
        return true;
    }

    public void consultar() {
        System.out.println("\nAQUI DEBEMOS A HACER LA CONSULTA.\n");
    }

    public boolean editar() {
        System.out.println("\nAQUI DEBEMOS A HACER LA EDICION.\n");
        return true;
    }

    public boolean eliminar() {
        System.out.println("\nAQUI DEBEMOS A HACER LA ELIMINACION\n");
        return true;
    }
}