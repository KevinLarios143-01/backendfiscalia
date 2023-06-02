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
EXEC GetFiscaliasConUbicacionDetallada;


CREATE TABLE Roles(
    id INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(20)
);