package bioma;

public class Bioma {
    private int idBioma;
    private String tipoBioma;
    private int numeroJaulas;
    private int numeroCuidadores;
    private int numeroVeterinarios;
    private int numeroAnimales;
    private ServiciosVisitantes serviciosVisitantes;

    // Constructor de la clase Bioma
    public Bioma(int idBioma, String tipoBioma, int numeroJaulas, int numeroCuidadores,
                 int numeroVeterinarios, int numeroAnimales,
                 ServiciosVisitantes serviciosVisitantes) {
        this.idBioma = idBioma;
        this.tipoBioma = tipoBioma;
        this.numeroJaulas = numeroJaulas;
        this.numeroCuidadores = numeroCuidadores;
        this.numeroVeterinarios = numeroVeterinarios;
        this.numeroAnimales = numeroAnimales;
        this.serviciosVisitantes = serviciosVisitantes;
    }
    
    // Metodos setters para los atributos de Bioma
    /** 
     * Metodo setter para el atributo idBioma
     * 
     * @param idBioma el id del bioma
     */
    public void setIdBioma (int idBioma){
        if (idBioma > 0) {
            this.idBioma = idBioma;
        }
    }
    
    /**  
     * Metodo setter para el atributo tipoBioma
     * 
     * @param tipoBioma
     */
    public void setTipoBioma (String tipoBioma){
        if (tipoBioma != null && !tipoBioma.isEmpty()) {
            this.tipoBioma = tipoBioma;
        }
    }

    /**  
     * Metodo setter para el atributo numeroVeterinarios
     * 
     * @param numeroVeterinarios el numero de veterinarios
    */
    public void setNumeroVeterinarios (int numeroVeterinarios){
        if (numeroVeterinarios > 0) {
            this.numeroVeterinarios = numeroVeterinarios;
        }
    }

    /**  
     * Metodo setter para el atributo numeroJaulas
     * 
     * @param numeroJaulas el numero de jaulas
    */
    public void setNumeroJaulas (int numeroJaulas){
        if (numeroJaulas > 0) {
            this.numeroJaulas = numeroJaulas;
        }
    }


    /**  
     * Metodo setter para el atributo numeroCuidadores
     * 
     * @param numeroCuidadores el numero de cuidadores
    */
    public void setNumeroCuidadores (int numeroCuidadores){
        if (numeroCuidadores > 0) {
            this.numeroCuidadores = numeroCuidadores;
        }
    }

    /**  
     * Metodo setter para el atributo numeroAnimales
     * 
     * @param numeroAnimales el numero de animales
    */
    public void setNumeroAnimales (int numeroAnimales){
        if (numeroAnimales > 0) {
            this.numeroAnimales = numeroAnimales;
        }
    }

    // Metodos Getters para los atributos de Bioma

    /**  
     * Metodo getter para el atributo idBioma
     * 
     * @return idBioma
     */
    public int getIdBioma() {
        return idBioma;
    }

    /**  
     * Metodo getter para el atributo tipoBioma
     * 
     * @return tipoBioma
     */
    public String getTipoBioma() {
        return tipoBioma;
    }

    /**  
     * Metodo getter para el atributo numeroVeterinarios
     * 
     * @return numeroVeterinarios
    */
    public int getNumeroVeterinarios() {
        return numeroVeterinarios;
    }

    /**  
     * Metodo getter para el atributo numeroJaulas
     * 
     * @return numeroJaulas
    */
    public int getNumeroJaulas() {
        return numeroJaulas;
    }

    /**  
     * Metodo getter para el atributo numeroCuidadores
     * 
     * @return numeroCuidadores
    */
    public int getNumeroCuidadores() {
        return numeroCuidadores;
    }

    /**  
     * Metodo getter para el atributo numeroAnimales
     * 
     * @return numeroAnimales
    */
    public int getNumeroAnimales() {
        return numeroAnimales;
    }

    /**  
     * Metodo getter para el atributo serviciosVisitantes
     * 
     * @return serviciosVisitantes
    */
    public ServiciosVisitantes getServiciosVisitantes() {
        return serviciosVisitantes;
    }

    // Metodo toString para la clase Bioma
    @Override
    public String toString() {
        return String.format("%d,%s,%d,%d,%d,%d,%s", idBioma,
                tipoBioma, numeroJaulas, numeroCuidadores, 
                numeroVeterinarios, numeroAnimales, serviciosVisitantes);
    }

    // Metodo que imprime la clase bioma embellecida para la consola
    public String toStringConsola() {
        return String.format("IdBioma: %d \n Tipo-Bioma: %s \n Numero-de-Jalulas: %d \n Numero-de-Cuidadores: %d \n Numero-de-Veterinarios: %d \n Numero-de-Aniamles: %d \n Servicios-Visitantes: %s", idBioma,
                tipoBioma, numeroJaulas, numeroCuidadores, 
                numeroVeterinarios, numeroAnimales, serviciosVisitantes);
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

        // Metodos setters para los atributos de servicios a visitantes

        /** 
         * Metodo setter para el atributo numeroBanios
         * 
         * @param numeroBanios el numero de banos
         */
        public void setNumeroBanios (int numeroBanios){
            if (numeroBanios > 0) {
                this.numeroBanios = numeroBanios;
            }
        }

        /**
         * Metodo setter para el atributo numeroTiendas
         * 
         * @param numeroTiendas el numero de tiendas 
         */ 
        public void setNumeroTiendas (int numeroTiendas){
            if (numeroTiendas > 0) {
                this.numeroTiendas = numeroTiendas;
            }
        }

        /**
         * Metodo setter para el atributo numeroComida
         * 
         * @param numeroComida el numero de comida
         */
        public void setNumeroComida (int numeroComida){
            if (numeroComida > 0) {
                this.numeroComida = numeroComida;
            }
        }

        // Metodos getters para los atributos de servicios a visitantes

        /**  
         * Metodo getter para el atributo numeroBanios
         * 
         * @return numeroBanios
         */
        public int getNumeroBanios() {
            return numeroBanios;
        }

        /**  
         * Metodo getter para el atributo numeroTiendas
         * 
         * @return numeroTiendas
         */
        public int getNumeroTiendas() {
            return numeroTiendas;
        }

        /**  
         * Metodo getter para el atributo numeroComida
         * 
         * @return numeroComida
         */
        public int getNumeroComida() {
            return numeroComida;
        }

        // Metodo toString para la clase ServiciosVisitantes
        @Override
        public String toString() {
            return String.format("%d,%d,%d",numeroBanios,
                    numeroTiendas, numeroComida);
        }

        // Metodo que imprime la clase ServiciosVisitantes embellecida para la consola
        public String toStringConsola() {
            return String.format("\n Numero-de-Banios: %d \n Numero-de-Tiendas: %d \n Numero-de-Comida: %d",numeroBanios,
                    numeroTiendas, numeroComida);
        }

        
    }
}
