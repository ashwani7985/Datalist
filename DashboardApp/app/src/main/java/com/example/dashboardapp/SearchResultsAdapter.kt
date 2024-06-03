package com.example.dashboardapp

import android.text.Layout
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class SearchResultsAdapter(private val results: List<SearchResult>): RecyclerView.Adapter<SearchResultsAdapter.ViewHolder>() {

    class ViewHolder(view: View): RecyclerView.ViewHolder(view){
        val idTextView : TextView = view.findViewById(R.id.idTextView)
        val vNameTextView : TextView = view.findViewById(R.id.vNameTextView)
        val vYearTextView : TextView = view.findViewById(R.id.vYearTextView)
        val colorTextView : TextView = view.findViewById(R.id.colorTextView)
        val vinTextView : TextView = view.findViewById(R.id.vinTextView)
        val ownerNameTextView : TextView = view.findViewById(R.id.ownerNameTextView)
        val addressTextView : TextView = view.findViewById(R.id.addressTextView)
        val mobileNumTextView : TextView = view.findViewById(R.id.mobileNumTextView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_search_result,parent,false)
        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val result = results[position]
        holder.idTextView.text = "ID: ${result.id}"
        holder.vNameTextView.text = "Vehicle Name: ${result.vName}"
        holder.vYearTextView.text = "Vehicle Year: ${result.vYear}"
        holder.colorTextView.text = "color : ${result.color}"
        holder.vinTextView.text = "color : ${result.vin}"
        holder.ownerNameTextView.text = "Owner Name: ${result.ownerName}"
        holder.addressTextView.text = "Address: ${result.address}"
        holder.mobileNumTextView.text = "Mobile No: ${result.mobileNum}"
    }

    override fun getItemCount()=results.size
}