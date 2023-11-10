/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Service;

import practica08FBDD.Repository.ClienteRepositorio;
import practica08FBDD.model.Cliente;

import jakarta.annotation.Resource;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 * Implementacion del servicio web que se encarga de levantar a cliente
 * @author Mauro E. Chávez
 * @version 9-Nov-2023
 */
@Service
public class ClienteServicioImp implements ClienteServicio{
    @Resource
    ClienteRepositorio clienteRep;
    
    /**
     * Metodo que regresa todos los registros de clientes para el servicio web
     * @return List<Cliente> - - La lista de clientes para el servicio web
     */
    @Override
    public List<Cliente> findAll() {
        return clienteRep.findAll();
    }
   
    /**
     * Método que inserta el cliente en el servicio web
     * @param cl - - El cliente que queremos insertar en el servicio web
     */
    @Override
    public void insertCliente(Cliente cl) {
        clienteRep.insertCliente(cl);
    }
    
    /**
     * Método que actualiza el cliente en el servicio web
     * @param cl - - El cliente que se actualiza en el servicio web
     */
    @Override
    public void updateCliente(Cliente cl) {
        clienteRep.updateCliente(cl);
    }
    /**
     * Método que actualiza el cliente en el servicio web
     * @param cl - - El cliente que se actualiza en el servicio web
     */
    @Override
    public void executeUpdateCliente(Cliente cl) {
        clienteRep.executeUpdateCliente(cl);
    }

    /**
     * Método que borra el cliente en el servicio web
     * @param cl - - El cliente que se borra del servicio web
     */
    @Override
    public void deleteCliente(Cliente cl) {
        clienteRep.deleteCliente(cl);
    }
}
