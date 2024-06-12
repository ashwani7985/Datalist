//
//  AddTransactionView.swift
//  budgetTracker
//
//  Created by RPS on 11/06/24.
//

import SwiftUI

struct AddTransactionView: View {
    @ObservedObject var store: TransactionStore
    @State private var title: String = ""
    @State private var amount: String = ""
    @State private var isIncome: Bool = true
    
    var body: some View {
        Form{
            TextField("Title", text: $title)
            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
            Toggle(isOn: $isIncome){
                Text("Income")
            }
            Button(action: {
                if let amount = Double(amount){
                    store.addTransaction(title: title, amount:amount, isIncome: isIncome)
                }
            }){
                Text("Add Transaction")
            }
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleStore = TransactionStore()
        AddTransactionView(store: sampleStore)
    }
}
