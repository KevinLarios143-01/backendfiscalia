const sql = require('mssql');

const config = {
  user: 'sa',
  password: 'exeltis',
  server: 'localhost',
  database: 'fiscalias',
  options: {
    encrypt: true,
    trustServerCertificate: true
  }
};

// Crear el objeto pool para la conexión a la base de datos
const pool = new sql.ConnectionPool(config);

// Conectar al servidor de base de datos
pool.connect((err) => {
  if (err) {
    console.log('Error al conectar con la base de datos:', err);
  } else {
    console.log('Conexión exitosa a la base de datos');
  }
});

module.exports = { pool, sql };