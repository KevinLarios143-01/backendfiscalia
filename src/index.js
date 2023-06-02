const express = require('express');
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
// Middleware para habilitar CORS
app.use(function (req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*'); // Reemplaza * con la URL permitida en producción
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    next();
});

const apiRouter = require('./routes/api');
const ubicaciones = require('./routes/ubicaciones');
const fiscalias = require('./routes/fiscalias');
const telefonos = require('./routes/telefonos');




// Ruta base para las API
app.use('/api', apiRouter);
app.use('/api', ubicaciones);
app.use('/api', fiscalias);
app.use('/api', telefonos);

// Iniciar el servidor
app.listen(5000, () => {
    console.log('Servidor API iniciado en el puerto 5000');
});