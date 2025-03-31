CREATE DATABASE IF NOT EXISTS CABALLEROSDELZODIACO;
USE CABALLEROSDELZODIACO;

CREATE TABLE IF NOT EXISTS  Constelaciones(
    ID_constelacion INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NombreConstelacion VARCHAR(50) ,
    Descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Caballeros_Del_Zodiaco (
    ID_Caballero INT PRIMARY KEY NOT NULL ,
    Nombre VARCHAR(50) ,
    SignoZodiacal VARCHAR(50) ,
    ID_constelacion INT NOT NULL,
    FOREIGN KEY (ID_constelacion) REFERENCES Constelaciones(ID_constelacion)
);

INSERT IGNORE INTO Constelaciones (ID_constelacion, NombreConstelacion, Descripcion)
VALUES 
(1, 'Pegaso', 'Constelacion de Pegaso'),
(2, 'Dragon', 'Constelacion de Dragon'),
(3, 'Cisne', 'Constelacion de Cisne'),
(4, 'Andromeda', 'Constelacion de Andromeda');


INSERT IGNORE INTO Caballeros_Del_Zodiaco (ID_Caballero, Nombre, SignoZodiacal, ID_constelacion)
VALUES 
(1, 'Seiya', 'Pegaso', 1),   -- Pegaso tiene ID 1
(2, 'Shiryu', 'Dragon', 2),  -- Dragón tiene ID 2
(3, 'Hyoga', 'Cisne', 3),    -- Cisne tiene ID 3
(4, 'Shun', 'Andromeda', 4); -- Andrómeda tiene ID 4



