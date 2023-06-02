create database fiscalias;

use fiscalias;



CREATE TABLE Paises (
    PaisID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL
);


CREATE TABLE Departamentos (
    DepartamentoID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    PaisID INT NOT NULL,
    FOREIGN KEY (PaisID) REFERENCES Paises(PaisID)
);

CREATE TABLE Municipios (
    MunicipioID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    DepartamentoID INT NOT NULL,
    FOREIGN KEY (DepartamentoID) REFERENCES Departamentos(DepartamentoID)
);

INSERT INTO Paises (Nombre) VALUES ('GUATEMALA');
INSERT INTO Paises (Nombre) VALUES ('COSTA RICA');

INSERT INTO Departamentos (Nombre, PaisID) VALUES ('GUATEMALA', 1); -- Departamento 1 pertenece al País 1
INSERT INTO Departamentos (Nombre, PaisID) VALUES ('BAJA VERAPAZ', 1); -- Departamento 2 pertenece al País 1
INSERT INTO Departamentos (Nombre, PaisID) VALUES ('SAN JOSÉ', 2); -- Departamento 3 pertenece al País 2


INSERT INTO Municipios (Nombre, DepartamentoID) VALUES ('GUATEMALA', 1); -- Municipio 1 pertenece al Departamento 1
INSERT INTO Municipios (Nombre, DepartamentoID) VALUES ('MIXCO', 1); -- Municipio 2 pertenece al Departamento 1
INSERT INTO Municipios (Nombre, DepartamentoID) VALUES ('SAN JERÓNIMO', 2); -- Municipio 3 pertenece al Departamento 2
INSERT INTO Municipios (Nombre, DepartamentoID) VALUES ('SAN JOSÉ', 3); -- Municipio 3 pertenece al Departamento 2



SELECT m.Nombre AS Municipio, d.Nombre AS Departamento, p.Nombre AS Pais
FROM Municipios m
JOIN Departamentos d ON m.DepartamentoID = d.DepartamentoID
JOIN Paises p ON d.PaisID = p.PaisID;




CREATE TABLE Ubicaciones (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Pais NVARCHAR(100) NOT NULL,
    Departamento NVARCHAR(100) NOT NULL,
    Municipio NVARCHAR(100) NOT NULL
);
-- Modificar tabla Ubicaciones
ALTER TABLE Ubicaciones
ADD Direccion NVARCHAR(200) DEFAULT 'CIUDAD';

INSERT INTO Ubicaciones (Pais, Departamento, Municipio) VALUES (1, 1, 1);
INSERT INTO Ubicaciones (Pais, Departamento, Municipio) VALUES (1, 2, 3);
INSERT INTO Ubicaciones (Pais, Departamento, Municipio) VALUES (2, 3, 4);


SELECT u.ID, u.Pais, u.Departamento, u.Municipio, p.Nombre AS NombrePais, d.Nombre AS NombreDepartamento, m.Nombre AS NombreMunicipio
FROM Ubicaciones u
JOIN Paises p ON u.Pais = p.PaisID
JOIN Departamentos d ON u.Departamento = d.DepartamentoID
JOIN Municipios m ON u.Municipio = m.MunicipioID;


SELECT u.Pais, u.Departamento, u.Municipio, p.Nombre AS NombrePais, d.Nombre AS NombreDepartamento, m.Nombre AS NombreMunicipio
FROM Ubicaciones u
JOIN Paises p ON u.Pais = p.PaisID
JOIN Departamentos d ON u.Departamento = d.DepartamentoID
JOIN Municipios m ON u.Municipio = m.MunicipioID;


-- Crear tabla Fiscalias
CREATE TABLE Fiscalias (
    FiscaliaID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    UbicacionID INT,
    FOREIGN KEY (UbicacionID) REFERENCES Ubicaciones(ID)
);


-- Insertar una fiscalía
INSERT INTO Fiscalias (Nombre, UbicacionID)
VALUES ('Fiscalía A', 1);

-- Insertar otra fiscalía
INSERT INTO Fiscalias (Nombre, UbicacionID)
VALUES ('Fiscalía B', 2);

-- Crear tabla TelefonosFiscalias
CREATE TABLE TelefonosFiscalias (
    TelefonoID INT IDENTITY(1,1) PRIMARY KEY,
    FiscaliaID INT,
    NumeroTelefono NVARCHAR(20) NOT NULL,
    FOREIGN KEY (FiscaliaID) REFERENCES Fiscalias(FiscaliaID)
);

-- Insertar teléfonos para la fiscalía 1
INSERT INTO TelefonosFiscalias (FiscaliaID, NumeroTelefono)
VALUES (1, '123-456-7890');

INSERT INTO TelefonosFiscalias (FiscaliaID, NumeroTelefono)
VALUES (1, '987-654-3210');

-- Insertar teléfono para la fiscalía 2
INSERT INTO TelefonosFiscalias (FiscaliaID, NumeroTelefono)
VALUES (2, '555-123-4567');

-- Crear tabla HistoricoUbicacionesFiscalias
CREATE TABLE HistoricoUbicacionesFiscalias (
    HistoricoID INT IDENTITY(1,1) PRIMARY KEY,
    FiscaliaID INT,
    UbicacionID INT,
    FechaInicio DATETIME DEFAULT GETDATE(),
    FechaFin DATE,
    FOREIGN KEY (FiscaliaID) REFERENCES Fiscalias(FiscaliaID),
    FOREIGN KEY (UbicacionID) REFERENCES Ubicaciones(ID)
);


-- Insertar un registro en HistoricoUbicacionesFiscalias para la fiscalía 1
INSERT INTO HistoricoUbicacionesFiscalias (FiscaliaID, UbicacionID, FechaFin)
VALUES (1, 1, '2022-12-31');

-- Insertar otro registro en HistoricoUbicacionesFiscalias para la fiscalía 1 con fecha de inicio automática
INSERT INTO HistoricoUbicacionesFiscalias (FiscaliaID, UbicacionID, FechaFin)
VALUES (1, 2, '2023-06-30');

-- Insertar un registro en HistoricoUbicacionesFiscalias para la fiscalía 2
INSERT INTO HistoricoUbicacionesFiscalias (FiscaliaID, UbicacionID, FechaFin)
VALUES (2, 3, NULL);

update Ubicaciones
set Direccion='Ciudad';


SELECT
    f.Nombre AS Fiscalia,
    u.Direccion AS Direccion,
    p.Nombre AS Pais,
    d.Nombre AS Departamento,
    m.Nombre AS Municipio
FROM
    Fiscalias f

JOIN
    Ubicaciones u ON f.UbicacionID = u.ID
JOIN
    Paises p ON u.Pais = p.PaisID
JOIN
    Departamentos d ON u.Departamento = d.DepartamentoID
JOIN
    Municipios m ON u.Municipio = m.MunicipioID
ORDER BY
    f.Nombre ASC;


-- Crear el Stored Procedure GetFiscaliasConUbicacionDetallada
CREATE PROCEDURE GetFiscaliasConUbicacionDetallada
AS
BEGIN
	SELECT
		f.Nombre AS Fiscalia,
		u.Direccion AS Direccion,
		p.Nombre AS Pais,
		d.Nombre AS Departamento,
		m.Nombre AS Municipio
	FROM
		Fiscalias f

	JOIN
		Ubicaciones u ON f.UbicacionID = u.ID
	JOIN
		Paises p ON u.Pais = p.PaisID
	JOIN
		Departamentos d ON u.Departamento = d.DepartamentoID
	JOIN
		Municipios m ON u.Municipio = m.MunicipioID
	ORDER BY
		f.Nombre ASC;

END;