//
//  ContentView.swift
//  CurrencyExchange
//
//  Created by RPS on 12/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            Home()
                .navigationTitle("Currency Exchange")
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View{
    @StateObject var viewModel = FetchData()
    var body: some View {
        
        VStack{
            if viewModel.conversionData.isEmpty{
                
                ProgressView()
            }
            else{
                ScrollView{
                    LazyVStack(alignment: .leading, spacing: 15, content: {
                        ForEach(viewModel.conversionData){ rate in
                            HStack(spacing: 15){
                                
                                Text(getFlag(currency: rate.currencyName))
                                    .font(.system(size: 65))
                                
                                VStack(alignment: .leading, spacing: 5, content: {
                                    Text(rate.currencyName)
                                        .font(.title)
                                        .fontWeight(.bold)
                                    
                                    Text("\(rate.currencyValue)")
                                        .fontWeight(.heavy)
                                    
                                })
                            }
                            .padding(.horizontal)
                        }
                    })
                        .padding(.top)
                }
            }
        }
        .toolbar(content: {
            Menu(content: {
                
                ForEach(currencies, id:\.self){ name in
                    Button(action: {viewModel.updateData(base: name)}, label: {
                        Text(name)
                    })
                }
                
            }){
                Text("Base = \(viewModel.base)")
                    .fontWeight(.heavy)
            }
        })
    }
    
    
    
    // getting Country flag by Currency Name
      
    func getFlag(currency: String) -> String{
        
        var base = 127397
        var scaler = String.UnicodeScalarView()
        
        var code = currency
        code.removeLast()
        
        for i in code.utf16{
            scaler.append(UnicodeScalar(base + Int(i))!)
        }
        
        return String(scaler)
    }
}
