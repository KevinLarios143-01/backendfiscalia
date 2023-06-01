const express = require('express');
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }));


const apiRouter = require('./routes/api');
const apiRouter2 = require('./routes/ubicaciones');



// Ruta base para las API
app.use('/api', apiRouter);

app.use('/', apiRouter2);

// Iniciar el servidor
app.listen(5000, () => {
    console.log('Servidor API iniciado en el puerto 5000');
});