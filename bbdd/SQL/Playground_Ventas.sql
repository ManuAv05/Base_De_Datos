-- Ejercicio 1
select * from pedido
order by fecha desc;

-- Ejercicio 2
select * from pedido 
order by TOTAL desc
limit 2

-- Ejercicio 3
select distinct id_cliente from pedido

-- Ejercicio 4
select * from pedido
where YEAR(fecha) = 2017
and total > 500;

-- Ejercicio 5 
