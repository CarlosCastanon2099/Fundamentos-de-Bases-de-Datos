-- i. Consulta para saber que veterinarios y cuidadores comparten el apellido
SELECT v.nombre AS veterinario, c.nombre AS cuidador, v.paterno, v.materno
FROM veterinario v, cuidador c
WHERE v.paterno = c.paterno OR v.materno = c.materno



-- iv. Consulta para saber que cuidadores y proveedores tienen el mismo estado
SELECT c.nombre AS cuidador, p.nombre AS proveedor, c.estado
FROM cuidador c, proveedor p
WHERE c.estado = p.estado AND c.id <> p.id


