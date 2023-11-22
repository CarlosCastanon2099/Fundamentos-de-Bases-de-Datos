-- 1) Un SP el cual se encarga de registrar un cliente, en este SP, debes introducir la información del cliente y
-- se debe encargar de insertar en la tabla correspondiente, es importante que no permitan la inserción de
-- números o símbolos cuando sean campos relacionados a nombres.
CREATE OR REPLACE FUNCTION registrar_cliente(
    p_idPersona BIGINT,
    p_nombre VARCHAR(50),
    p_paterno VARCHAR(50),
    p_materno VARCHAR(50),
    p_genero CHAR(1)
) RETURNS VOID AS $$
BEGIN
    -- Verificar que los campos nombre, paterno y materno no contengan números o símbolos
    IF p_nombre ~ '[^a-zA-Z]' OR p_paterno ~ '[^a-zA-Z]' OR p_materno ~ '[^a-zA-Z]' THEN
        RAISE EXCEPTION 'Los campos nombre, paterno y materno no deben contener números o símbolos';
    END IF;

    -- Insertar los datos en la tabla cliente
    INSERT INTO cliente(idPersona, nombre, paterno, materno, genero)
    VALUES (p_idPersona, p_nombre, p_paterno, p_materno, p_genero);
END;
$$ LANGUAGE plpgsql;


-- Ejemplo de uso: SELECT registrar_cliente(2099, 'Maximo', 'Decimo', 'Meridio', 'H');

-- Con la siguiente funcion auxiliar, podemos verificar que el cliente se haya registrado correctamente
-- SELECT * FROM obtener_cliente(2099);