const{default:mongoose}= require("mongoose");
const loginSchema = require("./loginSchema");
const claimSchema = require("./claimSchema");

const DB_NAME = process.env.DB_NAME || "todoApp";
const URI = process.env.MONGO_URI || "mongodb+srv://temp:temp@cluster0.632lzyb.mongodb.net"; 
const MONGO_URI = `${URI}/${DB_NAME}`;

mongoose.connect(MONGO_URI).then(()=>console.log("Connected")).catch((err)=>console.log(err));

const claims = mongoose.model('claim',claimSchema, 'claims');
const log_in = mongoose.model('login',loginSchema,'log_in');

module.exports = {claims, log_in};