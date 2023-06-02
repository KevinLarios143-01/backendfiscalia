const express = require('express');
const router = express.Router();
const executeQuery = require('../Database/db');



// Endpoint para insertar una fiscalía
router.post('/fiscalias', async (req, res) => {
    try {
      // Obtener los datos enviados en el cuerpo de la solicitud
      const { Nombre, UbicacionID } = req.body;
  
      // Ejecutar el procedimiento almacenado
      const query = `EXEC InsertarFiscalia @Nombre='${Nombre}', @UbicacionID=${UbicacionID}`;
      
  
      const results = await executeQuery(query);
      res.status(200).json({ message: 'Fiscalía insertada correctamente' });
    } catch (error) {
      console.error('Error al insertar la fiscalía:', error);
      res.status(500).json({ message: 'Error al insertar la fiscalía' });
    }
  });

  module.exports = router;