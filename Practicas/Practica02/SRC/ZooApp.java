import java.util.Scanner;

public class ZooApp {

    public static void main(String[] args){
        menu();
    }

    private static void menu() {
        FileManagementProxy conection = new RemoteFileManagement();
        Scanner sc = new Scanner(System.in);
        boolean isItAnExit = false;
        do {
            // Cambiar para
            System.out.println(
                "1.- Agregar\n" +
                "2.- Consultar\n" +
                "3.- Editar\n" +
                "4.- Eliminar\n" +
                "5.- Salir"); 
            String input = sc.nextLine();
            int option = Integer.parseInt(input);    
            switch (option) {
                case 1: // Agregar
                    conection.agregar();
                    break;
                case 2: // consultar
                    conection.consultar();
                    break;
                case 3: // editar
                    conection.editar();
                    break;
                case 4: // eliminar
                    conection.eliminar();
                    break;
                case 5: // Salir
                    isItAnExit = true;
                    break;
                default:
                    System.out.println("INGRESE UN NÚMERO VALIDO.");
                    break;
            }
        } while(!isItAnExit);
        sc.close();
    }
}