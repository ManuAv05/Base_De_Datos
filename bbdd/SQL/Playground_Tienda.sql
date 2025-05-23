-- Consultas sencillas

-- Ejercicio 1
select nombre from producto;

-- Ejercicio 2
select nombre, precio from producto;

-- Ejercicio 3
select * from producto;

-- Ejercicio 4
select nombre, precio , precio * 1.15 from producto;

-- Ejercicio 5
select nombre as 'nombre de producto', precio as 'euros', precio * 1.15 as 'dólares' 
from producto;

-- Ejercicio 6
select upper(nombre), precio from producto;

-- Ejercicio 7
select lower(nombre), precio from producto;

-- Ejercicio 8
select nombre, upper(substr(nombre, 1, 2)) from fabricante;

-- Ejercicio 9 
select nombre, round(precio) from producto;

--Ejercicio 10
select nombre, TRUNCATE(precio, 0) from producto;

-- Ejercicio 11 
select id_fabricante from producto;

-- Ejercicio 12
select distinct id_fabricante from producto;

-- Ejercicio 13
select nombre from fabricante
order by nombre;

-- Ejercicio 14
select nombre from fabricante
order by nombre desc;

-- Ejercicio 15
select nombre, precio from producto 
order by nombre asc , precio desc;

--Ejercicio 16
select * from fabricante LIMIT 5;

-- Ejercicio 17
select * from fabricante limit 2 offset 3;

-- Ejercicio 18
select nombre, precio from producto 
order by precio asc LIMIT 1;

-- Ejercicio 19
select nombre, precio from producto 
order by precio desc LIMIT 1;

-- Ejercicio 20
select nombre from producto 
where id_fabricante = 2;

-- Ejercicio 21
select nombre from producto 
where precio <= 120;

-- Ejercicio 22
select nombre from producto 
where precio >= 400;

-- Ejercicio 23
select nombre from producto 
where not precio >= 400;

-- Ejercicio 24
select * from producto 
where precio >= 80 and precio <= 300;

-- Ejercicio 25
select * from producto 
where precio between 60 and 200;

-- Ejercicio 26 
select * from producto 
where precio > 200 and id_fabricante = 6;

-- Ejercicio 27
select * from producto 
where id_fabricante = 1 or id_fabricante = 3 or id_fabricante = 5;

-- Ejercicio 28
select * from producto
where id_fabricante in (1, 3 ,5);

-- Ejercicio 29
select nombre, precio * 100 as 'céntimos' from producto;

-- Ejercicio 30
select nombre from fabricante
where nombre LIKE 'S%';

-- EJercicio 31
select nombre from fabricante
where nombre LIKE '%E';

-- Ejercicio 32
select nombre from fabricante
where nombre LIKE '%W%';

-- Ejercicio 33
select nombre from fabricante 
where nombre LIKE '____';

-- Ejercicio 34
select nombre from producto 
where nombre LIKE 'Portátil';

-- Ejercicio 35
select nombre from producto 
where nombre LIKE '%Monitor%' and precio < 215;

-- Ejercicio 36
select nombre, precio from producto 
where precio >= 180
order by precio desc, nombre asc;









-- COMPOSICIÓN INTERNA

-- Ejercicio 1
select producto.nombre as 'nombre_producto' , producto.precio , fabricante.nombre as 'nombre_fabricante'
from producto
join fabricante ON producto.id_fabricante = fabricante.ID;

-- Ejercicio 2
select producto.nombre as 'nombre_producto' , producto.precio , fabricante.nombre as 'nombre_fabricante'
from producto
join fabricante ON producto.id_fabricante = fabricante.ID
order by fabricante.nombre asc;

-- Ejercicio 3
select producto.id as 'ID_producto',producto.nombre as 'nombre_producto' ,fabricante.ID as 'ID_fabricante', fabricante.nombre as 'nombre_fabricante' 
from producto
join fabricante ON producto.id_fabricante = fabricante.ID 

-- Ejercicio 4
select producto.nombre as 'nombre_producto' , producto.precio , fabricante.nombre as 'nombre_fabricante'
from producto
join fabricante ON producto.id_fabricante = fabricante.ID
order by producto.precio asc LIMIT 1;

-- Ejercicio 5
select producto.nombre as 'nombre_producto' , producto.precio , fabricante.nombre as 'nombre_fabricante'
from producto
join fabricante ON producto.id_fabricante = fabricante.ID
order by producto.precio desc LIMIT 1;

-- Ejercicio 6
select *
from producto
join fabricante ON producto.id_fabricante = fabricante.ID
where fabricante.nombre = 'Lenovo'

-- Ejercicio 7
select *
from producto
join fabricante ON producto.id_fabricante = fabricante.ID
where fabricante.nombre = 'Crucial' and producto.precio > 200;

-- Ejercicio 8
select *
from producto
join fabricante ON producto.id_fabricante = fabricante.ID
where fabricante.nombre = 'Asus' or fabricante.nombre ='Hewlett-Packard' or  fabricante.nombre ='Seagate';

-- Ejercicio 9
select *
from producto
join fabricante ON producto.id_fabricante = fabricante.ID
where fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- Ejercicio 10
select *
from producto
join fabricante ON producto.id_fabricante = fabricante.ID
where fabricante.nombre LIKE '%e';

-- Ejercicio 11
select *
from producto
join fabricante ON producto.id_fabricante = fabricante.ID
where fabricante.nombre LIKE '%w%';

-- Ejercicio 12
select *
from producto
join fabricante ON producto.id_fabricante = fabricante.ID
where producto.precio >= 180
order by producto.precio desc , producto.nombre asc;

