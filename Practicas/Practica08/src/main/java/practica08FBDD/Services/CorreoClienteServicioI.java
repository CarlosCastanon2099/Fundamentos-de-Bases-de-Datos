/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Services;

import jakarta.annotation.Resource;
import java.util.List;
import org.springframework.stereotype.Service;
import practica08FBDD.Models.CorreoCliente;
import practica08FBDD.Repository.CorreoClienteRepositorio;

/**
 *
 * @author crgal
 */
@Service
public class CorreoClienteServicioI implements CorreoClienteServicio {
    
    @Resource
    CorreoClienteRepositorio correoClienteRep;

    @Override
    public List<CorreoCliente> findAll() {
        return correoClienteRep.findAll();
    }

    @Override
    public void insertCorreoCliente(CorreoCliente cc) {
        correoClienteRep.insertCorreoCliente(cc);
    }

    @Override
    public void updateCorreoCliente(CorreoCliente cc) {
        correoClienteRep.updateCorreoCliente(cc);
    }

    @Override
    public void executeUpdateCorreoCliente(CorreoCliente cc) {
        correoClienteRep.executeUpdateCorreoCliente(cc);
    }

    @Override
    public void deleteCorreoCliente(CorreoCliente cc) {
        correoClienteRep.deleteCorreoCliente(cc);
    } 
}