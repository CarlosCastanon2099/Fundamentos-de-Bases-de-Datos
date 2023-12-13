-- a) 
-- Obtener toda la información de los clientes que hayan realizado una compra con los vendedores 5 u 8 en 2015.
SELECT DISTINCT Cliente.*
FROM Venta
INNER JOIN Cliente ON Venta.idCliente = Cliente.idCliente
INNER JOIN Empleado ON Venta.idEmpleado = Empleado.idEmpleado
WHERE (Empleado.idEmpleado = 5 OR Empleado.idEmpleado = 8)
AND EXTRACT(YEAR FROM Venta.Fecha) = 2015;

-- b)
-- Obtener toda la información de órdenes de venta cuyo que se hayan realizado en 2013 o 2014 durante los
-- trimestres impares y cuya cantidad se encuentre entre 100 y 150 unidades.
SELECT Venta.*, Producto.*, Empleado.*
FROM Venta
INNER JOIN Producto ON Venta.numProducto = Producto.numProducto
INNER JOIN Empleado ON Venta.idEmpleado = Empleado.idEmpleado
WHERE (EXTRACT(YEAR FROM Venta.Fecha) = 2013 OR EXTRACT(YEAR FROM Venta.Fecha) = 2014)
AND (EXTRACT(QUARTER FROM Venta.Fecha) IN (1, 3))
AND (Venta.Cantidad BETWEEN 100 AND 150);


-- c)
-- Obtener toda la información de los clientes cuyo apellido contenga el patrón de cadena “co” (p.e. Collins)
-- y que hayan solicitado productos con precio entre $150 y $180.
SELECT DISTINCT Cliente.*
FROM Venta
INNER JOIN Cliente ON Venta.idCliente = Cliente.idCliente
INNER JOIN Producto ON Venta.numProducto = Producto.numProducto
WHERE Cliente.Apellido ILIKE '%co%'
  AND Producto.Precio BETWEEN 150 AND 180;


-- d)
-- Obtener toda la información de los clientes que tengan un apellido de exactamente cuatro caracteres, en
-- donde la primera letra sea “C” o “R” o “S”, que hayan comprado productos que tengan el patrón de
-- cadena “nut” y que hayan sido atendidos por empleados con identificadores pares. Hint: apóyate en la
-- función módulo, la cual devuelve el residuo de la división, mod(dividendo, divisor).
/* 
SELECT Cliente.*
FROM Venta
INNER JOIN Cliente ON Venta.idCliente = Cliente.idCliente
INNER JOIN Producto ON Venta.numProducto = Producto.numProducto
INNER JOIN Empleado ON Venta.idEmpleado = Empleado.idEmpleado
WHERE LENGTH(Cliente.Apellido) = 4
AND Producto.Nombre LIKE '%nut%'
OR Cliente.Apellido ~* '^[C].*'
OR Cliente.Apellido ~* '^[R].*'
OR Cliente.Apellido ~* '^[S].*'
AND Empleado.idEmpleado % 2 = 0;
*/

SELECT DISTINCT Cliente.*
FROM Venta
INNER JOIN Cliente ON Venta.idCliente = Cliente.idCliente
INNER JOIN Producto ON Venta.numProducto = Producto.numProducto
INNER JOIN Empleado ON Venta.idEmpleado = Empleado.idEmpleado
WHERE CHAR_LENGTH(Cliente.Apellido) = 4
  AND LEFT(Cliente.Apellido, 1) IN ('C', 'R', 'S')
  AND Producto.Nombre ILIKE '%nut%'
  AND Empleado.idEmpleado % 2 = 0;


 
-- e)
-- Obtener toda la información de los clientes que se llaman “Aaron” y que hayan realizado alguna compra
-- durante los meses pares del año 2016. Hint: apóyate en la función MOD, es posible que requieras realizar
-- una conversión explícita en date_part así que puedes utilizar CAST(valor as NuevoTipo). 
SELECT DISTINCT Cliente.*
FROM Venta
INNER JOIN Cliente ON Venta.idCliente = Cliente.idCliente
WHERE Cliente.Nombre = 'Aaron'
  AND EXTRACT(MONTH FROM CAST(Venta.Fecha AS DATE)) % 2 = 0
  AND EXTRACT(YEAR FROM CAST(Venta.Fecha AS DATE)) = 2016; 
 
