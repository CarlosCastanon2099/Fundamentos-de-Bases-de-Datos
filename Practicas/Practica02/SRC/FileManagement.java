package SRC;

public class FileManagement implements FileManagementProxy {

    private static FileManagement instance; // Instancia unica de la clase.

    /**
     * Metodo contructor privado para poder usar el patron de disenno de sofware
     * Singleton.
     */
    private FileManagement() {}

    /**
     * Metodo que da acceso a la instancia unica de la clase.
     * Si la instancia aun no se ha creado; se crea una nueva, de lo contrario regresamos
     * la instancia existente.
     *
     * @return la instancia de la clase.
     */
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

    @Override
    public boolean agregar() {
        System.out.println("\nAQUI DEBEMOS A HACER LA AGREGACION.\n");
        return true;
    }

    @Override
    public void consultar() {
        System.out.println("\nAQUI DEBEMOS A HACER LA CONSULTA.\n");
    }

    @Override
    public boolean editar() {
        System.out.println("\nAQUI DEBEMOS A HACER LA EDICION.\n");
        return true;
    }

    @Override
    public boolean eliminar() {
        System.out.println("\nAQUI DEBEMOS A HACER LA ELIMINACION\n");
        return true;
    }
}