-- Ejercicio 13
SELECT distinct
  fabricante.ID,
  fabricante.nombre
FROM
  fabricante
JOIN
  producto ON fabricante.ID = producto.id_fabricante;

-- COMPOSICIÓN EXTERNA
-- Ejercicio 1
SELECT distinct * from fabricante 
left join producto ON producto.id_fabricante = fabricante.id;

-- Ejercicio 2
SELECT distinct * from fabricante 
left join producto ON producto.id_fabricante = fabricante.id
where producto.id is null;  


-- SUBCONSULTAS
-- Ejercicio 1
select * from producto where id_fabricante=
(select id from fabricante where nombre = 'Lenovo');

-- Ejercicio 2
select * from producto where precio =
(select MAX(precio) from producto where id_fabricante =
(select id from fabricante where nombre = 'Lenovo'));

-- Ejercicio 3
select nombre from producto where precio =
(select MAX(precio) from producto where id_fabricante =
(select id from fabricante where nombre = 'Lenovo'));

-- Ejercicio 4
select nombre from producto where precio =
(select MIN(precio) from producto where id_fabricante =
(select id from fabricante where nombre = 'Hewlett-Packard'));

-- Ejercicio 5
select * from producto where precio >=
(select MAX(precio) from producto where id_fabricante =
(select id from fabricante where nombre = 'Lenovo'));

-- Ejercicio 6
select * from producto where id_fabricante =(
    select id from fabricante where nombre ='Asus'
)
AND precio >
(select AVG(precio) from producto where id_fabricante = 
(select id from fabricante where nombre ='Asus'));

-- Ejercicio 7
SELECT *
FROM producto p1
WHERE NOT EXISTS (
    SELECT 1
    FROM producto p2
    WHERE p2.precio > p1.precio
);

-- Ejercicio 8
SELECT *
FROM producto p1
WHERE NOT EXISTS (
    SELECT 1
    FROM producto p2
    WHERE p2.precio < p1.precio
);

-- Ejercicio 9
select nombre from fabricante where id = ANY 
(select id_fabricante from producto);

-- Ejercicio 10
select nombre from fabricante where id != ALL 
(select id_fabricante from producto);

-- Ejercicio 11
select nombre from fabricante where id in
(select id_fabricante from producto);

-- Ejercicio 12
select nombre from fabricante where id  not in
(select id_fabricante from producto);

-- Ejercicio 13
SELECT nombre
FROM fabricante f
WHERE EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.id_fabricante = f.id
);

-- Ejercicio 14
SELECT nombre
FROM fabricante f
WHERE NOT EXISTS (
    SELECT 1
    FROM producto p
    WHERE p.id_fabricante = f.id
);

-- Ejercicio 15
SELECT producto.nombre AS nombre_producto, 
       producto.precio, 
       fabricante.nombre AS nombre_fabricante
FROM producto
JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE producto.precio = (
    SELECT MAX(p.precio)
    FROM producto p
    WHERE p.id_fabricante = fabricante.id
);

-- Ejercicio 16 No se

-- Ejercicio 17 
select nombre from producto where precio=
(select MAX(precio) from producto where id_fabricante=
(select id from fabricante where nombre='Lenovo'));


-- Ejercicio 18 
SELECT f.nombre AS nombre_fabricante
FROM fabricante f
WHERE (
    SELECT COUNT(producto.id)
    FROM producto 
    WHERE producto.id_fabricante = f.id
) = (
    SELECT COUNT(producto.id)
    FROM producto 
    JOIN fabricante  ON producto.id_fabricante = fabricante.id
    WHERE fabricante.nombre = 'Lenovo'
);



-- CONSULTAS RESUMEN

-- Ejercicio 1
select count(*)
from producto;

-- Ejercicio 2
select count(*)
from fabricantes;

-- Ejercicio 3
select count( distinct id_fabricante) from producto;

-- Ejercicio 4
select AVG(precio) from producto;

-- Ejercicio 5
select MIN(precio) from producto;

-- Ejercicio 6
select MAX(precio) from producto;

-- Ejercicio 7
SELECT nombre, precio
FROM producto
ORDER BY precio ASC
LIMIT 1;

-- Ejercicio 8
SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1;

-- Ejercicio 9
select SUM(precio) from producto;

-- Ejercicio 10
select COUNT(producto.id_fabricante) from producto 
where id_fabricante = 
(select id from fabricante where nombre ='Asus');

-- Ejercicio 11
select AVG(precio) from producto 
where id_fabricante = 
(select id from fabricante where nombre ='Asus');

-- Ejercicio 12
select MIN(precio) from producto 
where id_fabricante = 
(select id from fabricante where nombre ='Asus');

-- Ejercicio 13
select MAX(precio) from producto 
where id_fabricante = 
(select id from fabricante where nombre ='Asus');

-- Ejercicio 14
select SUM(precio) from producto 
where id_fabricante = 
(select id from fabricante where nombre ='Asus');

-- Ejercicio 15
select MAX(precio), MIN(precio), AVG(precio), COUNT(*) from producto 
where id_fabricante = 
(select id from fabricante where nombre ='Crucial');

-- Ejercicio 16
select fabricante.nombre, COUNT(producto.id) as numero_productos
from fabricante
LEFT JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY nombre
ORDER BY numero_productos DESC;

-- Ejercicio 17
select fabricante.nombre, MAX(producto.precio), MIN(producto.precio), AVG(producto.precio)
from fabricante
right JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY nombre;

-- Ejercicio 18


