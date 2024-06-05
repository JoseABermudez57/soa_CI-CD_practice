const express = require('express');

const app = express();

app.get('/api/v1/welcome', (req, res) => {
    res.send('Hola Mundo');
});

app.listen(3000, () => {
    console.log('La API está funcionando en el puerto 3000');
});