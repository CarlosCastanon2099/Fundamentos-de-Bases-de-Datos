/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Repository;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import practica08FBDD.Mapper.ClienteRowMapper;
import practica08FBDD.Mapper.CorreoClienteRowMapper;
import practica08FBDD.model.Cliente;
import practica08FBDD.model.CorreoCliente;

/**
 * Implementación del repositorio para la entidad CorreoCliente utilizando Spring Data y JDBC.
 * Esta clase proporciona métodos para realizar operaciones CRUD (Create, Read, Update, Delete) en la base de datos
 * relacionadas con la entidad CorreoCliente.
 * @author empresaurios 🦖💼
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
     * Método para regresar un registro en especifico
     * @return List<Cliente> - - Una lista con el registro en cuestión.
     */
    @Override
    public List<CorreoCliente> getCorreoClienteById(CorreoCliente cl) {
        String sql = "SELECT * FROM correocliente WHERE idPersona=";
        sql = sql + cl.getIdPersona();
        return template.query(sql, new CorreoClienteRowMapper());
    }
    
    /**
     * Inserta un nuevo registro de CorreoCliente en la base de datos.
     * @param cc Objeto CorreoCliente a ser insertado.
     */
    @Override
    public void insertCorreoCliente(CorreoCliente cc) {
        final String sql = "INSERT INTO correoCliente(idPersona, correo) "
        +" values (:idPersona,:correo)";
        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource param = new MapSqlParameterSource()
                .addValue("idPersona", cc.getIdPersona())
                .addValue("correo", cc.getCorreo());
        template.update(sql,param,holder);
    
    }

    /**
     * Actualiza un registro existente de CorreoCliente en la base de datos.
     * @param cc Objeto CorreoCliente con los datos actualizados.
     */
    @Override
    public void updateCorreoCliente(CorreoCliente cc) {
        final String sql = "UPDATE CorreoCliente SET idPersona=:idPersona,"
                + "correo=:correo "
                + "WHERE idPersona=:idPersona";
            
            KeyHolder holder = new GeneratedKeyHolder();
            SqlParameterSource param = new MapSqlParameterSource()
                    .addValue("idPersona", cc.getIdPersona())
                    .addValue("correo", cc.getCorreo());
            template.update(sql,param,holder);
    
    }


    /**
     * Método que dado un Cliente, se encarga de ejecutar la acutalización
     * en la base de datos creando la petición a través de los datos de 
     * la instancia CorreoCliente, usando SQL.
     * @param cc - - El cliente a actualizar
     */
    @Override
    public void executeUpdateCorreoCliente(CorreoCliente cc) {
        final String sql = "UPDATE Cliente SET idPersona=:idPersona,"
                + "correo=:correo,"
                + "WHERE idPersona=:idPersona";
            
        Map<String,Object> map = new HashMap<String,Object>();
            map.put("idPersona", cc.getIdPersona());
            map.put("correo", cc.getIdPersona());
            
            template.execute(sql,map,new PreparedStatementCallback<Object>(){
                @Override
                public Object doInPreparedStatement(PreparedStatement ps)
                        throws SQLException, DataAccessException{
                    return ps.executeUpdate();
                }
            });
    }

    /**
     * Elimina un registro de CorreoCliente de la base de datos.
     * @param cc Objeto CorreoCliente a ser eliminado.
     */
    @Override
    public void deleteCorreoCliente(CorreoCliente cc) {
        final String sql = "DELETE FROM correoCliente WHERE idPersona=:idPersona";
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("idPersona",cc.getIdPersona());
            template.execute(sql,map,new PreparedStatementCallback<Object>(){
                @Override
                public Object doInPreparedStatement(PreparedStatement ps)
                    throws SQLException, DataAccessException{
                    return ps.executeUpdate();
                }
            });
    }    

}