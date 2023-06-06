const express = require('express');
const router = express.Router();
const executeQuery = require('../Database/db');

// Ruta GET "/"
router.get('/', async (req, res) => {
    try {
        const query = 'SELECT * FROM Fiscalias';
        const results = await executeQuery(query);
        res.send(results);
    } catch (error) {
        res.status(500).send('Error al obtener las fiscalias');
    }
});

// Ruta GET "/"
router.get('/paises', async (req, res) => {
    try {
        const query = 'SELECT * FROM Paises';
        const results = await executeQuery(query);
        res.send(results);
    } catch (error) {
        res.status(500).send('Error al obtener los Paises');
    }
});
// Ruta GET "/"
router.get('/departamentos', async (req, res) => {
    try {
        const query = 'SELECT * FROM Departamentos';
        const results = await executeQuery(query);
        res.send(results);
    } catch (error) {
        res.status(500).send('Error al obtener los Departamentos');
    }
});

// Ruta GET "/"
router.get('/municipios', async (req, res) => {
    try {
        const query = 'SELECT * FROM Municipios';
        const results = await executeQuery(query);
        res.send(results);
    } catch (error) {
        res.status(500).send('Error al obtener los Municipios');
    }
});

// Ruta GET "/"
router.get('/ubicacionesD', async (req, res) => {
    try {
        const query = 'SELECT * FROM Ubicaciones';
        const results = await executeQuery(query);
        res.send(results);
    } catch (error) {
        res.status(500).send('Error al obtener las Ubicaciones');
    }
});





// Ruta GET "/"
router.get('/ubicaciones', async (req, res) => {
    try {
        const query = `SELECT U.ID, U.Direccion, P.Nombre AS Pais, D.Nombre AS Departamento, M.Nombre AS Municipio 
                        FROM Ubicaciones U 
                        JOIN Paises P ON U.Pais = P.PaisID 
                        JOIN Departamentos D ON U.Departamento = D.DepartamentoID 
                        JOIN Municipios M ON U.Municipio = M.MunicipioID; `;

        const results = await executeQuery(query);
        res.send(results);
    } catch (error) {
        res.status(500).send('Error al obtener las fiscalias');
    }
});


router.get('/fis', async (req, res) => {
    try {
        const query = 'EXEC GetFiscaliasConUbicacionDetallada';

        // Ejecutar el Stored Procedure

        const results = await executeQuery(query);
        res.send(results);
    } catch (error) {
        console.log(error);
        res.status(500).send('Error al obtener las fiscalias');
    }
});



module.exports = router;