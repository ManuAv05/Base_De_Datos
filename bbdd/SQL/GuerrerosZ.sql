DROP DATABASE IF EXISTS GUERREROSZ;
CREATE DATABASE IF NOT EXISTS GUERREROSZ;
USE GUERREROSZ;

CREATE TABLE IF NOT EXISTS guerreros_z(
    ID_guerrero INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NombreGuerrero VARCHAR(50) ,
    Raza VARCHAR(50) ,
    Nivel_de_poder INT
);

INSERT IGNORE INTO guerreros_z (ID_guerrero, NombreGuerrero, Raza, Nivel_de_poder)
VALUES 
(1, 'Goku', 'Saiyajin', 9000),
(2, 'Vegeta', 'Saiyajin', 8000),
(3, 'Piccolo', 'Namekiano', 7000),
(4, 'Gohan', 'Saiyajin-mestizo', 6000),
(5, 'Yamcha', 'Humano', NULL );

SELECT COUNT(*) AS total_guerreros
FROM guerreros_z;

SELECT NombreGuerrero, Nivel_de_poder
FROM guerreros_z
WHERE Nivel_de_poder >= ALL (
    SELECT Nivel_de_poder
    FROM guerreros_z
    
);

SELECT raza, poder_medio
FROM (
    SELECT raza, AVG(Nivel_de_poder) AS poder_medio
    FROM guerreros_z
    WHERE Nivel_de_poder IS NOT NULL
    GROUP BY raza
) AS promedio_por_raza
WHERE poder_medio > 8000;