package bioma;

import java.util.ArrayList;

public class Bioma {
    private String tipoBioma;
    private int numeroJaulas;
    private int numeroCuidadores;
    private int numeroVeterinarios;
    private int numeroAnimales;
    private ServiciosVisitantes serviciosVisitantes;

    // Constructor de la clase Bioma
    public Bioma(String tipoBioma, int numeroJaulas, int numeroCuidadores,
                 int numeroVeterinarios, int numeroAnimales,
                 ServiciosVisitantes serviciosVisitantes) {
        this.tipoBioma = tipoBioma;
        this.numeroJaulas = numeroJaulas;
        this.numeroCuidadores = numeroCuidadores;
        this.numeroVeterinarios = numeroVeterinarios;
        this.numeroAnimales = numeroAnimales;
        this.serviciosVisitantes = serviciosVisitantes;
    }

    // Métodos getters y setters para los atributos de Bioma

    // POR IMPLEMENTAR

    // Clase interna para representar los servicios a visitantes
    public static class ServiciosVisitantes {
        private int numeroBanios;
        private int numeroTiendas;
        private int numeroComida;

        // Constructor de la clase ServiciosVisitantes
        public ServiciosVisitantes(int numeroBanios, int numeroTiendas, int numeroComida) {
            this.numeroBanios = numeroBanios;
            this.numeroTiendas = numeroTiendas;
            this.numeroComida = numeroComida;
        }

        // Métodos getters y setters para los atributos de servicios a visitantes

        // POR IMPLEMENTAR
    }
}
