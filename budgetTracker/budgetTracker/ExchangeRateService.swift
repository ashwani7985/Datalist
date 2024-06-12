//
//  ExchangeRateService.swift
//  budgetTracker
//
//  Created by RPS on 11/06/24.
//
/*
import Foundation
import SwiftUI
import Combine

class ExchangeRateService{
    private var cancellable: AnyCancellable?
    
    func fetchExchangeRates(completion: @escaping (Result<[String: Double], Error>) -> Void){
        guard let url = URL(string: "https://api.exchangeratesapi.io/lastest") else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map{$0.data}
            .decode(type: ExchangeRatesResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    completion(.failure(error))
                }
            }, receiveValue: {response in
                completion(.success(response.rates))
            })
    }
}

struct ExchangeRatesResponse: Codable{
    let rates: [String: Double]
}

private let exchangeRateService = ExchangeRateService()

func fetchExchangeRates(){
    exchangeRateService.fetchExchangeRates{ result in
        switch result {
        case .success(let rates):
            print("Fetched exchange rates: \(rates)")
        case .failure(let error):
            print("Failed to fetch exchange rates: \(error)")
        }
    }
    
}

let  store = TransactionStore()
store.fetchExchangeRates()
*/
