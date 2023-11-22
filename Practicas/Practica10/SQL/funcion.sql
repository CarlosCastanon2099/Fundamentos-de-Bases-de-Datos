-- 1)
-- Función que recibe el identificador de veterinarios y regrese la edad del mismo.
CREATE OR REPLACE FUNCTION get_edad_veterinario(veterinarian_id INT)
RETURNS INT AS $$
BEGIN
    RETURN (
        SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, fechNacimiento))
        FROM veterinario
        WHERE idPersona = veterinarian_id
    );
END; $$
LANGUAGE plpgsql;

-- Ejemplo de uso con el veterinario 2 que nacio en el 2001
SELECT get_edad_veterinario(2);



-- 2) 
-- Función que recibe el bioma y calcula el número de animales en ese bioma.
-- Recordemos que en nuestro modelo, en cada jaula solo puede haber un animal (a su vez todos los animales deben tener jaula)
-- y a su vez, todas las jaulas tienen un bioma asignado.
CREATE OR REPLACE FUNCTION get_numero_animales_en_Bioma(bioma_id INT)
RETURNS INT AS $$
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM jaula
        WHERE idBioma = bioma_id
    );
END; $$
LANGUAGE plpgsql;

-- Ejemplo de uso con el bioma 1, el cual es el de Desierto
SELECT get_numero_animales_en_Bioma(1);




-- Funcion Auxiliar del SP 1)
-- Funcion que regresa la informacion de un cliente en base a su id
CREATE OR REPLACE FUNCTION obtener_cliente(p_idPersona BIGINT)
RETURNS TABLE(
    idPersona BIGINT,
    nombre VARCHAR(50),
    paterno VARCHAR(50),
    materno VARCHAR(50),
    genero CHAR(1)
) AS $$
BEGIN
    RETURN QUERY 
    SELECT cliente.idPersona, cliente.nombre, cliente.paterno, cliente.materno, cliente.genero
    FROM cliente
    WHERE cliente.idPersona = p_idPersona;
END;
$$ LANGUAGE plpgsql;

-- Ejemplo de uso: SELECT * FROM obtener_cliente(105);
