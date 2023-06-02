
CREATE PROCEDURE InsertarUbicacion
    @Direccion NVARCHAR(200),
    @Pais NVARCHAR(100),
    @Departamento NVARCHAR(100),
    @Municipio NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar la nueva ubicaci�n
    INSERT INTO Ubicaciones (Direccion, Pais, Departamento, Municipio)
    VALUES (@Direccion, @Pais, @Departamento, @Municipio);

    -- Obtener el ID de la ubicaci�n insertada
    DECLARE @UbicacionID INT;
    SET @UbicacionID = SCOPE_IDENTITY();

    -- Devolver el ID de la ubicaci�n insertada
    SELECT @UbicacionID AS UbicacionID;
END