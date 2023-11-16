/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Repository;

import practica08FBDD.Mapper.ClienteRowMapper;
import practica08FBDD.model.Cliente;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

/**
 * Implementación concreta de la interfaz que se asegura
 * que Cliente tenga los métodos necesarios para habilitar
 * funciones CRUD en la base de datos
 * @author Mauro E. Chávez
 * @version 8 - Noviembre - 2023
 */
@Repository
public class ClienteRepositorioImp implements ClienteRepositorio{

    NamedParameterJdbcTemplate template;
    
    /**
     * Planilla auxiliar para realizar nuestras peticiones
     * @param template 
     */
    public ClienteRepositorioImp(NamedParameterJdbcTemplate template){
        this.template = template;
    }
    
    /**
     * Método que nos regresa una lista con todas las instancias creadas de Cliente
     * la petición se hace en SQL
     * @return List<Cliente> - - Una lista con todos los clientes
     */
    @Override
    public List<Cliente> findAll() {
        return template.query("SELECT * FROM Cliente", new ClienteRowMapper());
    }
    
    /**
     * Método para regresar un registro en especifico
     * @return List<Cliente> - - Una lista con el registro en cuestión.
     */
    @Override
    public List<Cliente> getClienteById(Cliente cl) {
        String sql = "SELECT * FROM correoCliente WHERE idPersona=";
        sql = sql + cl.getIdPersona();
        return template.query(sql, new ClienteRowMapper());
    }
    
    /**
     * Método que dado un Cliente se encargar de tomar sus párametros y crear
     * la petición en SQL para su insersición en la base de datos
     * @param cl - - El cliente que deseamos insertar
     */
    @Override
    public void insertCliente(Cliente cl) {
        final String sql = "INSERT INTO Cliente(idPersona, nombre, paterno, materno, genero) "
        +" values (:idPersona,:nombre,:paterno,:materno,:genero)";
        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource param = new MapSqlParameterSource()
                .addValue("idPersona", cl.getIdPersona())
                .addValue("nombre", cl.getNombre())
                .addValue("paterno", cl.getPaterno())
                .addValue("materno", cl.getMaterno())
                .addValue("genero", cl.getGenero());
        template.update(sql,param,holder);
        
    }
    
    
    /**
     * Método que dado un Cliente se encarga de actualizar su registro
     * en la base de datos a traves de su identificador (idPersona),
     * esto a través de SQL
     * @param cl - - El cliente que deseamos actualizar
     */
    @Override
    public void updateCliente(Cliente cl) {
            final String sql = "UPDATE Cliente SET idPersona=:idPersona,"
                + "nombre=:nombre,paterno=:paterno,"
                + "materno=:materno,"
                + "genero=:genero "
                + "WHERE idPersona=:idPersona";
            
        KeyHolder holder = new GeneratedKeyHolder();
        SqlParameterSource param = new MapSqlParameterSource()
                .addValue("idPersona", cl.getIdPersona())
                .addValue("nombre", cl.getNombre())
                .addValue("paterno", cl.getPaterno())
                .addValue("materno", cl.getMaterno())
                .addValue("genero", cl.getGenero());
        template.update(sql,param,holder);
    }
    
    /**
     * Método que dado un Cliente, se encarda de ejecutar la acutalización
     * en la base de datos creando la petición a través de los datos de 
     * la instancia Cliente, usando SQL
     * @param cl - - El cliente a actualizar
     */
    @Override
    public void executeUpdateCliente(Cliente cl) {
        
        final String sql = "UPDATE Cliente SET idPersona=:idPersona,"
                + "nombre=:nombre,paterno=:paterno,"
                + "materno=:materno,"
                + "genero=:genero"
                + "WHERE idPersona=:idPersona";
            
        Map<String,Object> map = new HashMap<String,Object>();
                map.put("idPersona", cl.getIdPersona());
                map.put("nombre", cl.getNombre());
                map.put("paterno", cl.getPaterno());
                map.put("materno", cl.getMaterno());
                map.put("genero", cl.getGenero());
               
                template.execute(sql,map,new PreparedStatementCallback<Object>(){
                    @Override
                    public Object doInPreparedStatement(PreparedStatement ps)
                            throws SQLException, DataAccessException{
                        return ps.executeUpdate();
                    }
                });
    }

    
    /**
     * Método que dado un cliente se encarga de generar la petición en SQL
     * para borrarlo de la base de datos
     * @param cl - - El cliente a borrar
     */
    @Override
    public void deleteCliente(Cliente cl) {
        final String sql = "DELETE FROM Cliente WHERE idPersona=:idPersona";
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("idPersona",cl.getIdPersona());
            template.execute(sql,map,new PreparedStatementCallback<Object>(){
                @Override
                public Object doInPreparedStatement(PreparedStatement ps)
                    throws SQLException, DataAccessException{
                    return ps.executeUpdate();
                }
            });
    }
    
}
