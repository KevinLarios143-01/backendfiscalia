CREATE PROCEDURE ActualizarUbicacionFiscalia
    @FiscaliaID INT,
    @NuevaUbicacionID INT
AS
BEGIN
    UPDATE Fiscalias
    SET UbicacionID = @NuevaUbicacionID
    WHERE FiscaliaID = @FiscaliaID
END