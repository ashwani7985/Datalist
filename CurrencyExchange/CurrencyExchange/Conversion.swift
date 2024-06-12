//
//  Conversion.swift
//  CurrencyExchange
//
//  Created by RPS on 12/06/24.
//

import SwiftUI

struct Conversion: Decodable {
    
    var rates : [String: Double]
    var date : String
    var base : String
    
    enum CodingKeys: String, CodingKey {
        case rates = "conversion_rates"
        case base = "base_code"
        case date = "time_next_update_utc"
    }
}

