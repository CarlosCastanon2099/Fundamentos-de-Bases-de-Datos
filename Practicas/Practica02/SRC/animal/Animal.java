package animal;

public class Animal {
    private String nombre;
    private String especie;
    private double peso;
    private double altura;
    private String sexo;
    private int numeroJaula;
    private String alimentacion;
    private String indicacionesMedicas;

    // Constructor de la clase Animal
    public Animal(String nombre, String especie, double peso, double altura, String sexo,
                  int numeroJaula, String alimentacion, String indicacionesMedicas) {
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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getNumeroJaula() {
        return numeroJaula;
    }

    public void setNumeroJaula(int numeroJaula) {
        this.numeroJaula = numeroJaula;
    }

    public String getAlimentacion() {
        return alimentacion;
    }

    public void setAlimentacion(String alimentacion) {
        this.alimentacion = alimentacion;
    }

    public String getIndicacionesMedicas() {
        return indicacionesMedicas;
    }

    public void setIndicacionesMedicas(String indicacionesMedicas) {
        this.indicacionesMedicas = indicacionesMedicas;
    }
}