CREATE PROCEDURE InsertarTelefonoFiscalia
    @FiscaliaID INT,
    @NumeroTelefono NVARCHAR(20)
AS
BEGIN
    INSERT INTO TelefonosFiscalias (FiscaliaID, NumeroTelefono)
    VALUES (@FiscaliaID, @NumeroTelefono)
END