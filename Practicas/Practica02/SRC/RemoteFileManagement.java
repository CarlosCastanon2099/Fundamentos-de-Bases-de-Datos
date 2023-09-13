package SRC;

public class RemoteFileManagement implements FileManagementProxy {

    private FileManagement original; // Puente para la conexion con la escritura, consulta y borrado en los archivos.

    /**
     * Metodo constructor de la clase, se crea un puente entre la version
     * local y la remota usando el patron de diseño Proxy.
     */
    public RemoteFileManagement() {
        original = FileManagement.getInstance();
    }

    @Override
    public boolean agregar(String entidad, String tipo) {
        return original.agregar(entidad, tipo);
    }

    @Override
    public void consultar() {
        original.consultar();
    }

    @Override
    public boolean editar() {
        return original.editar();
    }

    @Override
    public boolean eliminar() {
        return original.eliminar();
    }     
}