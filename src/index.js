const express = require('express');
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));


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