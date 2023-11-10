/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Controller;

import jakarta.annotation.Resource;
import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import practica08FBDD.Service.CorreoClienteServicio;
import practica08FBDD.model.CorreoCliente;

/**
 * La clase CorreoClienteController maneja las solicitudes REST relacionadas con la entidad CorreoCliente.
 * Las solicitudes se mapean a la ruta "/postgresApp".
 * @author Cristian Gallegos
 * @version 8 - Noviembre - 2023
 */
@RestController
@RequestMapping("/postgresApp")
public class CorreoClienteController {
    
    @Resource
    CorreoClienteServicio correoClienteS; // Servicio para acceder a CorreoCliente.
    
    /**
     * Maneja las solicitudes GET a "/correoClienteList" para obtener la lista de CorreosClientes.
     * @return Lista de CorreosClientes almacenados en la base de datos.
     */
    @GetMapping(value="/correoClienteList")
    public List<CorreoCliente> getCorreosClientes () {
        return correoClienteS.findAll();
    }
    
    /**
     * Maneja las solicitudes POST a "/createCorreoCliente" para crear un nuevo CorreoCliente.
     * @param cc Objeto CorreoCliente recibido en el cuerpo de la solicitud.
     */
    @PostMapping(value="createCorreoCliente")
    public void createCorreoCliente(@RequestBody CorreoCliente cc) {
        correoClienteS.insertCorreoCliente(cc);
    }
    
    // FALTAN 3 METODOS MAS 
}
