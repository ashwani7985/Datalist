require('dotenv').config();
const bodyParser = require('body-parser');
const express = require('express');
const { default: mongoose }= require('mongoose');
const app = express();
const conn = process.env.CONN;

app.use(bodyParser.json());

mongoose.connect(conn)
.then(()=>console.log('connected'))
.catch(()=> console.log('Error'))  

const demoSchema = new mongoose.Schema({
    todo_id:{
        type:Number,
        required:true
    },
    todo_title:{
        type:String
    },
    todo_desc:{
        type:String
    },
    time:{
        type:String
    }
})

// const demoSchema = new mongoose.Schema({
//     name:{
//         type:String,
//         required:true
//     },
//     age:{
//         type:Number
//     },
//     salary:{
//         type:Number
//     },
//     email:{
//         type: String,
//         required:true
//     }
// })

const user = mongoose.model('mymodel',demoSchema,'demodata')
app.get('/count', async (req, res) =>{
    res.json({count: await user.countDocuments()})
})


app.post('/create',async (req,res) => {
    const body = req.body;
    const todo_id= body.id;
    const todo_title= body.title;
    const todo_desc = body.desc;
    const time = body.time;

    // const insertedUser = await user.create({name:name, age: age, salary: salary, email:email})
    const insertedUser = await user.create({todo_id:todo_id, todo_title: todo_title, todo_desc: todo_desc, time:time})

    res.json({msg: "User inserted successfully", data: insertedUser})
})

app.get('/id/:name', async(req,res)=>{
    const name = req.params.name;
    const namedUser = await user.find({name:name})
    res.json({msg : "success", data : namedUser})
}) 

app.listen(8081, ()=> console.log("Appliction started"))