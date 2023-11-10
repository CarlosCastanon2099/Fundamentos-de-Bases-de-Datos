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
 * Clase auxiliar en el mapeo de los valores de un RowMapper a una instancia de Cliente
 * @author Mauro E. Chávez
 * @version 8 - Noviembre - 2023
 */
public class ClienteRowMapper implements RowMapper<Cliente>{
    
    /**
     * Metodo que utiliza los valores del row mapper para crear la instancia Cliente
     * @param rs - - La estructura resultado de ir agregando los campos
     * @param rowNum - - El numero de filas que posee
     * @return cl - - El cliente una vez que se ha terminado el mapeo
     * @throws SQLException 
     */
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