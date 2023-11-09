package practica08FBDD.Repository;

import java.util.List;
import practica08FBDD.model.CorreoCliente;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author crgal
 */
public interface CorreoClienteRepositorio {
    
    List<CorreoCliente> findAll();
    
    public void insertCorreoCliente(CorreoCliente cc);
    
    public void updateCorreoCliente(CorreoCliente cc);
    
    public void executeUpdateCorreoCliente(CorreoCliente cc);
    
    public void deleteCorreoCliente(CorreoCliente cc);
    
}
