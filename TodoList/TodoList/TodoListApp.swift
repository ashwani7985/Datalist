//
//  TodoListApp.swift
//  TodoList
//
//  Created by RPS on 08/06/24.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
                
            }
            .environmentObject(listViewModel)
        }
    }
}
