CREATE PROCEDURE ActualizarDatosFiscalia
    @FiscaliaID INT,
    @NuevoNombre NVARCHAR(100),
    @NuevaUbicacionID INT
AS
BEGIN
    UPDATE Fiscalias
    SET Nombre = @NuevoNombre,
        UbicacionID = @NuevaUbicacionID
    WHERE FiscaliaID = @FiscaliaID
END