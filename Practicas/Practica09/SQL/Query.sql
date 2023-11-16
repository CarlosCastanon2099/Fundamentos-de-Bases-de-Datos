-- i. Consulta para saber que veterinarios y cuidadores comparten el apellido
SELECT 
    v.nombre AS veterinario, 
    c.nombre AS cuidador, 
    v.paterno AS VetPat, 
    c.paterno AS CuiPat,
    v.materno AS VetMat, 
    c.materno AS CuiMat
FROM veterinario v, cuidador c
WHERE v.paterno = c.paterno OR v.materno = c.materno



  
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
FROM (
    SELECT 
        s.*,
        j.idbioma
    FROM (
        SELECT 
            r.*
        FROM (
            SELECT 
                al.*, 
                alr.idanimal
            FROM 
                (SELECT * FROM alimento WHERE tipoalim = 'semillas') AS al,
                alimentar AS alr
            WHERE (al.idinsumo = alr.idinsumo)
        ) AS r,
        animal AS a
        WHERE (r.idanimal = a.idanimal)
    ) AS s,
    jaula AS j
    WHERE (s.idanimal = j.idanimal)
) AS t,
(
    SELECT * 
    FROM bioma 
    WHERE (tipobioma = 'Aviario')
) AS b
WHERE (t.idbioma = b.idbioma);




-- iv. Consulta para saber que cuidadores y proveedores tienen el mismo estado
SELECT c.nombre AS cuidador, p.nombre AS proveedor, c.estado
FROM cuidador c, proveedor p
WHERE c.estado = p.estado;

-- v. Consulta de Biomas que poseean al menos 10 animales

SELECT * 
FROM bioma
WHERE idbioma 
IN (SELECT idBioma 
    FROM
    (SELECT idBioma, count(idAnimal) as num_animales 
        FROM jaula  
        GROUP BY idBioma)
        WHERE num_animales >= 10);