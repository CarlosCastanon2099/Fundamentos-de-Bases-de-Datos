/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Constroller;

import jakarta.annotation.Resource;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import practica08FBDD.Models.CorreoCliente;
import practica08FBDD.Services.CorreoClienteServicio;

/**
 *
 * @author crgal
 */
@RestController
@RequestMapping
public class CorreoClienteController {
    
    @Resource
    CorreoClienteServicio correoClienteS;
    
    @GetMapping(value="/correoClienteList")
    public List<CorreoCliente> getCorreosClientes () {
        return correoClienteS.findAll();
    }
    
    @PostMapping(value="createCorreoCliente")
    public void createCorreoCliente(@RequestBody CorreoCliente cc) {
        correoClienteS.insertCorreoCliente(cc);
    }
    
    // FALTAN 3 METODOS MAS 
}
