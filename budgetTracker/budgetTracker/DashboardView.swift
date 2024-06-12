//
//  DashboardView.swift
//  budgetTracker
//
//  Created by RPS on 11/06/24.
//

import SwiftUI

struct DashboardView: View {
    
    @ObservedObject var store: TransactionStore
    
    var body: some View {
        VStack{
            Text("Total Balance")
                .font(.title)
                .padding()
            Text("\(store.totalAmount, specifier: "%.2f")")
                .font(.largeTitle)
                .foregroundStyle(store.totalAmount >= 0 ? .green : .red)
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)
            Spacer()
            ZStack{
            Text("Spending Trends")
                .font(.headline)
                .padding(.top)
            Rectangle()
                    .fill(Color(UIColor.systemBackground))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .padding()
                
                SpendingTrendsView(store: store)
                    .padding()
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleStore = TransactionStore()
        DashboardView(store: sampleStore)
    }
}
