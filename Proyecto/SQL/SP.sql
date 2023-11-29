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


-- 2) Un SP que se encarga de registrar un nuevo alimento de algún proveedor:

CREATE OR REPLACE FUNCTION registrar_alimento(
	p_idInsumo bigint,
	p_idPersona bigint,
	p_nombre varchar(50),
	p_fechaCaducidad date,
	p_cantidad int4,
	p_refrigeracion bool,
	p_tipoAlim varchar(50)
) RETURNS VOID AS $$
BEGIN
    if (SELECT NOT EXISTS (select p_idPersona from proveedor where idPersona = p_idPersona)) THEN 
        RAISE EXCEPTION 'No existe el idpersona en la tabla proveedor';
    END IF;
   
    -- Insertar los datos en la tabla alimento
    INSERT INTO alimento(idInsumo, idPersona, nombre, fechaCaducidad, cantidad, refrigeracion, tipoAlim)
    VALUES (p_idinsumo, p_idpersona, p_nombre, p_fechacaducidad, p_cantidad, p_refrigeracion, p_tipoalim);
END;
$$ LANGUAGE plpgsql;

-- 3) Un SP que se encarga de eliminar un animal

CREATE OR REPLACE FUNCTION eliminar_animal(
	p_idanimal bigint
) RETURNS VOID AS $$
BEGIN
    if (SELECT NOT EXISTS (select p_idanimal from animal where animal.idanimal = idanimal)) THEN 
        RAISE EXCEPTION 'No existe el animal';
    END IF;
   
    -- Insertar los datos en la tabla alimento
    DELETE FROM animal where idanimal = animal;
END;
$$ LANGUAGE plpgsql;