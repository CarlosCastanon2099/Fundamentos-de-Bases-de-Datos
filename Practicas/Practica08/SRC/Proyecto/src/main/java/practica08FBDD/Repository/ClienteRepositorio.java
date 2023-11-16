/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Repository;

import practica08FBDD.model.Cliente;
import java.util.List;

/**
 * Interface que define el comportamiento esperado para el repositorio
 * En este caso se especializa en la clase Cliente
 * @author Mauro E. Chávez
 * @version 8 - Noviembre - 2023
 * @author Pablo - Arizdelcy - Carlos
 * @version 10 - Noviembre - 2023
 */
public interface ClienteRepositorio{

    /**
     * Recupera todos los registros de Cliente desde la base de datos.
     * @return Lista de objetos Cliente.
     */
    List<Cliente> findAll();

    /**
     * Metodo que dado un id, busca el registro en la base de datos.
     * @param cl identificador del registro a buscar.
     */
    List<Cliente> getClienteById(Cliente cl);
    
    /** 
     * Metodo que dado un id, inserta el registro de Cliente desde la base de datos.
     * Inserta un Cliente desde la base de datos.
     * @param cl Identificador del registro a insertar.
     */
    void insertCliente(Cliente cl);

    /**
     * Actualiza un registro existente de Cliente en la base de datos.
     * @param cl Objeto Cliente con los datos actualizados.
     */
     void updateCliente(Cliente cl);

     /**
     * Método que dado un Cliente, se encarga de ejecutar la acutalización
     * en la base de datos creando la petición a través de los datos de 
     * la instancia CorreoCliente, usando SQL.
     * @param cl - - El cliente a actualizar
     */
    void executeUpdateCliente(Cliente cl);
    
    /**
     * Elimina un registro de Cliente de la base de datos.
     * @param cl Objeto Cliente a ser eliminado.
     */
    public void deleteCliente(Cliente cl);
}