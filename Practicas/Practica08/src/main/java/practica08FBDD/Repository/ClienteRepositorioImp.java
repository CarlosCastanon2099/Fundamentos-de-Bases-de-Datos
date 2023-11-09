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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Mauro E. Chávez
 */
@Repository
public class ClienteRepositorioImp implements ClienteRepositorio{

    NamedParameterJdbcTemplate template;
    
    public ClienteRepositorioImp(NamedParameterJdbcTemplate template){
        this.template = template;
    }
    @Override
    public List<Cliente> findAll() {
        return template.query("SELECT * FROM Cliente", new ClienteRowMapper());
    }

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
    

    @Override
    public void updateCliente(Cliente cl) {
            final String sql = "UPDATE Cliente SET idPersona=:idPersona,"
                + "nombre=:nombre,paterno=:paterno,"
                + "materno=:materno,"
                + "genero=:genero"
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

    @Override
    public void executeUpdateCliente(Cliente op) {
        
        final String sql = "UPDATE Cliente SET idPersona=:idPersona,"
                + "nombre=:nombre,paterno=:paterno,"
                + "materno=:materno,"
                + "genero=:genero"
                + "WHERE idPersona=:idPersona";
            
        Map<String,Object> map = new HashMap<String,Object>();
                map.put("idPersona", op.getIdPersona());
                map.put("nombre", op.getNombre());
                map.put("paterno", op.getPaterno());
                map.put("materno", op.getMaterno());
                map.put("genero", op.getGenero());
               
                template.execute(sql,map,new PreparedStatementCallback<Object>(){
                    @Override
                    public Object doInPreparedStatement(PreparedStatement ps)
                            throws SQLException, DataAccessException{
                        return ps.executeUpdate();
                    }
                    
                });
        
    }

    @Override
    public void deleteCliente(Cliente cl) {
        final String sql = "DELETE FROM Cliente WHERE idPersona=:idPersona";
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("idPersona",op.getIdPersona());
            template.execute(sql,map,new PreparedStatementCallback<Object>(){
                @Override
                public Object doInPreparedStatement(PreparedStatement ps)
                    throws SQLException, DataAccessException{
                    return ps.executeUpdate();
                }
                    
            });
    }
    
}
