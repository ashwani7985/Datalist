//
//  ContentView.swift
//  blogapp
//
//  Created by RPS on 06/06/24.
//

import SwiftUI
struct ContentView: View {
   
    var body: some View {
            Image("health").resizable().frame(width: 300, height:150)
        Text("Health & Fitness").fontWeight(.bold).font(.system(size: 30)).foregroundColor(.green)
            NavigationView{
                ScrollView(.vertical){
                    NavigationLink("Nutrition",destination: NutritionView())
                    NavigationLink("Exercise",destination: exercisePage())
                }.navigationTitle("Our Program").font(.system(size: 25)).frame(width: 300, height: .infinity).background(.green)
            }
     }
}



struct exercisePage:View{
    var body: some View{
        ZStack{
        Color.green.edgesIgnoringSafeArea(.all)
            Text("When you first start working on getting in shape, the gym can seem intimidating. With Total Health and Fitness, you can leave your insecurities at the door.Here, a personal trainer will build you a custom workout plan and teach you exactly how to perform each exercise during one-on-one sessions. With your customized health and fitness program and dedicated personal trainer, you can feel confident that your workout will actually work for you").padding().multilineTextAlignment(.leading).navigationTitle("Exercise")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
