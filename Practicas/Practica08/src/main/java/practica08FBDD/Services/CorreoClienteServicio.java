/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Services;

import java.util.List;
import practica08FBDD.Models.CorreoCliente;

/**
 *
 * @author crgal
 */
public interface CorreoClienteServicio {
    
    List<CorreoCliente> findAll();
    
    public void insertCorreoCliente(CorreoCliente cc);
    
    public void updateCorreoCliente(CorreoCliente cc);
    
    public void executeUpdateCorreoCliente(CorreoCliente cc);
    
    public void deleteCorreoCliente(CorreoCliente cc);
}
