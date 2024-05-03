require('dotenv').config();
const bodyParser = require('body-parser');
const express = require('express');
const { default: mongoose }= require('mongoose');
const cors = require('cors')
const app = express();
const port = process.env.PORT || 3000
const conn = process.env.CONN;

app.use(bodyParser.json());

const allowCrossDomain = (req, res, next)=>{
    res.header(`Access-Control-Allow-Origin`, `*`);
    res.header(`Access-Control-Allow-Methods`, `GET,PUT,POST,DELETE`);
    res.header(`Access-Control-Allow-Header`, `Content-Type`);
    next();
};

app.use(cors())
app.use(allowCrossDomain)
app.options('*',cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))

mongoose.connect(conn)
.then(()=>console.log('connected'))
.catch(()=> console.log('Error'))  

// const demoSchema = new mongoose.Schema({
//     todo_id:{
//         type:Number,
//         required:true
//     },
//     todo_title:{
//         type:String
//     },
//     todo_desc:{
//         type:String
//     },
//     time:{
//         type:String
//     }
// })

const demoSchema = new mongoose.Schema({
    name:{
        type:String,
        required:true
    },
    age:{
        type:Number
    },
    salary:{
        type:Number
    },
    email:{
        type: String,
        required:true
    }
})

const user = mongoose.model('mymodel',demoSchema,'demodata')

app.get("/", (req, res) => {
    res.end("Hello world")
})

app.get("/about", (req, res) => {
    res.end("welcome to about page")
})

app.get("/name/:myname", (req, res) => {
    res.end("welcome " + req.params.myname)
})

app.get('/count', async (req, res) =>{
    res.json({count: await user.countDocuments()})
})


app.post('/create',async (req,res) => {
    const body = req.body;
    const name= body.name;
    const age= body.age;
    const salary = body.salary;
    const email = body.email;

    const insertedUser = await user.create({name:name, age: age, salary: salary, email:email})
    // const insertedUser = await user.create({todo_id:todo_id, todo_title: todo_title, todo_desc: todo_desc, time:time})

    res.json({msg: "User inserted successfully", data: insertedUser})
})

app.get('/id/:name', async(req,res)=>{
    const name = req.params.name;
    const namedUser = await user.find({name:name})
    res.json({msg : "success", data : namedUser})
}) 

app.listen(port, ()=> console.log("Appliction started "+port));