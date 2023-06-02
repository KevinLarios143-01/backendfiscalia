const express = require('express');
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));


const apiRouter = require('./routes/api');
const apiRouter2 = require('./routes/ubicaciones');
const apiRouter3 = require('./routes/fiscalias');




// Ruta base para las API
app.use('/api', apiRouter);

app.use('/api', apiRouter2);

app.use('/api', apiRouter3);

// Iniciar el servidor
app.listen(5000, () => {
    console.log('Servidor API iniciado en el puerto 5000');
});