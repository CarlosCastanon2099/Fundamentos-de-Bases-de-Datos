package animal;

public class Animal {
    private int idAnimal;
    private String nombre;
    private String especie;
    private double peso;
    private double altura;
    private String sexo;
    private int numeroJaula;
    private String alimentacion;
    private String indicacionesMedicas;

    // Constructor de la clase Animal
    public Animal(int idAnimal, String nombre, String especie, double peso, double altura, String sexo,
                  int numeroJaula, String alimentacion, String indicacionesMedicas) {
        this.idAnimal = idAnimal;
        this.nombre = nombre;
        this.especie = especie;
        this.peso = peso;
        this.altura = altura;
        this.sexo = sexo;
        this.numeroJaula = numeroJaula;
        this.alimentacion = alimentacion;
        this.indicacionesMedicas = indicacionesMedicas;
    }

    // Métodos getters y setters para los atributos

    /**
     * Método que devuelve el id del animal
     * @return id del animal
     */
    public int getIdAnimal() {
        return idAnimal;
    }

    /**
     * Método que establece el id del animal
     * @param idAnimal id del animal
     */
    public void setIdAnimal(int idAnimal) {
        this.idAnimal = idAnimal;
    }


    /**
     * Método que devuelve el nombre del animal
     * @return nombre del animal
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Método que establece el nombre del animal
     * @param nombre nombre del animal
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Método que devuelve la especie del animal
     * @return especie del animal
     */
    public String getEspecie() {
        return especie;
    }

    /**
     * Método que establece la especie del animal
     * @param especie especie del animal
     */
    public void setEspecie(String especie) {
        this.especie = especie;
    }

    /**
     * Método que devuelve el peso del animal
     * @return peso del animal
     */
    public double getPeso() {
        return peso;
    }

    /**
     * Método que establece el peso del animal
     * @param peso peso del animal
     */
    public void setPeso(double peso) {
        this.peso = peso;
    }

    /**
     * Método que devuelve la altura del animal
     * @return altura del animal
     */
    public double getAltura() {
        return altura;
    }

    /**
     * Método que establece la altura del animal
     * @param altura altura del animal
     */
    public void setAltura(double altura) {
        this.altura = altura;
    }

    /**
     * Método que devuelve el sexo del animal
     * @return sexo del animal
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * Método que establece el sexo del animal
     * @param sexo sexo del animal
     */
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    /**
     * Método que devuelve el número de jaula del animal
     * @return número de jaula del animal
     */
    public int getNumeroJaula() {
        return numeroJaula;
    }

    /**
     * Método que establece el número de jaula del animal
     * @param numeroJaula número de jaula del animal
     */
    public void setNumeroJaula(int numeroJaula) {
        this.numeroJaula = numeroJaula;
    }

    /**
     * Método que devuelve la alimentación del animal
     * @return alimentación del animal
     */
    public String getAlimentacion() {
        return alimentacion;
    }

    /**
     * Método que establece la alimentación del animal
     * @param alimentacion alimentación del animal
     */
    public void setAlimentacion(String alimentacion) {
        this.alimentacion = alimentacion;
    }

    /**
     * Método que devuelve las indicaciones médicas del animal
     * @return indicaciones médicas del animal
     */
    public String getIndicacionesMedicas() {
        return indicacionesMedicas;
    }

    /**
     * Método que establece las indicaciones médicas del animal
     * @param indicacionesMedicas indicaciones médicas del animal
     */
    public void setIndicacionesMedicas(String indicacionesMedicas) {
        this.indicacionesMedicas = indicacionesMedicas;
    }

    /*
     * Método que devuelve la información del animal
     */
    @Override
    public String toString() {
        return "Animal" +
                "idAnimal=" + idAnimal +
                "nombre='" + nombre + '\'' +
                " especie='" + especie + '\'' +
                " peso=" + peso +
                " altura=" + altura +
                " sexo='" + sexo + '\'' +
                " numeroJaula=" + numeroJaula +
                " alimentacion='" + alimentacion + '\'' +
                " indicacionesMedicas='" + indicacionesMedicas + '\'';
    }
}