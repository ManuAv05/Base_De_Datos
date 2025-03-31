DROP DATABASE IF EXISTS TORNEOSDB;
CREATE DATABASE IF NOT EXISTS TORNEOSDB;
USE TORNEOSDB;

CREATE TABLE Torneos (
    id_torneos INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL
);

CREATE TABLE Participantes(
    id_participantes INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    edad INT NOT NULL CHECK(edad >= 15 AND edad <= 150),
    raza VARCHAR(30) NOT NULL,
    idTorneo INT,
    FOREIGN KEY (idTorneo) REFERENCES Torneos(id_torneos)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO Torneos (nombre, ubicacion, fechaInicio, fechaFin)
VALUES 
('Torneo de Poder', 'Espacio', '2021-03-21', '2021-03-25'),
('Torneo de Poder', 'Espacio', '2021-03-21', '2021-03-25'),
('Torneo de Poder', 'Espacio', '2021-03-21', '2021-03-25');

INSERT INTO Participantes (nombre, edad, raza, idTorneo)
VALUES 
('Goku', 35, 'Saiyajin', 1),
('Vegeta', 35, 'Saiyajin', 1),
('Gohan', 18, 'Saiyajin', 1),
('Piccolo', 30, 'Namekiano', 1);
  