/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Mapper;

import practica08FBDD.model.Cliente;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Mauro E. Chávez
 */
public class ClienteRowMapper implements RowMapper<Cliente>{

    @Override
    public Cliente mapRow(ResultSet rs, int rowNum) throws SQLException {
        Cliente cl = new Cliente();
        cl.setIdPersona(rs.getInt("idPersona"));
        cl.setNombre(rs.getString("nombre"));
        cl.setPaterno(rs.getString("paterno"));
        cl.setMaterno(rs.getString("materno"));
        cl.setGenero(rs.getString("genero").charAt(0));
        return cl;       
    }
}