/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Repository;

import java.util.List;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import practica08FBDD.Mappers.CorreoClienteRowMapper;
import practica08FBDD.Models.CorreoCliente;

/**
 *
 * @author crgal
 */
@Repository
public class CorreoClienteRepositorioI implements CorreoClienteRepositorio {

    NamedParameterJdbcTemplate template;
    
    public CorreoClienteRepositorioI (NamedParameterJdbcTemplate template) {
        this.template = template;
    }
    
    @Override
    public List<CorreoCliente> findAll() {
        return template.query("SELECT * FROM CorreoCliente", new CorreoClienteRowMapper());
    }

    @Override
    public void insertCorreoCliente(CorreoCliente cc) {
    
    }

    @Override
    public void updateCorreoCliente(CorreoCliente cc) {
    
    }

    @Override
    public void executeUpdateCorreoCliente(CorreoCliente cc) {
    
    }

    @Override
    public void deleteCorreoCliente(CorreoCliente cc) {
    
    } 
}
