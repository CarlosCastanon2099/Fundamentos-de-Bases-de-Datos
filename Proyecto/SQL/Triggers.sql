-- Función que verifica que un veterinario puede trabajar en a lo mas dos biomas.
create or replace function noBiomasTrabajados()
returns trigger as $$
declare 
	contador INTEGER;
begin
	select count(*) into contador from laborar where (idpersona = new.idpersona);
	if contador >= 2 then
		if TG_OP = 'INSERT' then
			raise exception 'El veterinario/a a INSERTAR no puede trabajar en mas de 2 biomas. Ha alcanzado el limite de biomas trabajados.';
		elsif TG_OP = 'UPDATE' then
			raise exception 'El veterinario/a a ACTUALIZAR ya tiene asignado dos biomas. No se pueden actualizar los valores.';
		end if;
		return null;
	end if;
	return new;
end;
$$ language plpgsql;

-- Trigger para verificar que un veterinario a lo más puede trabajar en dos biomas.
create trigger verificarVeterinarios 
before insert or update on laborar
for each row
execute function noBiomasTrabajados();




-- Funcion para verificar que un animal solo puede estar en una jaula. Ya se cumple con que pertenezca a un solo bioma.
-- WARNING: PUEDE QUE UN CUIDADOR PERTENEZCA A OTRO BIOMA DISTINTO DE DEL ANIMAL, CON LO CUAL EN TEORIA
-- NO SE PUEDE, NO VIENE COMO TAL EN LOS REQUISITOS, PERO EN TEORIA ESO NO ESTA PERMITIDO. CHEQUEN LOS REQUERIMIENTOS.
create or replace function checarAnimalEnJaula()
returns trigger as $$
declare 
	contador INTEGER;
begin 
	select count(*) into contador from jaula where (idanimal = new.idanimal);
	if contador >= 1 then
		raise exception 'El animal solo esta permitado para que su estancia esta en 1 jaula y pertenecer a 1 solo bioma.';
		return null;
	end if;
	return new;
end;
$$ language plpgsql;

-- Trigger para verificar que un animal solo puede estar en una jaula y un bioma.
create trigger verificarAnimal
before insert on jaula
for each row 
execute function checarAnimalEnJaula();
