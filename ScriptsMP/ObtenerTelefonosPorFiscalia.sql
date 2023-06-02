CREATE PROCEDURE ObtenerTelefonosPorFiscalia
    @FiscaliaID INT
AS
BEGIN
    SELECT TelefonoID, NumeroTelefono
    FROM TelefonosFiscalias
    WHERE FiscaliaID = @FiscaliaID
END