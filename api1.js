const bodyParser = require('body-parser');
const express = require('express');
const { log_in, claims } = require('./db2/user');
const app = express()
const PORT = process.env.PORT || 3000;

//middlewares
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))

app.post("/login",async(req,res)=>{
    const body = req.body;
    const username = body.username;
    const pass = body.password;
    if(username === "aryan" && pass === 123)
        res.json({
            data:"success",
        })
    else
        res.end("Incorrect creds");
    })

app.listen(PORT, ()=>console.log(`Application listening on port ${PORT}!`))