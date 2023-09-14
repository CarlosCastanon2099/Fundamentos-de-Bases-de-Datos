package SRC;

import java.io.IOException;
import java.io.BufferedWriter;
import java.io.FileWriter
;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;

public class FileManagement implements FileManagementProxy {

    private static FileManagement instance; // Instancia unica de la clase.
    private  String ruta; // Instancia de la ruta

    /**
     * Metodo contructor privado para poder usar el patron de disenno de software
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
     * Metodo privado para cambiar la ruta del archivo al que se quiere modificar
     * 
     * @param tipo El tipo de entidad que pertenece el archivo en cuestion
     * @return  True si fue posible cambiarlo, false de lo contrario
     */
    private boolean entidadRuta(String tipo){
        switch (tipo) {
            case "Veterinarios":
                this.ruta = "Veterinarios.csv";
                return true;
                
            case "Bioma":
                this.ruta = "Bioma.csv";
                return true;
                
                case "Animal":
                this.ruta = "Animal.csv";
                return true;
                
            default:
                System.out.println("Ruta erronea: " + tipo);
                return false;
        }
    }

    /**
     * LOS SIGUIENTES METODOS SOLO VAN A SER DE CONSULTA, ES DECIR, AQUI NO DEBEMOS
     * A HACER LOGICA DE VERIFICACIONES DE QUE SI EL USUARIO INGRESO COSAS COMO "" (CADENA VACIA)
     * O INGRESO LETRAS EN LUGAR DE NUMEROS, ETC.
     * 
     * ES DECIR EN LOS SIGUIENTES METODOS YA DEBEMOS ESTAR SEGURO DE LO QUE AGREGAMOS.
     */

    @Override
    public boolean agregar(String entidad, String tipo) {
        
        if ( !entidadRuta(tipo)) return false;
        try {
            BufferedWriter out = new BufferedWriter(new FileWriter(ruta, true));
 
            out.write("Jijijijiji\n");
 
            out.close();
        } catch(IOException e) {
            System.out.println("Error en el I/O: " + e);
        }
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

