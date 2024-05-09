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

    const login = await log_in.create({
        username : body.username,
        pass : body.password,
    })
    
    // login ? res.status(201).json({msg:"Success",data:login}) : res.status(500).json({msg:"Error", data:login})

    if(username === "aryan" && pass === 123)
        res.json({
            data:login,
        })
    else
        res.end("Incorrect creds");
    })

app.listen(PORT, ()=>console.log(`Application listening on port ${PORT}!`))