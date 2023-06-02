CREATE PROCEDURE InsertarFiscalia
    @Nombre NVARCHAR(100),
    @UbicacionID INT
AS
BEGIN
    INSERT INTO Fiscalias (Nombre, UbicacionID)
    VALUES (@Nombre, @UbicacionID)
END