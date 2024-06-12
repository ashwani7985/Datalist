//
//  TransactionListView.swift
//  budgetTracker
//
//  Created by RPS on 11/06/24.
//

import SwiftUI

struct TransactionListView: View {
    
    @ObservedObject var store: TransactionStore
    
    
    var body: some View {
        List{
            ForEach(store.transactions){ transaction in
                HStack{
                    Text(transaction.title)
                    Spacer()
                    Text("\(transaction.amount, specifier: "%.2f")")
                        .foregroundColor(transaction.isIncome ? .green : .red)
                }
        }
        .onDelete{indexSet in
            withAnimation{
            store.transactions.remove(atOffsets: indexSet)
            }
          }
        }
        .navigationTitle("Transactions")
        .toolbar {
            EditButton()
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {
    
    static var previews: some View {
        let sampleStore = TransactionStore()
        TransactionListView(store: sampleStore)

    }
}
