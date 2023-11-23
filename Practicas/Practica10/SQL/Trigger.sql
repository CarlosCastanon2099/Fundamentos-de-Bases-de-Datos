-- 1) 
-- Un disparador que se encarga de intercambiar el apellido materno con el paterno de los proveedores.

-- Funcion auxiliar que se encarga de hacer el intercambio y se llama durante el disparador
CREATE OR REPLACE FUNCTION intercambia_apellidos() 
RETURNS TRIGGER
as $$
DECLARE
    -- Declaramos las variables que nos ayudaran a almacenar los valores a cambiar
    temporal_paterno VARCHAR(20);
    temporal_materno VARCHAR(20);
BEGIN
    -- Inicializamos nuestras variables con los valores
    SELECT paterno INTO temporal_paterno FROM proveedor WHERE new.idPersona = idPersona;
    SELECT materno INTO temporal_materno FROM proveedor WHERE new.idPersona = idPersona;
    -- Se actualiza el registro intercambiando los apellidos
    UPDATE proveedor SET paterno = temporal_materno,materno = temporal_paterno WHERE NEW.idPersona = idPersona;
    -- No regresamos ningún valor porque no es necesario, sólo debemos cambiar los nombres
    RETURN null;
END;
$$ LANGUAGE plpgsql;

-- La declaracion del disparador que intercambia los valores en apellido mater por apellido paterno
create TRIGGER cambia_apellidos
AFTER INSERT ON proveedor
FOR EACH ROW
EXECUTE PROCEDURE intercambia_apellidos();