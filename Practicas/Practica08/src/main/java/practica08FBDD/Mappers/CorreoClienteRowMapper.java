/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Mappers;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import practica08FBDD.Models.CorreoCliente;

/**
 *
 * @author crgal
 */
public class CorreoClienteRowMapper implements RowMapper<CorreoCliente> {

    @Override
    public CorreoCliente mapRow(ResultSet rs, int rowNum) throws SQLException {
        CorreoCliente cc = new CorreoCliente(
                rs.getInt("idPersona"),
                rs.getString("correo")
        );
        return cc;
    }
    
}
