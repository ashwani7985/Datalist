const bodyParser = require('body-parser');
const express = require('express');
const register = require('./db3/user');
const app = express()
const PORT = process.env.PORT || 3000;

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))

app.get("/hello", (req, res) => {
    res.end("Hello world , Hello Everyone")
})

app.get("/detail/:vin",(req,res)=>{
    const vin = req.params.vin
    const user = register.find({vin})
   user ? res.status(200).json({msg: "Success", data: user}): 
   res.status(500).json({msg: "Error", data: user})
})

app.post("/login",async(req,res)=>{
    const body = req.body;
    const username = body.username;
    const pass = body.pass;
    if(username === "aryan" && pass === 123)
        res.json({
            data:"success",
        })
    else
        res.end("Incorrect creds");
    })



app.post('/register',async(req,res)=>{
    const{vName, vYear, color, vin, ownerName, address, mobileNum} = req.body
    const register1 = await register.create({
        vName:vName,
        vYear:vYear,
        color:color,
        vin:vin,
        ownerName:ownerName,
        address: address,
        mobileNum:mobileNum,
    })
    res.json(register1)
})


// app.get("/details/:vin",async(req,res)=>{
//     const vin = req.params.vin
//     const user = await register.findOne({vin})
//     if(user){
//             if(vin === user.vin){
//                 res.json({
//                     vName:user.vName,
//                     vYear: user.vYear,
//                     color:user.color,
//                     vin:user.vin,
//                     ownerName:user.ownerName,
//                     address: user.address,
//                     mobileNum:user.mobileNum});
//             }else{
//                 res.status(401).json({error:'invalid password'});
//             }
//         }else{
//                 res.status(404).json({error:'User not found'});
//             }
// })
   
    // login ? res.status(201).json({msg:"Success",data:login}) : res.status(500).json({msg:"Error", data:login})

//     const user = await register.findOne({vin});
// if(user){
//     if(vin === user.vin){
//         res.json({
//             vName:user.vName,
//             vYear: user.vYear,
//             color:user.color,
//             vin:user.vin,
//             ownerName:user.ownerName,
//             address: user.address,
//             mobileNum:user.mobileNum});
//     }else{
//         res.status(401).json({error:'invalid password'});
//     }
// }else{
//         res.status(404).json({error:'User not found'});
//     }
//     });

app.listen(PORT, ()=>console.log(`Application listening on port ${PORT}!`))