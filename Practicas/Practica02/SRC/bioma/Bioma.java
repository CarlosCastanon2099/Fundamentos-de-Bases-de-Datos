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
    
    public void setTipoBioma (String tipoBioma){
        if (tipoBioma != null && !tipoBioma.isEmpty()) {
            this.tipoBioma = tipoBioma;
        }
    }

    public void setNumeroJaulas (int numeroJaulas){
        if (numeroJaulas > 0) {
            this.numeroJaulas = numeroJaulas;
        }
    }

    public void setNumeroCuidadores (int numeroCuidadores){
        if (numeroCuidadores > 0) {
            this.numeroCuidadores = numeroCuidadores;
        }
    }

    public void setNumeroAnimales (int numeroAnimales){
        if (numeroAnimales > 0) {
            this.numeroAnimales = numeroAnimales;
        }
    }

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
