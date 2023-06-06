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

CREATE TABLE Ubicaciones (
    ID INT IDENTITY(1,1) PRIMARY KEY,
	Direccion NVARCHAR(200) DEFAULT 'CIUDAD',
    Pais INT NOT NULL,
    Departamento INT NOT NULL,
    Municipio INT NOT NULL
	FOREIGN KEY (Pais) REFERENCES Paises(PaisID),
	FOREIGN KEY (Departamento) REFERENCES Departamentos(DepartamentoID),
	FOREIGN KEY (Municipio) REFERENCES Municipios(MunicipioID)
);


ALTER TABLE Ubicaciones
ADD FOREIGN KEY (Pais) REFERENCES Paises(PaisID);
ALTER TABLE Ubicaciones
ADD FOREIGN KEY (Departamento) REFERENCES Departamentos(DepartamentoID);
ALTER TABLE Ubicaciones
ADD FOREIGN KEY (Municipio) REFERENCES Municipios(MunicipioID);




-- Crear tabla Fiscalias
CREATE TABLE Fiscalias (
    FiscaliaID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    UbicacionID INT,
    FOREIGN KEY (UbicacionID) REFERENCES Ubicaciones(ID)
);


-- Crear tabla TelefonosFiscalias
CREATE TABLE TelefonosFiscalias (
    TelefonoID INT IDENTITY(1,1) PRIMARY KEY,
    FiscaliaID INT,
    NumeroTelefono NVARCHAR(20) NOT NULL,
    FOREIGN KEY (FiscaliaID) REFERENCES Fiscalias(FiscaliaID)
);

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


use fiscalias;

SELECT U.ID, U.Direccion, P.Nombre AS Pais, D.Nombre AS Departamento, M.Nombre AS Municipio
FROM Ubicaciones U
JOIN Paises P ON U.Pais = P.PaisID
JOIN Departamentos D ON U.Departamento = D.DepartamentoID
JOIN Municipios M ON U.Municipio = M.MunicipioID;



SELECT * FROM Ubicaciones;
SE

SELECT * FROM TelefonosFiscalias
WHERE NumeroTelefono='undefined';

DELETE FROM TelefonosFiscalias
WHERE TelefonoID in (4,5,6,7,8);