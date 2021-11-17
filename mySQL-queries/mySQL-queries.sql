USE tienda

--1 Lista el nombre de todos los productos que hay en la mesa producto.
SELECT nombre FROM tienda

--2 Lista los nombres y los precios de todos los productos de la mesa producto.
SELECT nombre, precio FROM producto;

--3 Lista todas las columnas de la tabla producto.
//TODO

--4 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
 SELECT 
	nombre, 
	precio, 
	precio * 1.14
 FROM producto;

--5 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes sobrenombre para las columnas: nombre de producto, euros, dólares.
SELECT 
	nombre AS "nombre_de_producto",
	precio AS euros, 
	precio * 1.14 AS dolares
 FROM producto;
 
--6 Lista los nombres y los precios de todos los productos de la mesa producto, convirtiendo los nombres a mayúscula.

SELECT 
	UPPER(nombre), 
	precio 
 FROM producto;

--7 Lista los nombres y los precios de todos los productos de la mesa producto, convirtiendo los nombres a minúscula.
SELECT 
	LOWER(nombre), 
	precio 
 FROM producto;

--8 Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT 
    nombre,
    UPPER(SUBSTR(nombre,1,2))
 FROM fabricante;

--9 Lista los nombres y los precios de todos los productos de la mesa producto, redondeando el valor del precio.
SELECT 
	nombre, 
	ROUND(precio, 0)
 FROM producto;

--10 Lista los nombres y precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT 
	nombre, 
    TRUNCATE(precio, 0),
 FROM producto;

--11 Lista el código de los fabricantes que tienen productos en la mesa producto.
--//TODO mirar este, no creo que este bien
SELECT codigo_fabricante
FROM fabricante
INNER JOIN producto 
	ON fabricante.codigo = producto.codigo_fabricante

--12 Lista el código de los fabricantes que tienen productos en la mesa producto, eliminando los códigos que aparecen repetidos.

SELECT DISTINCT codigo_fabricante
FROM fabricante
INNER JOIN producto 
	ON fabricante.codigo = producto.codigo_fabricante

--13 Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre
    FROM fabricante
    ORDER BY nombre 

14-- Lista los nombres de los fabricantes ordenados de forma descendente.

SELECT nombre
    FROM fabricante
    ORDER BY nombre DESC

--15 Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.

SELECT nombre, precio
    FROM producto
    ORDER BY nombre, precio DESC 

--16 Devuelve una lista con las 5 primeras filas de la mesa fabricante.
SELECT * FROM fabricante LIMIT 5

--17 Devuelve una lista con 2 filas a partir de la cuarta fila de la mesa fabricante. La cuarta fila también debe incluirse en la respuesta.
SELECT * FROM fabricante LIMIT 4,2

