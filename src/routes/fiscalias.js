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

// Endpoint para Actualizar ubicación de una fiscalía
router.put('/fiscaliasu/:fiscaliaID', async (req, res) => {
  try {
     // Obtener el ID de la fiscalía y la nueva ubicación de los parámetros de la URL y el cuerpo de la solicitud
     const  fiscaliaID  = req.params.fiscaliaID;
     const nuevaUbicacionID = req.body.nuevaUbicacionID;
    // Ejecutar el procedimiento almacenado
    const query = `EXEC ActualizarUbicacionFiscalia @FiscaliaID=${fiscaliaID}, @NuevaUbicacionID=${nuevaUbicacionID}`;
    const results = await executeQuery(query);
    res.status(200).json({ message: 'Ubicación de fiscalía actualizada correctamente' });
  } catch (error) {
    console.error('Error al actualizar la ubicación de la fiscalía:', error);
    res.status(500).json({ message: 'Error al actualizar la ubicación de la fiscalía' });
  }
});
// Endpoint para actualizar los datos de una fiscalía
router.put('/fiscalias/:fiscaliaID', async (req, res) => {
  try {
    // Obtener el ID de la fiscalía y los nuevos datos del cuerpo de la solicitud
    const { fiscaliaID } = req.params;
    // Obtener el ID de la fiscalía y la nueva ubicación de los parámetros de la URL y el cuerpo de la solicitud
    const { nuevoNombre, nuevaUbicacionID } = req.body;
    // Ejecutar el procedimiento almacenado
    const query = `EXEC ActualizarDatosFiscalia @FiscaliaID=${fiscaliaID}, @NuevoNombre='${nuevoNombre}', @NuevaUbicacionID=${nuevaUbicacionID}`;
    const results = await executeQuery(query);
    res.status(200).json({ message: 'Datos de fiscalía actualizados correctamente' });
  } catch (error) {
    console.error('Error al actualizar los datos de la fiscalía:', error);
    res.status(500).json({ message: 'Error al actualizar los datos de la fiscalía' });
  }
});


  module.exports = router;