/** 
 * Clase que implementa el patron de diseno Proxy, se encarga de crear un puente
 * 
 * @version 1.0, 15/09/2023
 */
public class RemoteFileManagement implements FileManagementProxy {

    private FileManagement original; // Puente para la conexion con la escritura, consulta y borrado en los archivos.

    /**
     * Metodo constructor de la clase, se crea un puente entre la version
     * local y la remota usando el patron de diseno Proxy.
     */
    public RemoteFileManagement() {
        original = FileManagement.getInstance();
    }

    @Override
    public boolean agregar(String entidad, String tipo) {
        return original.agregar(entidad, tipo);
    }

    @Override
    public String consultar(String llave, String tipo) {
        return original.consultar(llave, tipo);
    }

    @Override
    public boolean eliminar(String llave, String tipo) {
        return original.eliminar(llave, tipo);
    }     
}