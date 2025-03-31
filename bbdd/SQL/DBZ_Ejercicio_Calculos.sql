DROP DATABASE IF EXISTS DBZ_Ejercicio_Calculos;
CREATE DATABASE IF NOT EXISTS DBZ_Ejercicio_Calculos;
USE DBZ_Ejercicio_Calculos;

CREATE TABLE IF NOT EXISTS guerreros(
    ID_guerrero INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) ,
    raza VARCHAR(50) ,
    nivel_poder INT,
    cantidad_transformaciones INT
);

INSERT IGNORE INTO guerreros (ID_guerrero, nombre, raza, nivel_poder, cantidad_transformaciones)
VALUES
(1, 'Goku', 'Saiyan' , 9000, 6),
(2, 'Vegeta', 'Saiyan', 8500, 4),
(3, 'Piccolo', 'Namekian', 7000, 1),
(4, 'Gohan', 'Saiyan', 8000, 4),
(5, 'Trunks', 'Saiyan', 7500, 2),
(6, 'Freezer', 'Emperador Del Mal', 10000, 5),
(7, 'Cell', 'Bio-Androide', 8500, 3),
(8, 'Majin Boo', 'Majin', 8000, 3),
(9, 'Goten', 'Saiyan', 6000, 1),
(10, 'Krilin', 'Humano', NULL, 0);


SELECT nombre, nivel_poder, cantidad_transformaciones, 
    CASE 
        WHEN nombre = 'Piccolo' THEN 'Orange Piccolo'
        WHEN nombre = 'Freezer' THEN 'Black Freezer'
        WHEN raza = 'Saiyan' AND cantidad_transformaciones > 0 THEN '!Super Saiyan¡'
        WHEN cantidad_transformaciones = 0 THEN 'Sin transformaciones'
        ELSE 'Transformado'
    END AS estado_transformacion
    FROM guerreros;


SELECT COUNT(*) AS total_guerreros
FROM guerreros;

SELECT SUM(nivel_poder) AS poder_total
FROM guerreros;

SELECT raza, MAX(nivel_poder) AS poder_maximo
FROM guerreros
GROUP BY raza
HAVING AVG(nivel_poder) > 8000;