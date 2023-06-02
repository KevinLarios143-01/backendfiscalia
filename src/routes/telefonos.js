const express = require('express');
const router = express.Router();
const executeQuery = require('../Database/db');


  
  
  // Endpoint para insertar una Telefonofiscalía
  router.post('/telefonos', async (req, res) => {
    try {
      // Obtener los datos enviados en el cuerpo de la solicitud
      const { fiscaliaID, numeroTelefono} = req.body;
  
      // Ejecutar el procedimiento almacenado
      const query = `EXEC InsertarTelefonoFiscalia @fiscaliaID='${fiscaliaID}', @numeroTelefono=${numeroTelefono}`;
      
  
      const results = await executeQuery(query);
      res.status(200).json({ message: 'Telefono insertado correctamente' });
    } catch (error) {
      console.error('Error al insertar el telefono:', error);
      res.status(500).json({ message: 'Error al insertar el telefono' });
    }
  });

  // Endpoint para obtener los teléfonos de una fiscalía
router.get('/telefonos/:fiscaliaID', async (req, res) => {
  try {
    // Obtener el ID de la fiscalía de los parámetros de la URL
    const { fiscaliaID } = req.params;
      // Ejecutar el procedimiento almacenado
      const query = `EXEC ObtenerTelefonosPorFiscalia @FiscaliaID=${fiscaliaID}`;
      
      const results = await executeQuery(query);
      res.send(results);

  } catch (error) {
    console.log(error);
    res.status(500).send('Error al obtener las fiscalias');
}
});



  module.exports = router;
  