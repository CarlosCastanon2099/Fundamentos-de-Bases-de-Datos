public class RemoteFileManagement implements FileManagementProxy {

    private FileManagement original;

    public RemoteFileManagement() {
        original = FileManagement.getInstance();
    }

    public boolean agregar() {
        return original.agregar();
    }

    public void consultar() {
        original.consultar();
    }

    public boolean editar() {
        return original.editar();
    }

    public boolean eliminar() {
        return original.eliminar();
    }     
}