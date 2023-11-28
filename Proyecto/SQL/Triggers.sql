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

-- Funcion para verificar que un animal solo puede tener un cuidador.
create or replace function checarTrabajadorAnimal()
returns trigger as $$
declare 
	contador INTEGER;
begin 
	select count(*) into contador from animal where (idpersona = new.idpersona);
	if contador >= 1 then
		if TG_OP = 'INSERT' then
			raise exception 'El cuidador elegido a cuidar el animal que se quiere INSERTAR, ya esta cuidando otro animal.';
		elsif TG_OP = 'UPDATE' then
			raise exception 'El cuidador elegido a cuidar el animal que se quiere ACTUALIZAR, ya esta cuidando otro animal.';
		end if;
		return null;
	end if;
	return new;
end;
$$ language plpgsql;


-- Trigger para verificar que un Cuidador solo pueda cuidar a un animal.
create trigger verificarCuidador 
before insert or update on animal
for each row
execute function checarTrabajadorAnimal();


-- Funcion para verificar que un animal solo puede estar en una jaula. Ya se cumple con que pertenezca a un solo bioma.
-- Ademas se cumple con que tanto el cuidador debe de ser de laborar en el mismo bioma que el animal.
create or replace function checarAnimalEnJaula()
returns trigger as $$
declare 
	contador INTEGER;
	idCuidadorBioma INTEGER;
	idAnimalBioma INTEGER;
begin
	select c.idbioma into idCuidadorBioma
	from
		animal as a,
		cuidador as c
	where (
		new.idanimal = a.idanimal and
		a.idpersona = c.idpersona
	);
	idAnimalBioma := new.idbioma;
	select count(*) into contador from jaula where (idanimal = new.idanimal);
	if contador >= 1 then
		if TG_OP = 'INSERT' then
			raise exception 'El animal en la jaula a INSERTAR ya esta en una jaula, solo esta permitado que un animal este en una jaula y en un Bioma.';
		elsif TG_OP = 'UPDATE' then
			raise exception 'El animal de la jaula a ACTUALIZAR ya cuenta con una jaula, no esta permitido que un animal este es mas de una Jaula';
		end if;
		return null;
	end if;
	if idCuidadorBioma <> idAnimalBioma then
		raise exception 'No se tiene permitido que un cuidador que es de otro bioma, este a cargo de este animal.';
		return null;
	end if;
	return new;
end;
$$ language plpgsql;

-- Trigger para verificar que un animal solo puede estar en una jaula y un bioma.
create trigger verificarAnimal
before insert or update on jaula
for each row 
execute function checarAnimalEnJaula();

-- Funcion para verificar que un animal solo puede ser atendido por veterinarios del mismo bioma.
-- Ademas se cumple con que tanto el veterinario pertenecer al mismo bioma del animal.
create or replace function checarVeterinarioAtender()
returns trigger as $$
declare 
	idAnimalBioma INTEGER;
begin
	select jaula.idbioma into idAnimalBioma from jaula where (idanimal = new.idanimal);
    if (SELECT NOT EXISTS (select l.idbioma 
							from laborar as 1
							where new.idpersona = l.idpersona AND idAnimalBioma = l.idbioma)) THEN 
		raise exception 'No se tiene permitido que un veterinario atienda a un animal de otro bioma al asignado.';
		return null;
	end if;
	return new;
end;
$$ language plpgsql;

-- Trigger para verificar que un veterinario solo puede atender a animales del mismo bioma.
create trigger verificarAtender
before insert or update on atender
for each row 
execute function checarVeterinarioAtender();