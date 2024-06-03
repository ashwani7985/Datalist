package com.example.dashboardapp

import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.android.volley.Request
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley


class LoginActivity : AppCompatActivity() {


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

         val vName = findViewById<EditText>(R.id.v_name)
         val vYear = findViewById<EditText>(R.id.v_year)
         val color = findViewById<EditText>(R.id.color)
         val vin = findViewById<EditText>(R.id.vin)
         val ownerName = findViewById<EditText>(R.id.owner_name)
         val address = findViewById<EditText>(R.id.address)
         val mobileNum = findViewById<EditText>(R.id.mob_no)
         val btn = findViewById<Button>(R.id.btn1)

        btn.setOnClickListener {
            val vNameBody = vName.text.toString()
            val vYearBody = vYear.text.toString()
            val colorBody = color.text.toString()
            val vinBody = vin.text.toString()
            val ownerNameBody = ownerName.text.toString()
            val addressBody = address.text.toString()
            val mobNoBody = mobileNum.text.toString()

          registerUser(vNameBody,vYearBody,colorBody,vinBody,ownerNameBody,addressBody,mobNoBody)
        }
    }

    private fun registerUser(vNameBody:String,vYearBody:String, colorBody:String, vinBody:String,ownerNameBody:String,addressBody:String, mobNoBody:String){
        val apiEndpoint = "https://web-dev-2.onrender.com/register"
        val requestQueue = Volley.newRequestQueue(this)
        val sreq = object : StringRequest(Request.Method.POST,apiEndpoint,
            Response.Listener { response ->
                Toast.makeText(this, "Registration successful", Toast.LENGTH_SHORT).show()
            },
            Response.ErrorListener { error ->
                Toast.makeText(this, "Error: $error",Toast.LENGTH_LONG).show()
            }){

//            {
//                res -> Toast.makeText(this@LoginActivity,"Response: $res",Toast.LENGTH_LONG).show()
//            },
//            {
//                err -> Toast.makeText(this@LoginActivity, "Error: $err",Toast.LENGTH_LONG).show()
//            }){
            override fun getParams(): MutableMap<String, String> {
                val params: MutableMap<String,String> = HashMap()
                params["vName"] = vNameBody
                params["vYear"] = vYearBody
                params["color"] = colorBody
                params["vin"] = vinBody
                params["ownerName"] = ownerNameBody
                params["address"] = addressBody
                params["mobileNum"] = mobNoBody
                return params
            }

        }
        requestQueue.add(sreq)
    }
}