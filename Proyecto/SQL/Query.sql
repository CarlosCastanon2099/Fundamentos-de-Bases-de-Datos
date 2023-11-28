PETICIONES NO TRVIALES SOBRE LA BASE DE DATOS

-- Consulta que regresa una tabla con la información de los biomas,
-- los ids de los trabajadores que trabajan en ellos y sus telefonos
-- ordenado por bioma y después por el identificador de los trabajadores

select 
aux.idBioma,
aux.tipoBioma,
tc.idPersona,
tc.telefono
from telefonoCuidador as tc
join
(select b.tipoBioma,
b.idBioma,
c.idPersona
from Cuidador as c
join Bioma as b
on c.idBioma = b.IdBioma) as aux
on tc.idPersona = aux.idPersona
order by idBioma, idPersona;

-- Consulta que regresa el número de provedores que tenemos por estado
-- siempre y cuando su fecha de nacimiento haya sido previa al año 2000
-- Debemos regresar la consulta ordenada por estado.
(select estado, count(idPersona)
from
(select * from proveedor
where fechnacimiento <= '01-01-2000')
group by estado
order by estado)

-- Consulta que regresa toda la información de los veterinarios
-- que trabajan en el zoológicopero además agrega el salario promedio, minimo 
-- y máximo que se les paga según la especialidad que poseen.
select *
from veterinario as v
join(
select especialidad, 
avg(salario) as salario_promedio, 
max(salario) as salario_maximo,
min(salario) as salario_minimo
from veterinario
group by especialidad) as aux
on v.especialidad = aux.especialidad

