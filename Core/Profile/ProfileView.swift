//
//  ProfileView.swift
//  Firabase_SwiftUI
//
//  Created by Arturo Burigo on 5/22/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                HStack {
                    Text(user.initials)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(.gray)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullname)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)
                        
                        Text(user.email)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }
                
                
                
                Section ("General") {
                    HStack {
                        SettingRowView(imageName: "gear",
                                       text: "Version",
                                       tintColor: .gray)
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }
                }
                Section ("Account") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingRowView(imageName: "arrow.left.circle.fill",
                                       text: "Log Out",
                                       tintColor: .red)
                    }
                    
                    Button {
                        print("Delete Account")
                    } label: {
                        SettingRowView(imageName: "xmark.circle.fill",
                                       text: "Delete Account",
                                       tintColor: .red)
                    }
                }
            }
        }
    }
    
    
    
    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
}
