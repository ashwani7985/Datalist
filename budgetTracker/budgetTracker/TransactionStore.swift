//
//  TransactionStore.swift
//  budgetTracker
//
//  Created by RPS on 11/06/24.
//

import Foundation
import Combine

class TransactionStore: ObservableObject{
    @Published var transactions: [Transaction] = [
        Transaction(title: "Salary", amount: 5000, date: Date(), isIncome: true),
        Transaction(title: "Groceries", amount: -150, date: Date(), isIncome: false)
    ]
    
    func addTransaction(title: String, amount:Double, isIncome:Bool){
        let newTransaction = Transaction(title: title, amount: amount, date: Date(), isIncome: isIncome)
        transactions.append(newTransaction)
    }
    var totalAmount: Double {
        transactions.reduce(0){
            $0 + $1.amount
        }
    }
    
    var cumulativeSpending: [(date: Date, balance: Double)]{
        var balance = 0.0
        return transactions.sorted(by: {$0.date < $1.date}).map{ transaction in
            balance += transaction.amount
            return (date: transaction.date, balance: balance)
        }
    }
    
}
