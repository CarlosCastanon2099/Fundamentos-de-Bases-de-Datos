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




-- B) trigger que se encargue de contar las personas que asisten a un evento, y agregarlo como atributo en
--evento. Cada vez que se inserte, se debera actualizar el campo.

-- Funcion auxiliar que se encarga de actualizar el numero de asistencias qa un evento.
create or replace function actualizarNoAsistentes()
returns trigger as $$
begin
	-- Verificamos si la columns noASistentes ya existe
	perform column_name 
	from information_schema.columns
	where table_name = 'evento' and column_name = 'noasistentes';
	
	-- Sino existe, entonces agregamos la columna noAsistentes 
	if not found then
		alter table evento add column noasistentes INTEGER default 0;
	end if;

	if TG_OP = 'INSERT' then
		update evento
		set noasistentes = (noasistentes + 1)
		where idevento = new.idevento;
	elsif TG_OP = 'DELETE' then
		update evento
		set noasistentes = (noasistentes - 1)
		where idevento = old.idevento;
	end if;
	return null;	
end;
$$ language plpgsql;

-- TRIGGERS PARA LA ASISTENCIA DE EVENTOS
create trigger actualizarAsistentesCliente
after insert or delete on asistirCliente
for each row 
execute function actualizarNoAsistentes();

create trigger actualizarAsistentesCuidador
after insert or delete on asistirCuidador
for each row 
execute function actualizarNoAsistentes();

create trigger actualizarAsistentesProveedor
after insert or delete on asistirProveedor
for each row 
execute function actualizarNoAsistentes();

create trigger actualizarAsistentesVeterinario
after insert or delete on asistirVeterinario
for each row 
execute function actualizarNoAsistentes();
