package SRC;

public interface FileManagementProxy {

    public boolean agregar(String entidad, String tipo);

    public void consultar();

    public boolean editar();

    public boolean eliminar();    
}