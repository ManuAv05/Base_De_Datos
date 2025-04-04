-- Ejercicio 1
select * from 
producto where id_fabricante = 
(select id from fabricante where nombre = 'Lenovo');


-- EJercicio 2
select * from producto where precio = 
(select MAX(precio) from producto
where id_fabricante =
(select id from fabricante where nombre = 'Lenovo'));


-- Ejercicio 3
select nombre from producto
where precio =(select MAX(precio) from producto where id_fabricante = 
(select id from fabricante where nombre = 'Lenovo'));


--Ejercicio 4
select nombre from producto where precio =(
select MIN(precio) from producto where id_fabricante=(
select id from fabricante where nombre = 'Hewlett-Packard'));


-- Ejercicio 5
select * from producto where precio >= (
select MAX(precio) from producto where id_fabricante=(
select id from fabricante where nombre = 'Lenovo'));


-- Ejercicio 6
SELECT fabricante.id, fabricante.nombre, producto.id, producto.nombre, producto.precio, producto.id_fabricante
FROM producto  
JOIN fabricante ON producto.id_fabricante = fabricante.id  
WHERE producto.precio > (  
    SELECT AVG(precio)  
    FROM producto  
    WHERE id_fabricante = fabricante.id  
)  
AND fabricante.nombre = 'Asus';


