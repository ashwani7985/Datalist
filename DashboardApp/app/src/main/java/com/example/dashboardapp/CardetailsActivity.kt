package com.example.dashboardapp

import android.annotation.SuppressLint
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.android.volley.Request
import com.android.volley.RequestQueue
import com.android.volley.toolbox.JsonArrayRequest
import com.android.volley.toolbox.JsonObjectRequest
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.example.dashboardapp.databinding.ActivityMainBinding
import org.json.JSONException
import org.json.JSONObject

class CardetailsActivity : AppCompatActivity() {
    private lateinit var searchBar: EditText
    private lateinit var searchButton: Button
    private lateinit var recyclerView: RecyclerView
    private lateinit var requestQueue: RequestQueue
    private lateinit var searchResults: MutableList<SearchResult>
    private lateinit var adapter: SearchResultsAdapter
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_cardetails)

        searchBar = findViewById(R.id.searchBar)
        searchButton = findViewById(R.id.searchButton)
        recyclerView = findViewById(R.id.recyclerView)

        recyclerView.layoutManager = LinearLayoutManager(this)
        requestQueue = Volley.newRequestQueue(this)
        searchResults = mutableListOf()

        adapter = SearchResultsAdapter(searchResults)
        recyclerView.adapter = adapter

        searchButton.setOnClickListener {
            val query = searchBar.text.toString()
            fetchData(query)
        }
    }
    private fun fetchData(query: String) {
        val url = "https://web-dev-2.onrender.com/details/$query";

        val stringRequest = StringRequest(
            Request.Method.GET, url,
            {
                res ->
                    val jsonObject = JSONObject(res)
                    if(jsonObject.getString("msg")=="Success") {
                        val dataObject = jsonObject.getJSONObject("data")
                        val result = SearchResult(
                            id = dataObject.getString("_id"),
                            vName = dataObject.getString("vName"),
                            vYear = dataObject.getInt("vYear"),
                            color = dataObject.getString("color"),
                            vin = dataObject.getInt("vin"),
                            ownerName = dataObject.getString("ownerName"),
                            address = dataObject.getString("address"),
                            mobileNum = dataObject.getInt("mobileNum")
                        )
                        searchResults.clear()
                        searchResults.add(result)
                        adapter.notifyDataSetChanged()
                    }
            },

            {
                error -> error.printStackTrace()
            }
        )

        requestQueue.add(stringRequest)

    }
}

//    val stringRequest =  StringRequest(Request.Method.GET,url,
//        {
//                res -> resultTextView.text = res
//        },
//        {
//                err -> resultTextView.text = "Error: ${err.message}"
//        }
//    )
//
//    requestQueue.add(stringRequest)
//}