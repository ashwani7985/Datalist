package com.example.vehicleinsurance;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class LoginActivity extends AppCompatActivity{

   private Button btn;
   private TextView email, pass;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        btn = findViewById(R.id.button);
        email = findViewById(R.id.email_input);
        pass = findViewById(R.id.password_input);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                final String emailBody = email.getText().toString();
                final String passBody = pass.getText().toString();
                sendDataToAPI(emailBody,passBody);
            }
        });

    }
    private void sendDataToAPI(String email, String password){
        try {
        String apiEndpoint="https://web-dev-1-v7lo.onrender.com/login";
            final String data = URLEncoder.encode("email","UTF-8")+"="+URLEncoder.encode(email,"UTF-8")+"&"+URLEncoder.encode("password","UTF-8")+"="+URLEncoder.encode(password,"UTF-8");

            RequestQueue requestQueue = Volley.newRequestQueue(this);

            StringRequest stringRequest = new StringRequest(Request.Method.POST, apiEndpoint, new Response.Listener<String>() {
                @Override
                public void onResponse(String response) {
                    Toast.makeText(LoginActivity.this, "Data stored successfully!", Toast.LENGTH_SHORT).show();
                }
            }, new Response.ErrorListener() {
                @Override
                public void onErrorResponse(VolleyError error) {
                    Toast.makeText(LoginActivity.this, "Error storing data "+error.getMessage(),Toast.LENGTH_SHORT).show();
                }
            }){
                public byte[] getBody() throws AuthFailureError{
                    try{
                        return data.getBytes("utf-8");
                    }catch (UnsupportedEncodingException e){
                        e.printStackTrace();
                        return null;
                    }
                }
            };
            requestQueue.add(stringRequest);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}