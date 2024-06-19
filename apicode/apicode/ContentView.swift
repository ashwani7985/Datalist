//
//  ContentView.swift
//  apicode
//
//  Created by RPS on 10/06/24.
//

import SwiftUI

struct ContentView: View {
    let url = "https://todo-app-3asm.onrender.com/tododata"
    @State private var response: String = ""
    var body: some View {
        VStack{
            Text(response)
        Button {
            Task{
                let (data, _) = try await URLSession.shared.data(from:URL(string:"https://homecontroll-app.onrender.com/rooms/room1")!)
                    let decodeRes = try?JSONDecoder().decode(Temp.self, from: data)
                    response = decodeRes? .name ?? "No rooms found"
            }
        }label: {
                Text("Fetch Response")
            }
        }
        .padding()
    }
}

/*struct Temp:Codable{
    var title: String
    var desc:String
}*/

struct Temp: Codable{
    var name: String
    var lights: Bool
    var humidity: Int
    var temperature:Int
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
