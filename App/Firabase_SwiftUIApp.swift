//
//  Firabase_SwiftUIApp.swift
//  Firabase_SwiftUI
//
//  Created by Arturo Burigo on 5/22/23.
//

import SwiftUI
import Firebase

@main
struct Firabase_SwiftUIApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
            }
    }
}
