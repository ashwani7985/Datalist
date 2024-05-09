const mongoose = require('mongoose')

const claimSchema=new mongoose.Schema({
    name:{
        type:String
    },
    city:{
        type:String
    },
    pin:{type:Number},
    mobile:{type:Number},
    drivingLicenseNo:{type:Number},
    dateOfAccident:{type:Date},
    placeOfAccident:{type:String},
    clainNo:{type:Number},
    policyNo:{type:Number},
    vehicleNo:{type:Number},

});

module.exports=claimSchema;