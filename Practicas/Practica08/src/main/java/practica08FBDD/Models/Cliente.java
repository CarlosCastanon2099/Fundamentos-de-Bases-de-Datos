/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Models;

/**
 * Una representación de la entidad cliente en el zoológico
 * @author Mauro E. Chávez
 * @version 8 - Noviembre - 2023
 */
public class Cliente {

    private Integer idPersona;
    private String nombre;
    private String paterno;
    private String materno;
    private char genero;
    
    /**
     * Constructor por párametros que crea una instancia de la clase Cliente
     * @param idPersona - - El identificador de la persona-cliente
     * @param nombre - - El nombre del cliente
     * @param paterno - - El apellido paterno del cliente
     * @param materno - - El apellido materno del cliente
     * @param genero - - El genero del cliente
     */
    public Cliente(Integer idPersona, String nombre, String paterno, String materno, char genero) {
        this.idPersona = idPersona;
        this.nombre = nombre;
        this.paterno = paterno;
        this.materno = materno;
        this.genero = genero;
    }

    /**
     * Metodo get que regresa el idPersona de un cliente
     * @return Integer - - El identificador de un cliente
     */
    public Integer getIdPersona() {
        return idPersona;
    }

    /**
     * Metodo set que define un nuevo idPersona para una instancia de cliente
     * @param idPersona -- El nuevo id de cliente
     */
    public void setIdPersona(Integer idPersona) {
        this.idPersona = idPersona;
    }

    /**
     * Metodo get que regresa el nombre de un cliente
     * @return String - - El nombre de cliente
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Metodo set que define un nuevo nombre para una instancia de cliente
     * @param nombre -- El nuevo nombre de cliente
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Metodo get que regresa el apellido paterno de una instancia de cliente
     * @return String - - El apellido paterno de cliente
     */
    public String getPaterno() {
        return paterno;
    }

    /**
     * Metodo set que define un nuevo apellido parterno para un cliente
     * @param paterno -- El nuevo apellido paterno de cliente
     */
    public void setPaterno(String paterno) {
        this.paterno = paterno;
    }

    /**
     * Metodo get que regresa el apellido materno de una instancia de cliente
     * @return String - - El apellido materno de cliente
     */
    public String getMaterno() {
        return materno;
    }

    /**
     * Metodo set que define un nuevo apellido materno para una instancia de cliente
     * @param materno -- El nuevo apellido materno de cliente
     */
    public void setMaterno(String materno) {
        this.materno = materno;
    }

    /**
     * Metodo get que regresa el genero de instancia de cliente
     * @return char - - El genero de un cliente
     */
    public char getGenero() {
        return genero;
    }

    /**
     * Metodo set que define un nuevo genero para una instancia de cliente
     * @param genero -- El nuevo genero de cliente
     */
    public void setGenero(char genero) {
        this.genero = genero;
    }

    /**
     * Metodo toString que regresa una representacion de Cliente en cadena de texto
     * @return String - - Los atributos de un cliente en una instancia dada
     */
    @Override
    public String toString() {
        return "Cliente{" + "idPersona=" + idPersona + ", nombre=" + nombre + 
                ", Paterno=" + paterno + ", Materno=" 
                + materno + ", genero=" + genero + "}";
    }
    
    
    
    
}
