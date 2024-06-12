//
//  FetchData.swift
//  CurrencyExchange
//
//  Created by RPS on 12/06/24.
//

import Foundation
import UIKit

class FetchData: ObservableObject{
    
    @Published var conversionData: [Currency] = []
    @Published var base = "USD"
    
    init(){
        fetch()
    }
    
    func fetch(){
        let url = "https://v6.exchangerate-api.com/v6/a48783777fa14b2c8c8d8729/latest/\(base)"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) {(data, _, _) in
            
            guard let JSONData = data else{ return}
            
            do{
                let conversion = try JSONDecoder().decode(Conversion.self, from: JSONData)
               //coverting dictionary to array of objects...
                DispatchQueue.main.async {
                    self.conversionData = conversion.rates.compactMap({(key,value) -> Currency? in
                        
                        return Currency(currencyName: key, currencyValue: value)
                    })
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    func updateData(base:String){
        
        self.base = base
        self.conversionData.removeAll()
        fetch()
    }
}
