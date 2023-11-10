/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Repository;

import java.util.List;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import practica08FBDD.Mapper.CorreoClienteRowMapper;
import practica08FBDD.model.CorreoCliente;

/**
 * Implementación del repositorio para la entidad CorreoCliente utilizando Spring Data y JDBC.
 * Esta clase proporciona métodos para realizar operaciones CRUD (Create, Read, Update, Delete) en la base de datos
 * relacionadas con la entidad CorreoCliente.
 * @author crgal
 */
@Repository
public class CorreoRepositorioImp implements CorreoClienteRepositorio {
    
    NamedParameterJdbcTemplate template;
    
    /**
     * Constructor para inyectar la dependencia del NamedParameterJdbcTemplate
     * @param template Objeto NamedParameterJdbcTemplate utilizado para ejecutar consultas SQL.
     */
    public CorreoRepositorioImp (NamedParameterJdbcTemplate template) {
        this.template = template;
    }
    
    /**
     * Recupera todos los registros de CorreoCliente desde la base de datos.
     * @return Lista de objetos CorreoCliente.
     */
    @Override
    public List<CorreoCliente> findAll() {
        return template.query("SELECT * FROM CorreoCliente", new CorreoClienteRowMapper());
    }

    /**
     * Inserta un nuevo registro de CorreoCliente en la base de datos.
     * @param cc Objeto CorreoCliente a ser insertado.
     */
    @Override
    public void insertCorreoCliente(CorreoCliente cc) {
    
    }

    /**
     * Actualiza un registro existente de CorreoCliente en la base de datos.
     * @param cc Objeto CorreoCliente con los datos actualizados.
     */
    @Override
    public void updateCorreoCliente(CorreoCliente cc) {
    
    }

    /**
     * Método que dado un Cliente, se encarga de ejecutar la acutalización
     * en la base de datos creando la petición a través de los datos de 
     * la instancia CorreoCliente, usando SQL.
     * @param cc - - El cliente a actualizar
     */
    @Override
    public void executeUpdateCorreoCliente(CorreoCliente cc) {
    
    }

    /**
     * Elimina un registro de CorreoCliente de la base de datos.
     * @param cc Objeto CorreoCliente a ser eliminado.
     */
    @Override
    public void deleteCorreoCliente(CorreoCliente cc) {
    
    } 
}
