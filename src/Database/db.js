const sql = require("mssql");

// Configuración de conexión a SQL Server
const config = {
    user: 'sa',
    password: 'exeltis',
    server: 'localhost',
    database: 'fiscalias',
    options: {
        encrypt: true, // Si es necesario utilizar una conexión segura
        trustServerCertificate: true // Ignorar la validación del certificado
    }
};

// Función para realizar consultas a la base de datos
async function executeQuery(query) {
    try {
        // Establecer conexión a la base de datos
        await sql.connect(config);

        // Crear objeto Request
        const request = new sql.Request();

        // Ejecutar la consulta
        const result = await request.query(query);

        // Cerrar la conexión a la base de datos
        await sql.close();

        return result.recordset;
    } catch (error) {
        throw new Error('Error al ejecutar la consulta: ' + error.message);
    }
}

async function execStoreProcedure(storeProcedure, parameter) {

    try {
        // Crear una nueva instancia de SQL Server Connection
        const connection = new sql.ConnectionPool(config);

        // Conectar a la base de datos
        await connection.connect();

        // Crear un objeto de solicitud
        const request = new sql.Request(connection);

        // Configurar los parámetros del Stored Procedure
        request.input('Direccion', sql.NVarChar(200), direccion);
        request.input('Pais', sql.NVarChar(100), pais);
        request.input('Departamento', sql.NVarChar(100), departamento);
        request.input('Municipio', sql.NVarChar(100), municipio);

        // Ejecutar el Stored Procedure
        const result = await request.execute('InsertarUbicacion');

        // Obtener el ID de la ubicación insertada
        const ubicacionId = result.recordset[0].UbicacionID;

        res.send({ success: true, ubicacionId });
    } catch (error) {
        console.log(error);
        res.status(500).send('Error al insertar la ubicación');
    }
}



module.exports = executeQuery;