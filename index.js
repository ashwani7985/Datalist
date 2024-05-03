const express = require('express')
const bodyParser = require('body-parser')
const app = express()
app.use(bodyParser.json())

app.get("/",(req, res)=>{
    res.end("Hello world")
})

app.get("/about",(req,res)=>{
    res.end("Welcome  to about page")

})
//http://localhost:8080/name/Ashwani
app.get("/name/:myname",(req,res)=>{
    res.end("Welcome "+req.params.myname)
})

//POST Request

app.post("/login",(req,res)=>{
    const body = req.body;
    const username = body.username;
    const pass = body.pass;

    if(username==="Ashwani" && pass === 123)
       res.end("Logged in successfully")
    else
       res.end("Incorrect creds")
})

app.listen(8080, ()=>console.log("Application started"))