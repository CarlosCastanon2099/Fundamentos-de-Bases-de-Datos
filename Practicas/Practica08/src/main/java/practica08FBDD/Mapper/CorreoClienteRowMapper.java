/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica08FBDD.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import practica08FBDD.model.CorreoCliente;

/**
 * La clase CorreoClienteRowMapper implementa la interfaz RowMapper de Spring, que se utiliza para mapear filas de un ResultSet a objetos de tipo CorreoCliente.
 * Cada instancia de esta clase representa la lógica de mapeo de una fila del conjunto de resultados a un objeto CorreoCliente.
 * Esta clase se utiliza generalmente en combinación con JdbcTemplate de Spring para realizar operaciones de mapeo de datos.
 * @author Cristian Gallegos
 * @version 8 - Noviembre - 2023
 */
public class CorreoClienteRowMapper implements RowMapper<CorreoCliente> {
    
    /**
     * Mapea una fila del ResultSet a un objeto CorreoCliente.
     * @param rs ResultSet que contiene los datos de la fila.
     * @param rowNum Número de la fila actual.
     * @return Objeto CorreoCliente creado a partir de los datos de la fila.
     * @throws SQLException Si hay algún error al acceder a los datos del ResultSet.
     */
    @Override
    public CorreoCliente mapRow(ResultSet rs, int rowNum) throws SQLException {
        CorreoCliente cc = new CorreoCliente(
                rs.getInt("idPersona"),
                rs.getString("correo")
        );
        return cc;
    }
}
