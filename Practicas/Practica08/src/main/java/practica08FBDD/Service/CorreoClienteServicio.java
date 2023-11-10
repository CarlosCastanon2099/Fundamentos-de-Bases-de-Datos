/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Service;

import java.util.List;
import practica08FBDD.model.CorreoCliente;

/**
 *
 * @author crgal
 */
public interface CorreoClienteServicio {
    
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
     * Método que actualiza el CorreoCliente en el servicio web
     * @param cc El CorreoCliente que se actualiza en el servicio web.
     */
    public void executeUpdateCorreoCliente(CorreoCliente cc);
    
    /**
     * Elimina un registro de CorreoCliente de la base de datos.
     * @param cc Objeto CorreoCliente a ser eliminado.
     */
    public void deleteCorreoCliente(CorreoCliente cc);
}
