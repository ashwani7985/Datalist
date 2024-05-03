const express = require('express')
const bodyParser = require('body-parser')
const app = express()
app.use(bodyParser.json())

const data2 = [
    {name:"anuj", addr:"GKP",username:"anuj1",pass:111},
    {name:"aman", addr:"PUG",username:"aman1",pass:222}]

    

app.get('/users/:username', (req,res)=>{
    const username = req.params.username;
    const user = data2.find(user => user.username === username)
    if(!user){
        res.end("error found")
    }
    res.json(user);
});

// app.get("/address/:myaddress", (req,res)=>{
//     res.end("address: "+req.params.myaddress)
// })

app.post("/register",(req,res)=>{
    res.json(data2)
})

app.post("/login",(req,res)=>{
    const body = req.body;
    const username = body.username;
    const pass = body.pass;

    if(!username && !pass)
       res.end("username and password required");
    
    const user=data2.find(user => user.username === username && user.pass === pass);
    if(!user){
       res.end("Invalid username and password");
    }
    res.json(user);
})

app.listen(8080, ()=>console.log("Application started!"))