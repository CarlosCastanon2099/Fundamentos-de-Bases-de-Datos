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
 *
 * @author Mauro E. Chávez
 */
@Service
public class ClienteServicioImp implements ClienteServicio{
    @Resource
    ClienteRepositorio clienteRep;

    @Override
    public List<Cliente> findAll() {
        return clienteRep.findAll();
    }
   

    @Override
    public void insertCliente(Cliente cl) {
        clienteRep.insertCliente(cl);
    }

    @Override
    public void updateCliente(Cliente cl) {
        clienteRep.updateOperador(op);
    }

    @Override
    public void executeUpdateCliente(Cliente cl) {
        clienteRep.executeUpdateCliente(cl);
    }

    @Override
    public void deleteCliente(Cliente cl) {
        clienteRep.deleteCliente(cl);
    }
}
