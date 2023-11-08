/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD;

/**
 * Una representación de la entidad cliente en el zoológico
 * @author Mauro E. Chávez
 */
public class Cliente {
    private Integer idPersona;
    private String nombre;
    private String paterno;
    private String materno;
    private char genero;

    public Operador(){
        
    }
    
    public Operador(Integer idPersona, String nombre, String paterno, String materno, char genero) {
        this.idPersona = idPersona;
        this.nombre = nombre;
        this.paterno = paterno;
        this.materno = materno;
        this.genero = genero;
    }

    public String getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(String idPersona) {
        this.idPersona = idPersona;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPaterno() {
        return paterno;
    }

    public void setPaterno(String paterno) {
        this.paterno = paterno;
    }

    public String getMaterno() {
        return materno;
    }

    public void setMaterno(String materno) {
        this.materno = materno;
    }

    public char getGenero() {
        return genero;
    }

    public void setGenero(char genero) {
        this.genero = genero;
    }

    @Override
    public String toString() {
        return "Cliente{" + "idPersona=" + idPersona + ", nombre=" + nombre + 
                ", Paterno=" + paterno + ", Materno=" 
                + materno + ", genero=" + genero + "}";
    }
    
    
    
    
}
