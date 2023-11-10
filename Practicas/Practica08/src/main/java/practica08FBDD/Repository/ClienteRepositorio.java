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
 */
public interface ClienteRepositorio{
    List<Cliente> findAll();
    void insertCliente(Cliente cl);
    void updateCliente(Cliente cl);
    void executeUpdateCliente(Cliente cl);
    public void deleteCliente(Cliente cl);
}