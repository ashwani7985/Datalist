//
//  SpendingTrendsView.swift
//  budgetTracker
//
//  Created by RPS on 11/06/24.
//

import SwiftUI
import SwiftUICharts

struct SpendingTrendsView: View {
    
    @ObservedObject var store: TransactionStore
    
    var body: some View {
        let spendingData:[Double] = store.cumulativeSpending.map{ $0.balance}
        return VStack{
            LineChartView(data: spendingData, title: "Spending Trends", form: ChartForm.extraLarge).padding()
        }
        .navigationTitle("Spending Trends")
    }
}

struct SpendingTrendsView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleStore = TransactionStore()
        SpendingTrendsView(store: sampleStore)
    }
}
