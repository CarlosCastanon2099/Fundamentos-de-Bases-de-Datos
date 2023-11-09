-- i. Veterinarios cuyo nombre empiece con la letra C.
select * from veterinario
where nombre like 'C%';

--ii. Clientes que hayan nacido en el mes de Junio.
select * from clientes
where EXTRACT(MONTH FROM fechnacimiento) = 6;

-- iii. Alimentos cuya fecha de caducidad este entre el 1 de enero del 2023 y del 18 de octubre del 2023.
select * from alimento
where fechaCaducidad between '2023-01-01' and '2023-10-18';

-- iv. Animales cuya alimentación sea carnivoro
select * from animal
where alimentacion like 'carnivoro';

-- v. Todos los Clientes registrados en El zoológico de Huitziltepec.
select * from cliente;