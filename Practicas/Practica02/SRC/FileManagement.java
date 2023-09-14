
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;

import animal.*;
import bioma.*;
import empleado.*;

public class FileManagement implements FileManagementProxy {

    private static FileManagement instance; // Instancia unica de la clase.
    private String ruta; // Instancia de la ruta
    private String registro; // registro de la instancia en cuestión

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
                this.ruta = "SRC/Veterinarios.csv";
                return true;
                
            case "Biomas":
                this.ruta = "SRC/Biomas.csv";
                return true;
                
                case "Animales":
                this.ruta = "SRC/Animals.csv";
                return true;
                
            default:
                System.out.println("Ruta erronea: " + tipo);
                return false;
        }
    }
    private boolean buscarString(String llave) {
        boolean encontrar = false;
        String[] lineas = FileManagement.getInstance().leerArchivo(ruta);
        for (String linea : lineas) {
            if (linea.contains(llave)) {
                encontrar = true;
                this.registro = linea;
            }
        }
        return encontrar;
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
            Writer out = new OutputStreamWriter(new FileOutputStream(ruta, true), StandardCharsets.UTF_8);

            out.write(entidad + '\n');
 
            out.close();
        } catch(IOException e) {
            System.out.println("Error en el I/O: " + e);
        }
        return true;
    }

    @Override
    public String consultar(String llave, String tipo) {
        if ( !entidadRuta(tipo)){
            System.out.println("Ruta equivocada");
            return null;
        }
        if (buscarString(llave)) return (this.registro);
        else {
            System.out.println("No se encontró la llave");
            return null;
        }
    }


    @Override
    public boolean eliminar(String llave, String tipo) {
        if ( !entidadRuta(tipo)) return false;
        try {
            String[] lineas = FileManagement.getInstance().leerArchivo(ruta);
            BufferedWriter bw = new BufferedWriter(new FileWriter(ruta));
            for (String linea : lineas) {
                if (!linea.contains(llave)) {
                    bw.write(linea + "\n");
                }
            }
            bw.close();
        } catch (IOException e) {
            System.out.println("Error en el I/O: " + e);
        }
        return true;
    }

    // Funcion leerArchivo
    private String[] leerArchivo(String ruta) {
        String[] lineas = null;
        try {
            lineas = ManejoArchivosGenerico.leerArchivo(ruta);
        } catch (IOException e) {
            System.out.println("Error en el I/O: " + e);
        }
        return lineas;
    }

    // Manejo de archivos genericos
    private static class ManejoArchivosGenerico {
        public static String[] leerArchivo(String ruta) throws IOException {
            BufferedReader br = new BufferedReader(new FileReader(ruta));
            String[] lineas = br.lines().toArray(String[]::new);
            br.close();
            return lineas;
        }
    }

    

}

