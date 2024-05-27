const mongoose = require('mongoose')

const registerSchema = new mongoose.Schema({
    vName:{type:String},
    vYear:{type:Number},
    color:{type:String},
    vin:{type:Number},
    ownerName:{type:String},
    address:{type:String},
    mobileNum:{type:Number}
})

module.exports = registerSchema