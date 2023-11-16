/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Service;

import practica08FBDD.model.Cliente;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * Método que sirve para proporcionar el servicio web de la base de datos
 * @author Mauro E. Chávez
 * @version 9-Nov-2023
 * @author Pablo - Arizdelcy - Carlos
 * @version 10 - Noviembre - 2023
 */
public interface ClienteServicio {
    
    /** 
     * Método que obtiene los registro de Clientes de la base de datos.
     */
    List<Cliente> findAll();

    /**
     * Metodo getter que nos regresa un cliente en especifico por el idCliente
     */
    List<Cliente> getClienteById(Cliente cl);

    /**
    * Método que inserta un registro de Cliente de la base de datos. 
    * @param cl Objeto Cliente a ser insertado.
    */
    void insertCliente(Cliente cl);
    
    /**
     * Actualiza un registro existente de Cliente en la base de datos.
     * @param cl Objeto CorreoCliente con los datos actualizados.
     */
    void updateCliente(Cliente cl);
    
    /**
     * Método que actualiza el Cliente de la base de datos.
     * @param cl El CorreoCliente que se actualiza en el servicio web.
     */
    void executeUpdateCliente(Cliente cl);

    /**
     * Elimina un registro de Cliente de la base de datos.
     * @param cl Objeto Cliente a ser eliminado.
     */
    void deleteCliente(Cliente cl);
}
