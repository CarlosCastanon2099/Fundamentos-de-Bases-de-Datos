/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Service;

import practica08FBDD.model.Cliente;
import java.util.List;

/**
 *
 * @author Mauro E. Chávez
 */
public interface ClienteServicio {
    List<Cliente> findAll();
    void insertCliente(Cliente cl);
    void updateCliente(Cliente cl);
    void executeUpdateCliente(Cliente cl);
    void deleteCliente(Cliente cl);
}
