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

    // Metodos getters y setters para los atributos

    /**
     * Metodo que devuelve el id del animal
     * @return id del animal
     */
    public int getIdAnimal() {
        return idAnimal;
    }

    /**
     * Metodo que establece el id del animal
     * @param idAnimal id del animal
     */
    public void setIdAnimal(int idAnimal) {
        this.idAnimal = idAnimal;
    }


    /**
     * Metodo que devuelve el nombre del animal
     * @return nombre del animal
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Metodo que establece el nombre del animal
     * @param nombre nombre del animal
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Metodo que devuelve la especie del animal
     * @return especie del animal
     */
    public String getEspecie() {
        return especie;
    }

    /**
     * Metodo que establece la especie del animal
     * @param especie especie del animal
     */
    public void setEspecie(String especie) {
        this.especie = especie;
    }

    /**
     * Metodo que devuelve el peso del animal
     * @return peso del animal
     */
    public double getPeso() {
        return peso;
    }

    /**
     * Metodo que establece el peso del animal
     * @param peso peso del animal
     */
    public void setPeso(double peso) {
        this.peso = peso;
    }

    /**
     * Metodo que devuelve la altura del animal
     * @return altura del animal
     */
    public double getAltura() {
        return altura;
    }

    /**
     * Metodo que establece la altura del animal
     * @param altura altura del animal
     */
    public void setAltura(double altura) {
        this.altura = altura;
    }

    /**
     * Metodo que devuelve el sexo del animal
     * @return sexo del animal
     */
    public String getSexo() {
        return sexo;
    }

    /**
     * Metodo que establece el sexo del animal
     * @param sexo sexo del animal
     */
    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    /**
     * Metodo que devuelve el numero de jaula del animal
     * @return numero de jaula del animal
     */
    public int getNumeroJaula() {
        return numeroJaula;
    }

    /**
     * Metodo que establece el numero de jaula del animal
     * @param numeroJaula numero de jaula del animal
     */
    public void setNumeroJaula(int numeroJaula) {
        this.numeroJaula = numeroJaula;
    }

    /**
     * Metodo que devuelve la alimentacion del animal
     * @return alimentacion del animal
     */
    public String getAlimentacion() {
        return alimentacion;
    }

    /**
     * Metodo que establece la alimentacion del animal
     * @param alimentacion alimentacion del animal
     */
    public void setAlimentacion(String alimentacion) {
        this.alimentacion = alimentacion;
    }

    /**
     * Metodo que devuelve las indicaciones medicas del animal
     * @return indicaciones medicas del animal
     */
    public String getIndicacionesMedicas() {
        return indicacionesMedicas;
    }

    /**
     * Metodo que establece las indicaciones medicas del animal
     * @param indicacionesMedicas indicaciones medicas del animal
     */
    public void setIndicacionesMedicas(String indicacionesMedicas) {
        this.indicacionesMedicas = indicacionesMedicas;
    }

    /*
     * Metodo que devuelve la informacion del animal
     */
    @Override
    public String toString() {
        return String.format("%s, %s, %s, %s, %s, %s, %s, %s, %s",
                idAnimal, nombre, especie, peso, altura, sexo, numeroJaula, alimentacion, indicacionesMedicas);
    }

    /*
     * Metodo que devuelve la informacion del animal pero embellecido para
     * facilidad del usuario, en terminal.
     */
    public String toStringConsola() {
        return String.format("\n IdAnimal: %s  \n Nombre: %s  \n Altura: %s  \n Peso: %s  \n Altura: %s \n Sexo: %s  \n Numero-de-Jaula: %s \n Alimentacion: %s \n Indicaciones-Medicas: %s",
                idAnimal, nombre, especie, peso, altura, sexo, numeroJaula, alimentacion, indicacionesMedicas);
    }
}

