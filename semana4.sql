-- ======================================================
-- CREAR BASE DE DATOS
-- ======================================================
IF DB_ID('Libreria') IS NOT NULL
    DROP DATABASE Libreria;
GO

CREATE DATABASE Libreria;
GO

USE Libreria;
GO

-- ======================================================
-- TABLAS (sin restricciones)
-- ======================================================

-- Tabla Autor
CREATE TABLE Autor (
    IdAutor INT,
    NombreAutor VARCHAR(150),
    Nacionalidad VARCHAR(100),
    FechaNacimiento DATE
);

-- Tabla Editorial
CREATE TABLE Editorial (
    IdEditorial INT,
    NombreEditorial VARCHAR(150),
    Pais VARCHAR(100)
);

-- Tabla Libro
CREATE TABLE Libro (
    IdLibro INT,
    Titulo VARCHAR(200),
    AnioPublicacion INT,
    IdEditorial INT
);

-- Tabla intermedia LibroAutor (relación N:M)
CREATE TABLE LibroAutor (
    IdLibro INT,
    IdAutor INT
);

-- ======================================================
-- Alterar las tablas
-- ======================================================

-- PRIMARY KEYS
ALTER TABLE Autor ADD PRIMARY KEY (IdAutor);
ALTER TABLE Editorial ADD PRIMARY KEY (IdEditorial);
ALTER TABLE Libro ADD PRIMARY KEY (IdLibro);
ALTER TABLE LibroAutor ADD PRIMARY KEY (IdLibro, IdAutor);

-- FOREIGN KEYS
ALTER TABLE Libro ADD FOREIGN KEY (IdEditorial) REFERENCES Editorial(IdEditorial);
ALTER TABLE LibroAutor ADD FOREIGN KEY (IdLibro) REFERENCES Libro(IdLibro);
ALTER TABLE LibroAutor ADD FOREIGN KEY (IdAutor) REFERENCES Autor(IdAutor);

-- ======================================================
-- VISTAS 
-- ======================================================

-- Vista entre libro y autor
CREATE VIEW Vista_LibroAutor AS
SELECT 
    L.Titulo,
    L.AnioPublicacion,
    A.NombreAutor
FROM Libro L, LibroAutor LA, Autor A
WHERE L.IdLibro = LA.IdLibro AND LA.IdAutor = A.IdAutor;
GO

-- Vista entre libro y editorial
CREATE VIEW Vista_LibroEditorial AS
SELECT 
    L.Titulo,
    L.AnioPublicacion,
    E.NombreEditorial,
    E.Pais
FROM Libro L, Editorial E
WHERE L.IdEditorial = E.IdEditorial;
GO

-- Vista para traer libros sin autor
CREATE VIEW Vista_LibrosSinAutor AS
SELECT 
    L.IdLibro,
    L.Titulo,
    L.AnioPublicacion
FROM Libro L
WHERE L.IdLibro NOT IN (SELECT IdLibro FROM LibroAutor);
GO

-- Vista para traer autores sin libros
CREATE VIEW Vista_AutoresSinLibros AS
SELECT 
    A.IdAutor,
    A.NombreAutor,
    A.Nacionalidad
FROM Autor A
WHERE A.IdAutor NOT IN (SELECT IdAutor FROM LibroAutor);
GO

-- Vista entre las tres tablas
CREATE VIEW Vista_LibroAutorEditorial AS
SELECT 
    L.Titulo AS Libro,
    L.AnioPublicacion,
    A.NombreAutor AS Autor,
    E.NombreEditorial AS Editorial,
    E.Pais AS PaisEditorial
FROM Libro L, LibroAutor LA, Autor A, Editorial E
WHERE L.IdLibro = LA.IdLibro 
  AND LA.IdAutor = A.IdAutor 
  AND L.IdEditorial = E.IdEditorial;
GO