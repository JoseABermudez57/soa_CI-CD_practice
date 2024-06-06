const express = require('express');

const app = express();

app.get('/api/v1/welcome', (req, res) => {
    res.status(200).json({message: 'Hola Mundo'});
});

app.listen(3000, () => {
    console.log('API corriendo en el puerto 3000');
});

module.exports = app