//
//  ContentView.swift
//  Firabase_SwiftUI
//
//  Created by Arturo Burigo on 5/22/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject  var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if  viewModel.userSession != nil {
                ProfileView()
            }
            else {
                LoginView()
            }
        }
    }
 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
