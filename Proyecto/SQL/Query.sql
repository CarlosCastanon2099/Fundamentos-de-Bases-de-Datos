-- PETICIONES NO TRVIALES SOBRE LA BASE DE DATOS

-- I. Consulta para saber que veterinarios y cuidadores comparten el apellido
SELECT 
    v.nombre AS veterinario, 
    c.nombre AS cuidador, 
    v.paterno AS VetPat, 
    c.paterno AS CuiPat,
    v.materno AS VetMat, 
    c.materno AS CuiMat
FROM veterinario v, cuidador c
WHERE v.paterno = c.paterno OR v.materno = c.materno;



-- II. Consulta para saber que animales herbivoros se encuentran en el bosque templado
SELECT 
    a.nombre AS animal,
    b.tipobioma AS bioma
FROM 
    animal a, jaula j, bioma b
WHERE 
    a.idanimal = j.idanimal AND 
    j.idbioma = b.idbioma AND 
    a.alimentacion = 'Herbivoro' AND 
    b.tipobioma = 'Bosque templado';



-- III. Alimentos de tipo semilla, que son distribuidos en el aviario.
SELECT 
    idinsumo,
    idpersona,
    nombre,
    fechacaducidad,
    cantidad,
    refrigeracion,
    tipoalim,
    b.tipobioma
FROM (SELECT 
        s.*,
        j.idbioma
    FROM (SELECT 
            r.*
            FROM (SELECT 
                    al.*, 
                    alr.idanimal
                FROM (SELECT * 
                        FROM alimento 
                        WHERE tipoalim = 'semillas'
                ) AS al,
                alimentar AS alr
                WHERE (al.idinsumo = alr.idinsumo)
            ) AS r,
            animal AS a
            WHERE (r.idanimal = a.idanimal)
    ) AS s,
    jaula AS j
    WHERE (s.idanimal = j.idanimal)
) AS t,
(SELECT * 
    FROM bioma 
    WHERE (tipobioma = 'Aviario')
) AS b
WHERE (t.idbioma = b.idbioma);



-- IV. Consulta para saber que cuidadores y proveedores tienen el mismo estado
SELECT c.nombre AS cuidador, p.nombre AS proveedor, c.estado
FROM cuidador c, proveedor p
WHERE c.estado = p.estado;



-- V. Consulta de Biomas que poseean al menos 10 animales
SELECT * 
FROM bioma
WHERE idbioma 
IN (SELECT idBioma 
    FROM (SELECT idBioma, count(idAnimal) as num_animales 
            FROM jaula  
            GROUP BY idBioma) as conteo
    WHERE num_animales >= 10);



-- VI. Consulta que regresa una tabla con la información de los biomas,
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



-- VII. Consulta que regresa el número de provedores que tenemos por estado
-- siempre y cuando su fecha de nacimiento haya sido previa al año 2000
-- Debemos regresar la consulta ordenada por estado.
(select estado, count(idPersona)
from
(select * from proveedor
where fechnacimiento <= '01-01-2000')
group by estado
order by estado)



-- VIII. Consulta que regresa toda la información de los veterinarios
-- que trabajan en el zoológico pero además agrega el salario promedio, minimo 
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



-- IX. Consulta que nos regresa el nombre completo de los cuidadores
-- y el animal que tiene asignado cada persona.
select c.nombre,
c.paterno,
c.materno,
a.nombre as animal_asignado
from animal as a
join cuidador as c
on c.idPersona = a.idPersona;



-- X. Consulta que nos regresa un tipo de evento y el nombre de las personas
-- que asistieron a ese tipo de evento.
select tipoevento,
nombre,
paterno,
materno
from
    (select * 
    from cliente as c
    join
        (select ae.*,
        e.tipoEvento
        from asistirCliente as ae
        join evento as e
        on ae.idEvento = e.idEvento) as r
    on c.idPersona = r.idPersona)
order by tipoevento;



-- XI. Todos los veterinarios que hayan atendido a un animal y sean de la Ciudad de Mexico
select *
from (SELECT veterinario.idpersona 
                        FROM atender, veterinario
                        where veterinario.idpersona  = atender.idpersona
) as a, veterinario as v 
where v.estado = 'Mexico' and v.idpersona = a.idpersona;



--  XII. Obtener el nombre completo de los proveedores que provean carnes junto con el precio ordenado y ordenados de menor a mayor el precio.
SELECT nombre, paterno, materno, costo 
FROM (
    SELECT idpersona
    FROM alimento
    WHERE tipoalim = 'carnes'
) AS a, proveedor AS b
WHERE a.idpersona = b.idpersona
order by costo;



-- XIII. Obtener todos los animales hembras del aviario
select *
from (
    SELECT a.idanimal
    FROM animal AS a,
        (SELECT idanimal
        FROM jaula
        where idbioma = 5) AS b
    where a.sexo = 'H' AND  a.idanimal = b.idanimal 
) AS a,
animal AS b
WHERE a.idanimal = b.idanimal;



-- XIV. Obtiener toda la informacion del cliente menos el genero con sus correos, donde se tiene dos o mas correos electronicos 
-- ordenados por id y de forma ascendente.
select c.*, cc.correo 
from
	(select 
		idpersona, 
		nombre, 
		paterno, 
		materno 
	from cliente
	) as c,
	correocliente as cc,
	(select idpersona 
	from correocliente 
	group by idpersona
	having count(distinct correo) >= 2
	) as ccn
where 
	(ccn.idpersona = cc.idpersona and
	cc.idpersona = c.idpersona)
order by idpersona asc; 



-- XV. Obtener toda la informacion de los alimentos que van a caducar a partir de 
-- esta dia en transcurso al fin del año 2023, ademas obtener la informacion
-- del idpersona, su nombre completo y rfc que entrego ese alimento.
select * 
from 
	(select 
		idpersona,
    	nombre,
    	paterno,
		materno,
		rfc
	from
	    proveedor
	) as pp,
	(select * 
	from alimento 
	where fechacaducidad >= current_date and
	fechacaducidad <= '2023-12-30'
	) as a
where pp.idpersona = a.idpersona;