-- f)
-- Información de los empleados que hayan vendido productos con números entre 300 y 400, cuya cantidad
-- solicitada esté por arriba de 800 unidades. 
SELECT DISTINCT Empleado.*
FROM Venta
INNER JOIN Empleado ON Venta.idEmpleado = Empleado.idEmpleado
WHERE Venta.numProducto BETWEEN 300 AND 400
  AND Venta.Cantidad > 800;

-- g)
-- Obtener toda la información de los clientes que no han efectuado ninguna compra en la tienda.
SELECT DISTINCT Cliente.*
FROM Cliente
WHERE NOT EXISTS (
    SELECT 1
    FROM Venta
    WHERE Venta.idCliente = Cliente.idCliente
);
 
-- h)
-- Obtener el identificador de los clientes que hayan comprado algún producto en 2013, pero que no hayan
-- adquirido el producto con identificador 500.
SELECT DISTINCT idCliente
FROM Venta
WHERE EXTRACT(YEAR FROM Fecha) = 2013
AND idCliente NOT IN (
  SELECT idCliente
  FROM Venta
  WHERE numProducto = 500
);

--i) Información del total de ventas hechas por cada vendedor en cada año y trimestre. 
-- Mostrar la información ordenada por año, en el caso del vendedor mostrar solo su ID.
SELECT 
    EXTRACT(YEAR FROM V.Fecha) AS Anio,
    EXTRACT(QUARTER FROM V.Fecha) AS Trimestre,
    E.idEmpleado,
    COUNT(*) AS TotalVentas
FROM Venta V
INNER JOIN Empleado E ON V.idEmpleado = E.idEmpleado
GROUP BY Anio, Trimestre, E.idEmpleado
ORDER BY Anio, E.idEmpleado, Trimestre;


  
-- j) Misma información que el inciso anterior (i), pero solo interesan las ventas que estén por arriba de
-- $50,000,000.00.
SELECT 
    EXTRACT(YEAR FROM V.Fecha) AS Anio,
    EXTRACT(QUARTER FROM V.Fecha) AS Trimestre,
    E.idEmpleado,
    SUM(V.Cantidad * P.Precio) AS MontoTotalVentas
FROM Venta V
INNER JOIN Empleado E ON V.idEmpleado = E.idEmpleado
INNER JOIN Producto P ON V.numProducto = P.numProducto
GROUP BY Anio, Trimestre, E.idEmpleado
HAVING SUM(V.Cantidad * P.Precio) > 50000000.00
ORDER BY Anio, E.idEmpleado, Trimestre;

-- k)
-- Mostrar la información de la mayor compra, la menor compra, la compra promedio y el conteo de compras
-- realizadas en la tienda por año y trimestre. Mostrar la información ordenada.
SELECT 
  EXTRACT(YEAR FROM Fecha) AS Año, 
  EXTRACT(QUARTER FROM Fecha) AS Trimestre, 
  MAX(Cantidad) AS Mayor_Compra, 
  MIN(Cantidad) AS Menor_Compra, 
  AVG(Cantidad) AS Compra_Promedio, 
  COUNT(*) AS Conteo_Compras
FROM Venta
GROUP BY Año, Trimestre
ORDER BY Año, Trimestre;


-- l)
-- Mostrar por cada cliente y número de compra, la cantidad de productos que se solicitaron 
-- en la compra y el monto total pagado.
SELECT 
    Cliente.idCliente,
    Venta.numVenta,
    SUM(Venta.Cantidad) AS CantidadTotal,
    SUM(Producto.Precio * Venta.Cantidad) AS MontoTotalPagado
FROM Venta
INNER JOIN Cliente ON Venta.idCliente = Cliente.idCliente
INNER JOIN Producto ON Venta.numProducto = Producto.numProducto
GROUP BY Cliente.idCliente, Venta.numVenta;

-- m) Incrementa el precio de los productos en un 15%.
update producto
set precio = (precio * 0.15) + precio
returning *;




