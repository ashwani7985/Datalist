const mongoose = require('mongoose')

const claimSchema=new mongoose.Schema({
    name:{
        type:String
    },
    city:{
        type:String
    },
    pin:{type:Integer},
    mobile:{type:Integer},
    drivingLicenseNo:{type:Integer},
    dateOfAccident:{type:Date},
    placeOfAccident:{type:String},
    clainNo:{type:Integer},
    policyNo:{type:Integer},
    vehicleNo:{type:Integer},

});

module.exports=claimSchema;