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
router.get('/ubicaciones', async (req, res) => {
    try {
        const query = 'SELECT * FROM Ubicaciones';
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