//
//  Currency.swift
//  CurrencyExchange
//
//  Created by RPS on 12/06/24.
//

import Foundation

struct Currency: Identifiable{
    var id = UUID().uuidString
    var currencyName: String
    var currencyValue: Double
}

// you can modify this for your own...
var currencies = ["USD", "AUD", "EUR", "INR", "JPY"]
