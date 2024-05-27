package com.example.dashboardapp

import android.os.Bundle
import android.widget.EditText
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.android.volley.Request
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley


class LoginActivity : AppCompatActivity() {

    lateinit var v_name : EditText
    lateinit var v_year : EditText
    lateinit var color : EditText
    lateinit var vin : EditText
    lateinit var owner_name : EditText
    lateinit var address : EditText
    lateinit var mob_no : EditText
    lateinit var btn : EditText
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

         v_name = findViewById(R.id.v_name)
         v_year = findViewById(R.id.v_year)
         color = findViewById(R.id.color)
         vin = findViewById(R.id.vin)
         owner_name = findViewById(R.id.owner_name)
         address = findViewById(R.id.address)
         mob_no = findViewById(R.id.mob_no)
         btn = findViewById(R.id.btn1)

        btn.setOnClickListener {
          registerUser()
        }
    }

    private fun registerUser(){
        val v_nameBody = v_name.text.toString()
        val v_yearBody = v_year.text.toString()
        val colorBody = color.text.toString()
        val vinBody = vin.text.toString()
        val owner_nameBody = owner_name.text.toString()
        val addressBody = address.text.toString()
        val mob_noBody = mob_no.text.toString()
        val btnBody = btn.text.toString()

        val apiEndpoint = "https://web-dev-2.onrender.com/register"
        val requestQueue = Volley.newRequestQueue(this)
        val sreq = object : StringRequest(Request.Method.POST,apiEndpoint,
            {
                res -> Toast.makeText(applicationContext,"Response: $res",Toast.LENGTH_LONG).show()
            },
            {
                err -> Toast.makeText(applicationContext, "Error: $err",Toast.LENGTH_LONG).show()
            }){
            override fun getParams(): MutableMap<String, String>? {
                val params: MutableMap<String,String> = HashMap()
                params["v_name"] = v_nameBody
                params["v_year"] = v_yearBody
                params["color"] = colorBody
                return params
            }
        }
        requestQueue.add(sreq)
    }
}