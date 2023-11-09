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


@RestController
@RequestMapping("/postgresApp")
public class ClienteControlador {
    @Resource
    ClienteServicio clienteSer;
   
   @GetMapping(value="/clienteList")
   public List<Cliente> getClientes(){
       return clienteSer.findAll();
   }
   @PostMapping(value="/createCliente")
   public void createCliente(@RequestBody Cliente cl){
       clienteSer.insertCliente(cl);
   }
   
   @PutMapping(value ="/updateCliente")
   public void updateCliente(@RequestBody Cliente cl){
      clienteSer.updateCliente(cl);
   }
   
   @PutMapping(value ="/executeUpdateCliente")
   public void executeUpdateCliente(@RequestBody Cliente cl){
      clienteSer.executeUpdateCliente(cl);
   }
   
   @DeleteMapping(value = "/deleteClienteById")
   public void borrarCliente(@RequestBody Cliente cl){
       clienteSer.deleteCliente(cl);
   }
    
}