--18 Lista el nombre y precio del producto más barato. (Utilice solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podría usar MIN(precio), necesitaría GROUP BY //TODO ver que te esta pidiendo con group by
SELECT nombre, precio FROM producto
	ORDER BY precio
    LIMIT 1

--19 Lista el nombre y precio del producto más caro. (Utilice solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podría usar MAX(precio), necesitaría GROUP BY.
SELECT nombre, precio FROM producto
	ORDER BY precio DESC
    LIMIT 1

--20 Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre,precio, codigo_fabricante FROM producto
	WHERE codigo_fabricante = 2

--21 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

SELECT 
	producto.nombre AS producto_nombre, 
	precio, 
    fabricante.nombre AS fabricante_nombre
    FROM producto
    INNER JOIN fabricante 
	ON producto.codigo_fabricante = fabricante.codigo 

--22 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.

SELECT 
	producto.nombre AS producto_nombre, 
	precio, 
    fabricante.nombre AS fabricante_nombre
    FROM producto
    INNER JOIN fabricante 
	ON producto.codigo_fabricante = fabricante.codigo 
    ORDER BY fabricante.nombre

--23 Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.

SELECT
    producto.codigo,
	producto.nombre AS producto_nombre, 
	fabricante.codigo, 
    fabricante.nombre AS fabricante_nombre
    FROM producto
    INNER JOIN fabricante 
	ON producto.codigo_fabricante = fabricante.codigo 

--24 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT 
	producto.nombre AS producto_nombre, 
	precio,
    fabricante.nombre AS fabricante_nombre
    FROM producto
    INNER JOIN fabricante 
	ON producto.codigo_fabricante = fabricante.codigo 
	ORDER BY producto.precio
	LIMIT 1

--25 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

SELECT 
	producto.nombre AS producto_nombre, 
	precio,
    fabricante.nombre AS fabricante_nombre
    FROM producto
    INNER JOIN fabricante 
	ON producto.codigo_fabricante = fabricante.codigo 
	ORDER BY producto.precio DESC
	LIMIT 1

--26 Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT 
	producto.nombre AS producto_nombre
    FROM producto
    INNER JOIN fabricante 
	ON producto.codigo_fabricante = fabricante.codigo 
	WHERE fabricante.nombre = "Lenovo"

--27 Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

SELECT 
	producto.nombre AS producto_nombre,
	precio
    FROM producto
    INNER JOIN fabricante 
	ON producto.codigo_fabricante = fabricante.codigo 
	WHERE fabricante.nombre = "Lenovo" AND  precio > 200

--28 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.

SELECT 
	producto.nombre AS producto_nombre,
    fabricante.nombre AS fabricante_nombre
    FROM producto
    INNER JOIN fabricante 
	ON producto.codigo_fabricante = fabricante.codigo 
	WHERE fabricante.nombre = "Hewlett-Packard" OR fabricante.nombre = "Asus" OR fabricante.nombre = "Seagate"

--29 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Utilizando el operador IN.
SELECT 
	producto.nombre AS producto_nombre,
    fabricante.nombre AS fabricante_nombre
    FROM producto
    INNER JOIN fabricante 
	ON producto.codigo_fabricante = fabricante.codigo 
	WHERE fabricante.nombre IN ("Hewlett-Packard", "Asus", "Seagate")

--30 Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre acabe por la vocal e.
SELECT 
	producto.nombre AS producto_nombre,
    precio,
	fabricante.nombre AS fabricante_nombre
	FROM producto
	INNER JOIN fabricante 
	ON producto.codigo_fabricante = fabricante.codigo 
	WHERE fabricante.nombre LIKE "%e"

--31 Devuelve un listado con el nombre y precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT 
	producto.nombre AS producto_nombre,
    precio,
	fabricante.nombre AS fabricante_nombre
	FROM producto
	INNER JOIN fabricante 
	ON producto.codigo_fabricante = fabricante.codigo 
	WHERE fabricante.nombre LIKE "%w%"

--32 Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180 €. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

SELECT 
	producto.nombre AS producto_nombre,
	fabricante.nombre AS fabricante_nombre,
    precio
	FROM producto
	INNER JOIN fabricante 
	ON producto.codigo_fabricante = fabricante.codigo 
	WHERE precio >= 180
	ORDER BY precio DESC, producto.nombre  

--33 Devuelve un listado con el código y el nombre de fabricante, sólo de aquellos fabricantes que tienen productos asociados en la base de datos.

SELECT 	DISTINCT f.codigo,
	f.nombre AS fabricante_nombre
	FROM producto p
	INNER JOIN fabricante f 
	ON p.codigo_fabricante = f.codigo 

--34 Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también a aquellos fabricantes que no tienen productos asociados.

SELECT 
	p.nombre AS producto_nombre,
	f.nombre AS fabricante_nombre
	FROM fabricante f
	LEFT JOIN producto p  
	ON p.codigo_fabricante = f.codigo 



--35 Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.

SELECT 
	f.nombre
	FROM fabricante f
	LEFT JOIN producto p  
	ON p.codigo_fabricante = f.codigo
	WHERE p.nombre IS NULL 


--36 Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT 
	p.nombre AS producto_nombre,
	f.nombre
	FROM fabricante f
	LEFT JOIN producto p  
	ON p.codigo_fabricante = f.codigo
	WHERE f.nombre = "Lenovo" 



--37 Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).

//TODO

--38 Lista el nombre del producto más caro del fabricante Lenovo. 


SELECT 
	p.nombre AS producto_nombre
	FROM fabricante f
	LEFT JOIN producto p  
	ON p.codigo_fabricante = f.codigo
	WHERE f.nombre = "Lenovo"
	ORDER BY precio
    LIMIT 1



--39 Lista el nombre del producto más barato del fabricante Hewlett-Packard.

SELECT 
	p.nombre AS producto_nombre
	FROM fabricante f
	LEFT JOIN producto p  
	ON p.codigo_fabricante = f.codigo
	WHERE f.nombre = "Hewlett-Packard"
	ORDER BY precio DESC
    LIMIT 1


--40 Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
--41 Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.