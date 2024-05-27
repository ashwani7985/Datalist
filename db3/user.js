const{default:mongoose} = require("mongoose")

const registerSchema = require("./registerSchema")

const DB_NAME = process.env.DB_NAME || "register";
const URI = process.env.MONGO_URI || "mongodb+srv://register:register@cluster0.632lzyb.mongodb.net"; 
const MONGO_URI = `${URI}/${DB_NAME}`;

mongoose.connect(MONGO_URI).then(()=>console.log("Connected")).catch((err)=>console.log(err));

const demoRegister = mongoose.model('register',registerSchema,'demoRegister');

module.exports = demoRegister