const express = require('express');
const { pool,sql } = require('../Database/db2');

const router = express.Router();



router.post('/ubicaciones', async (req, res) => {
  try {
    const Direccion= req.body.Direccion  ;
    const Pais= req.body.Pais ;
    const Departamento = req.body.Departamento;
    const Municipio  = req.body.Municipio;

    const request = pool.request();

    request.input('Direccion', sql.NVarChar(200), Direccion);
    request.input('Pais', sql.Int, Pais);
    request.input('Departamento', sql.Int, Departamento);
    request.input('Municipio', sql.Int, Municipio);


    const result = await request.execute('InsertarUbicacion');
    const ubicacionId = result.recordset[0].UbicacionID;

    res.send({ success: true, ubicacionId });
  } catch (error) {
    console.log(error);
    res.status(500).send('Error al insertar la ubicación');
  }
});

module.exports = router;