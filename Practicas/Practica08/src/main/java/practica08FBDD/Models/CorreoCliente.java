/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Models;

/**
 *
 * @author crgal
 */
public class CorreoCliente {
    private Integer idPersona;
    private String correo;
    
    public CorreoCliente (Integer idPersona, String correo) {
        this.idPersona = idPersona;
        this.correo = correo;
    }
    
    public void setIdPersona (Integer idPersona) {
        this.idPersona = idPersona;
    }
    
    public void setCorreo (String correo) {
        this.correo = correo;
    }
    
    public Integer getIdPersona () {
        return idPersona; 
    }
    
    public String getCorreo () {
        return correo;
    }
    
    @Override
    public String toString () {
        return "CorreoCliente { idPersona = "  + idPersona + ", correo = " + correo + " }";
    }
}
