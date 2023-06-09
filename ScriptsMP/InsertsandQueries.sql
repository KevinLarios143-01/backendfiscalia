use fiscalias;


INSERT INTO Paises (Nombre) VALUES ('GUATEMALA');
INSERT INTO Paises (Nombre) VALUES ('COSTA RICA');

INSERT INTO Departamentos (Nombre, PaisID) VALUES ('GUATEMALA', 1); -- Departamento 1 pertenece al Pa�s 1
INSERT INTO Departamentos (Nombre, PaisID) VALUES ('BAJA VERAPAZ', 1); -- Departamento 2 pertenece al Pa�s 1
INSERT INTO Departamentos (Nombre, PaisID) VALUES ('SAN JOS�', 2); -- Departamento 3 pertenece al Pa�s 2


INSERT INTO Municipios (Nombre, DepartamentoID) VALUES ('GUATEMALA', 1); -- Municipio 1 pertenece al Departamento 1
INSERT INTO Municipios (Nombre, DepartamentoID) VALUES ('MIXCO', 1); -- Municipio 2 pertenece al Departamento 1
INSERT INTO Municipios (Nombre, DepartamentoID) VALUES ('SAN JER�NIMO', 2); -- Municipio 3 pertenece al Departamento 2
INSERT INTO Municipios (Nombre, DepartamentoID) VALUES ('SAN JOS�', 3); -- Municipio 3 pertenece al Departamento 2

SELECT m.Nombre AS Municipio, d.Nombre AS Departamento, p.Nombre AS Pais
FROM Municipios m
JOIN Departamentos d ON m.DepartamentoID = d.DepartamentoID
JOIN Paises p ON d.PaisID = p.PaisID;




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


-- Insertar una fiscal�a
INSERT INTO Fiscalias (Nombre, UbicacionID)
VALUES ('Fiscal�a A', 1);

-- Insertar otra fiscal�a
INSERT INTO Fiscalias (Nombre, UbicacionID)
VALUES ('Fiscal�a B', 2);


-- Insertar tel�fonos para la fiscal�a 1
INSERT INTO TelefonosFiscalias (FiscaliaID, NumeroTelefono)
VALUES (1, '123-456-7890');

INSERT INTO TelefonosFiscalias (FiscaliaID, NumeroTelefono)
VALUES (1, '987-654-3210');

-- Insertar tel�fono para la fiscal�a 2
INSERT INTO TelefonosFiscalias (FiscaliaID, NumeroTelefono)
VALUES (2, '555-123-4567');




-- Insertar un registro en HistoricoUbicacionesFiscalias para la fiscal�a 1
INSERT INTO HistoricoUbicacionesFiscalias (FiscaliaID, UbicacionID, FechaFin)
VALUES (1, 1, '2022-12-31');

-- Insertar otro registro en HistoricoUbicacionesFiscalias para la fiscal�a 1 con fecha de inicio autom�tica
INSERT INTO HistoricoUbicacionesFiscalias (FiscaliaID, UbicacionID, FechaFin)
VALUES (1, 2, '2023-06-30');

-- Insertar un registro en HistoricoUbicacionesFiscalias para la fiscal�a 2
INSERT INTO HistoricoUbicacionesFiscalias (FiscaliaID, UbicacionID, FechaFin)
VALUES (2, 3, NULL);