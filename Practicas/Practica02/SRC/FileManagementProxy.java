/** 
 * Interface que define los metodos que debe implementar un proxy para el manejo de archivos.
 * 
 * @version 1.0, 15/09/2023
 */
public interface FileManagementProxy {

    /**
     * Metodo que agrega un registro a un archivo.
     * @param llave es la llave de la entidad que se quiere agregar
     * @param tipo es el tipo de entidad que se quiere agregar
     * @return True si fue posible agregarlo, false de lo contrario
     */
    public boolean agregar(String llave, String tipo);

    /**
     * Metodo que consulta un registro de un archivo.
     * @param llave es la llave de la entidad que se quiere consultar
     * @param tipo es el tipo de entidad que se quiere consultar
     * @return El registro de la entidad en cuestion
     */
    public String consultar(String llave, String tipo);

    /**
     * Metodo que elimina un registro de un archivo.
     * @param llave es la llave de la entidad que se quiere eliminar
     * @param tipo es el tipo de entidad que se quiere eliminar
     * @return True si fue posible eliminarlo, false de lo contrario
     */
    public boolean eliminar(String llave, String tipo);    
}