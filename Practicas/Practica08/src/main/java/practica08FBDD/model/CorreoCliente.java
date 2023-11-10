/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.model;

/**
 * Una representación de la entidad CorreoCliente en el zoológico
 * @author Cristian Gallegos
 * @version 8 - Noviembre - 2023
 */
public class CorreoCliente {
    
    private Integer idPersona;
    private String correo;
    
    /**
     * Constructor de la clase CorreoCliente.
     * @param idPersona Identificador único de la persona.
     * @param correo Dirección de correo electrónico.
     */
    public CorreoCliente (Integer idPersona, String correo) {
        this.idPersona = idPersona;
        this.correo = correo;
    }
    
    /**
     * Establece el identificador único de la persona.
     * @param idPersona Nuevo identificador único de la persona.
     */
    public void setIdPersona (Integer idPersona) {
        this.idPersona = idPersona;
    }
    
    /**
     * Establece la dirección de correo electrónico.
     * @param correo Nueva dirección de correo electrónico.
     */
    public void setCorreo (String correo) {
        this.correo = correo;
    }
    
    /**
     * Obtiene el identificador único de la persona.
     * @return Identificador único de la persona.
     */
    public Integer getIdPersona () {
        return idPersona; 
    }
    
    /**
     * Obtiene la dirección de correo electrónico.
     * @return Dirección de correo electrónico.
     */
    public String getCorreo () {
        return correo;
    }
    
    /**
     * Devuelve una representación de cadena de la instancia CorreoCliente.
     * @return Cadena que representa el objeto CorreoCliente.
     */
    @Override
    public String toString () {
        return "CorreoCliente { idPersona = "  + idPersona + ", correo = " + correo + " }\n";
    }   
}
