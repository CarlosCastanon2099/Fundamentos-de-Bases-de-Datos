
public interface FileManagementProxy {

    public boolean agregar(String llave, String tipo);

    public String consultar(String llave, String tipo);

    public boolean eliminar(String llave, String tipo);    
}