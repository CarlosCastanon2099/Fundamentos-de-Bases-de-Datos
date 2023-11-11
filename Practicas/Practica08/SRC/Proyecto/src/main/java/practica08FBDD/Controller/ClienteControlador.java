/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Controller;

import practica08FBDD.Service.ClienteServicio;
import practica08FBDD.model.Cliente;
import jakarta.annotation.Resource;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * El controlador de Cliente, el cual se encarga de tomar las peticiones
 * CRUD y hacerla efectivas en nuestra base de datos
 * @author Mauro E. Chávez
 * @version 8 - Noviembre - 2023
 */
@RestController
@RequestMapping("/postgresApp")
public class ClienteControlador {
    @Resource
    ClienteServicio clienteSer;
   
    /**
     * Metodo getter que nos regresa una lista con todos los clientes
     * @return List<Cliente> - - Una lista de clientes
     */
   @GetMapping(value="/clienteList")
   public List<Cliente> getClientes(){
       return clienteSer.findAll();
   }

    /**
     * Metodo getter que nos regresa un cliente en especifico por el idCliente
     * @param cl - - El cliente que queremos buscar en la base de datos
     */
   @GetMapping(value="/getClienteById")
   public List<Cliente> getClienteById(@RequestBody Cliente cl){
       return clienteSer.getClienteById(cl);
   }
   
   /**
    * Metodo que agrega una instancia de la clase Cliente a la base de datos
    * @param cl - - El cliente que queremos añadir a la base de datos
    */
   @PostMapping(value="/createCliente")
   public void createCliente(@RequestBody Cliente cl){
       clienteSer.insertCliente(cl);
   }
   
   /**
    * Metodo que actualiza un registro Cliente en la base de datos
    * @param cl - - Los valores a los cuales se va a actualizar el registro
    */
   @PutMapping(value ="/updateCliente")
   public void updateCliente(@RequestBody Cliente cl){
      clienteSer.updateCliente(cl);
   }
   
   /**
    * Metodo que se encarga de ejecutar la actualizacion de Cliente
    * @param cl - - Los valores de Cliente a los que se va a actualziar el registro
    */
   @PutMapping(value ="/executeUpdateCliente")
   public void executeUpdateCliente(@RequestBody Cliente cl){
      clienteSer.executeUpdateCliente(cl);
   }
   
   /**
    * Metodo que se encarga de borrar a un cliente
    * @param cl - - El Cliente a borrar
    */
   @DeleteMapping(value = "/deleteClienteById")
   public void borrarCliente(@RequestBody Cliente cl){
       clienteSer.deleteCliente(cl);
   }
    
}
