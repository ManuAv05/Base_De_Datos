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
