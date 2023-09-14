package empleado;

import java.util.Date;

// Clase base Empleado
public class Empleado {
    private String rfc;
    private String nombre;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private String direccion;
    private String telefono;
    private Date fechaInicioContrato;
    private Date fechaFinContrato;
    private Date fechaNacimiento;
    private String correoElectronico;
    private String genero;

    // Constructor de la clase Empleado
    public Empleado(String rfc, String nombre, String apellidoPaterno, String apellidoMaterno,
                    String direccion, String telefono, Date fechaInicioContrato,
                    Date fechaFinContrato, Date fechaNacimiento, String correoElectronico, String genero) {
        this.rfc = rfc;
        this.nombre = nombre;
        this.apellidoPaterno = apellidoPaterno;
        this.apellidoMaterno = apellidoMaterno;
        this.direccion = direccion;
        this.telefono = telefono;
        this.fechaInicioContrato = fechaInicioContrato;
        this.fechaFinContrato = fechaFinContrato;
        this.fechaNacimiento = fechaNacimiento;
        this.correoElectronico = correoElectronico;
        this.genero = genero;
    }


    // Cada empleado debe tener un ID unico, usaremos el RFC como ID
    // Metodo getID para obtener el ID del empleado
    public String getID() {
        return rfc;
    }

    // Metodo setID para asignar el ID del empleado
    public void setID(String rfc) {
        this.rfc = rfc;
    }

    // Metodos getters y setters para los atributos de la clase Empleado

    /**      
     * Metodo que regresa el RFC del empleado.
     * 
     * @return el RFC del empleado.
     */

    public String getRfc() {
        return rfc;
    }

    /**
     * Metodo que asigna el RFC del empleado.
     * 
     * @param rfc el RFC del empleado.
     */
    public void setRfc(String rfc) {
        if (rfc != null && !rfc.isEmpty()) {
            this.rfc = rfc;
        }
    }

    /**
     * Metodo que regresa el nombre del empleado.
     * 
     * @return el nombre del empleado.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Metodo que asigna el nombre del empleado.
     * 
     * @param nombre el nombre del empleado.
     */
    public void setNombre(String nombre) {
        if (nombre != null && !nombre.isEmpty()) {
            this.nombre = nombre;
        }
    }

    /**
     * Metodo que regresa el apellido paterno del empleado.
     * 
     * @return el apellido paterno del empleado.
     */
    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    /**
     * Metodo que asigna el apellido paterno del empleado.
     * 
     * @param apellidoPaterno el apellido paterno del empleado.
     */
    public void setApellidoPaterno(String apellidoPaterno) {
        if (apellidoPaterno != null && !apellidoPaterno.isEmpty()) {
            this.apellidoPaterno = apellidoPaterno;
        }
    }

    /**
     * Metodo que regresa el apellido materno del empleado.
     * 
     * @return el apellido materno del empleado.
     */
    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    /**
     * Metodo que asigna el apellido materno del empleado.
     * 
     * @param apellidoMaterno el apellido materno del empleado.
     */
    public void setApellidoMaterno(String apellidoMaterno) {
        if (apellidoMaterno != null && !apellidoMaterno.isEmpty()) {
            this.apellidoMaterno = apellidoMaterno;
        }
    }

    /**
     * Metodo que regresa la direccion del empleado.
     * 
     * @return la direccion del empleado.
     */
    public String getDireccion() {
        return direccion;
    }

    /**
     * Metodo que asigna la direccion del empleado.
     * 
     * @param direccion la direccion del empleado.
     */
    public void setDireccion(String direccion) {
        if (direccion != null && !direccion.isEmpty()) {
            this.direccion = direccion;
        }
    }

    /**
     * Metodo que regresa el telefono del empleado.
     * 
     * @return el telefono del empleado.
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * Metodo que asigna el telefono del empleado.
     * 
     * @param telefono el telefono del empleado.
     */
    public void setTelefono(String telefono) {
        if (telefono != null && !telefono.isEmpty()) {
            this.telefono = telefono;
        }
    }

    /**
     * Metodo que regresa la fecha de inicio del contrato del empleado.
     * 
     * @return la fecha de inicio del contrato del empleado.
     */
    public Date getFechaInicioContrato() {
        return fechaInicioContrato;
    }

    /**
     * Metodo que asigna la fecha de inicio del contrato del empleado.
     * 
     * @param fechaInicioContrato la fecha de inicio del contrato del empleado.
     */
    public void setFechaInicioContrato(Date fechaInicioContrato) {
        if (fechaInicioContrato != null) {
            this.fechaInicioContrato = fechaInicioContrato;
        }
    }

    /**
     * Metodo que regresa la fecha de fin del contrato del empleado.
     * 
     * @return la fecha de fin del contrato del empleado.
     */
    public Date getFechaFinContrato() {
        return fechaFinContrato;
    }

    /**
     * Metodo que asigna la fecha de fin del contrato del empleado.
     * 
     * @param fechaFinContrato la fecha de fin del contrato del empleado.
     */
    public void setFechaFinContrato(Date fechaFinContrato) {
        if (fechaFinContrato != null) {
            this.fechaFinContrato = fechaFinContrato;
        }
    }

    /**
     * Metodo que regresa la fecha de nacimiento del empleado.
     * 
     * @return la fecha de nacimiento del empleado.
     */
    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    /**
     * Metodo que asigna la fecha de nacimiento del empleado.
     * 
     * @param fechaNacimiento la fecha de nacimiento del empleado.
     */
    public void setFechaNacimiento(Date fechaNacimiento) {
        if (fechaNacimiento != null) {
            this.fechaNacimiento = fechaNacimiento;
        }
    }

    /**
     * Metodo que regresa el correo electronico del empleado.
     * 
     * @return el correo electronico del empleado.
     */
    public String getCorreoElectronico() {
        return correoElectronico;
    }

    /**
     * Metodo que asigna el correo electronico del empleado.
     * 
     * @param correoElectronico el correo electronico del empleado.
     */
    public void setCorreoElectronico(String correoElectronico) {
        if (correoElectronico != null && !correoElectronico.isEmpty()) {
            this.correoElectronico = correoElectronico;
        }
    }

    /**
     * Metodo que regresa el genero del empleado.
     * 
     * @return el genero del empleado.
     */
    public String getGenero() {
        return genero;
    }

    /**
     * Metodo que asigna el genero del empleado.
     * 
     * @param genero el genero del empleado.
     */
    public void setGenero(String genero) {
        if (genero != null && !genero.isEmpty()) {
            this.genero = genero;
        }
    }

    /**
     * Metodo que regresa la informacion del empleado.
     * 
     * @return la informacion del empleado.
     */
    @Override
    public String toString() {
        return String.format("%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s"  , rfc, nombre, apellidoPaterno, apellidoMaterno, direccion, telefono,
                fechaInicioContrato, fechaFinContrato, fechaNacimiento, correoElectronico, genero);
    }

    /**
     * Metodo que regresa la informacion del empleado embellecidda para la consola.
     * @return la informacion del empleado.
     */
    public String toStringConsola() {
        return String.format("RFC(Clave única): %s \n Nombre: %s \n Apellido-Paterno: %s \n Apellido-Materno: %s \n Dirección: %s \n Teléfono: %s \n Fecha-Inicio-Contrato: %s \n Fecha-Finalización-Contrato: %s \n Fecha-Nacimiento: %s \n Correo-electrónico: %s \n Género: %s \n"  , rfc, nombre, apellidoPaterno, apellidoMaterno, direccion, telefono,
                fechaInicioContrato, fechaFinContrato, fechaNacimiento, correoElectronico, genero);
    }



}
