const bodyParser = require('body-parser');
const express = require('express');
const { log_in, claims } = require('./db2/user');
const app = express()
const PORT = process.env.PORT || 3000;

//middlewares
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))

app.post("/login",async(req,res)=>{
    // const body = req.body;
    const{email, password} = req.body
    
    // const login = await log_in.create({
    //     email : email,
    //     password : password,
    // })
    
    const user = await log_in.findOne({email});
   
    // login ? res.status(201).json({msg:"Success",data:login}) : res.status(500).json({msg:"Error", data:login})
if(user){
    if(password === user.password){
        res.json({email:user.email, password: user.password});
    }else{
        res.status(401).json({error:'invalid password'});
    }
}else{
        res.status(404).json({error:'User not found'});
    }
    });

app.listen(PORT, ()=>console.log(`Application listening on port ${PORT}!`))