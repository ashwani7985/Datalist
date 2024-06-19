//
//  NutritionView.swift
//  blogapp
//
//  Created by RPS on 07/06/24.
//

import SwiftUI

struct NutritionView: View {
    @State var isSuccess : Bool = true
    var body: some View {
                ZStack{
                    Color.green.edgesIgnoringSafeArea(.all);                  Text("Everyone has their own personal food preferences. Your meal plan is built based on your food choices, goals, and schedule to provide the most convenient, practical menu that suits your lifestyle. Whether you’re making meals for yourself or an entire family, your menu will always consist of foods you can buy at any grocery store. No more fussy, complicated recipes, we’ll help you keep your meals manageable without sacrificing flavor").padding().multilineTextAlignment(.leading).navigationTitle("Nutrition")
                }
    }
}

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView()
    }
}
