package practica08FBDD.Repository;

import java.util.List;
import practica08FBDD.model.CorreoCliente;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 * Interfaz que define las operaciones de acceso a datos (CRUD) para la entidad CorreoCliente.
 * Las clases que implementan esta interfaz proporcionan métodos para realizar operaciones de lectura
 * y escritura en la base de datos relacionadas con la entidad CorreoCliente.
 * @author crgal
 */
public interface CorreoClienteRepositorio {
    
    /**
     * Recupera todos los registros de CorreoCliente desde la base de datos.
     * @return Lista de objetos CorreoCliente.
     */
    public List<CorreoCliente> findAll();
    
    /**
     * Inserta un nuevo registro de CorreoCliente en la base de datos.
     * @param cc Objeto CorreoCliente a ser insertado.
     */
    public void insertCorreoCliente(CorreoCliente cc);
    
    /**
     * Actualiza un registro existente de CorreoCliente en la base de datos.
     * @param cc Objeto CorreoCliente con los datos actualizados.
     */
    public void updateCorreoCliente(CorreoCliente cc);
    
    /**
     * Método que dado un Cliente, se encarga de ejecutar la acutalización
     * en la base de datos creando la petición a través de los datos de 
     * la instancia CorreoCliente, usando SQL.
     * @param cc - - El cliente a actualizar
     */
    public void executeUpdateCorreoCliente(CorreoCliente cc);
    
    /**
     * Elimina un registro de CorreoCliente de la base de datos.
     * @param cc Objeto CorreoCliente a ser eliminado.
     */
    public void deleteCorreoCliente(CorreoCliente cc);
}
