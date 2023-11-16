/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Service;

import jakarta.annotation.Resource;
import java.util.List;
import org.springframework.stereotype.Service;
import practica08FBDD.Repository.CorreoClienteRepositorio;
import practica08FBDD.model.Cliente;
import practica08FBDD.model.CorreoCliente;

/**
 * Implementación de servicio que proporciona operaciones de negocio relacionadas con la entidad CorreoCliente.
 * Esta clase actúa como una capa intermedia entre la capa de controladores y la capa de acceso a datos,
 * utilizando la interfaz CorreoClienteRepositorio para realizar operaciones CRUD en la base de datos.
 * @author crgal
 */
@Service
public class CorreoClienteServicioImp implements CorreoClienteServicio {
    
    @Resource
    CorreoClienteRepositorio correoClienteRep; // Repositorio que maneja las operaciones de acceso a datos para la entidad CorreoCliente.

    /**
     * Recupera todos los registros de CorreoCliente desde la base de datos.
     * @return Lista de objetos CorreoCliente.
     */
    @Override
    public List<CorreoCliente> findAll() {
        return correoClienteRep.findAll();
    }

    /**
     * Metodo getter que nos regresa un correoCliente en especifico por el idCliente
     */
    @Override
    public List<CorreoCliente> getCorreoClienteById(CorreoCliente cc){
        return correoClienteRep.getCorreoClienteById(cc);
    }
    
    /**
     * Inserta un nuevo registro de CorreoCliente en la base de datos.
     * @param cc Objeto CorreoCliente a ser insertado.
     */
    @Override
    public void insertCorreoCliente(CorreoCliente cc) {
        correoClienteRep.insertCorreoCliente(cc);
    }

    /**
     * Actualiza un registro existente de CorreoCliente en la base de datos.
     * @param cc Objeto CorreoCliente con los datos actualizados.
     */
    @Override
    public void updateCorreoCliente(CorreoCliente cc) {
        correoClienteRep.updateCorreoCliente(cc);
    }

    /**
     * Método que actualiza el CorreoCliente en el servicio web
     * @param cc El CorreoCliente que se actualiza en el servicio web.
     */
    @Override
    public void executeUpdateCorreoCliente(CorreoCliente cc) {
        correoClienteRep.executeUpdateCorreoCliente(cc);
    }

    /**
     * Elimina un registro de CorreoCliente de la base de datos.
     * @param cc Objeto CorreoCliente a ser eliminado.
     */
    @Override
    public void deleteCorreoCliente(CorreoCliente cc) {
        correoClienteRep.deleteCorreoCliente(cc);
    } 
}
