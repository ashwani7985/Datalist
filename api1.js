const bodyParser = require('body-parser');
const express = require('express');
const { log_in, claims } = require('./db2/user');
const app = express()
const PORT = process.env.PORT || 3000;

//middlewares
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))

app.listen(PORT, ()=>console.log(`Application listening on port ${PORT}!`))