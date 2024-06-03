package com.example.dashboardapp

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.widget.LinearLayout
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    private lateinit var login : LinearLayout
    private lateinit var search: LinearLayout

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        login = findViewById(R.id.login_btn)
        search = findViewById(R.id.search_bar)
        login.setOnClickListener{
            startActivity(Intent(this,LoginActivity::class.java))
        }
        search.setOnClickListener{
            startActivity(Intent(this,CardetailsActivity::class.java))
        }

    }

}