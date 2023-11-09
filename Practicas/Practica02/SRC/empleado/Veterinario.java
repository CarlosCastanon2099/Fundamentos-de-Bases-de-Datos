package empleado;

import java.util.Date;

// Clase Veterinario que hereda de Empleado
public class Veterinario extends Empleado {
    private String especialidad;
    private double salario;

    // Constructor de la clase Veterinario
    public Veterinario(String rfc, String nombre, String apellidoPaterno, String apellidoMaterno,
                        String direccion, String telefono, Date fechaInicioContrato,
                        Date fechaFinContrato, Date fechaNacimiento, String correoElectronico,
                        String genero, String especialidad, double salario) {
        super(rfc, nombre, apellidoPaterno, apellidoMaterno, direccion, telefono, fechaInicioContrato,
                fechaFinContrato, fechaNacimiento, correoElectronico, genero);
        this.especialidad = especialidad;
        this.salario = salario;
    }

    // Metodos getters y setters para los atributos de la clase Veterinario

    /**
     * Metodo que regresa la especialidad del veterinario.
     * 
     * @return la especialidad del veterinario.
     */
    public String getEspecialidad() {
        return especialidad;
    }

    /**
     * Metodo que asigna la especialidad del veterinario.
     * 
     * @param especialidad la especialidad del veterinario.
     */
    public void setEspecialidad(String especialidad) {
        if (especialidad != null && !especialidad.isEmpty()) {
            this.especialidad = especialidad;
        }
    }    
    
    /**
     * Metodo que regresa el salario del veterinario.
     *  
     * @return el salario del veterinario.
     */
    public double getSalario() {
        return salario;
    }

    /**
     * Metodo que asigna el salario del veterinario.
     * 
     * @param salario el salario del veterinario.
     */
    public void setSalario(double salario) {
        if (salario > 0) {
            this.salario = salario;
        }
    }

    /**
     * Metodo que regresa la informacion del veterinario.
     * 
     * @return la informacion del veterinario.
     */
    @Override
    public String toString() {
        return String.format("%s, %s, %s", super.toString(), especialidad, salario );
    }

    /**
     * Metodo que regresa la informacion del veterinario.
     * 
     * @return la informacion del veterinario.
     */
    @Override
    public String toStringConsola() {
        return String.format("%s \n Especialidad: %s \n Salario: %s \n ", super.toStringConsola(), especialidad, salario );
    }
}
