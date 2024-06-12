//
//  ContentView.swift
//  budgetTracker
//
//  Created by RPS on 11/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var store = TransactionStore()
    @Environment(\.colorScheme) var colorSchema
    
    var body: some View {
        NavigationView{
        VStack{
            NavigationLink(destination: DashboardView(store: store)){
                Text("Go to Dashboard")
            }
            NavigationLink(destination: TransactionListView(store: store)){
                Text("Go to Transaction")
            }
            NavigationLink(destination: AddTransactionView(store:store)){
                    Text("Add Transaction")
               }
            }
        .navigationTitle("Budget Tracker")
        .background(colorSchema == .dark ? Color.black : Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
