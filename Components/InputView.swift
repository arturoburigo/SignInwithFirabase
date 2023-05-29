//
//  InputView.swift
//  Firabase_SwiftUI
//
//  Created by Arturo Burigo on 5/22/23.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let systemIcon: String
    let placeHolder: String
    var isSecureField = false
    
    var body: some View {
        HStack(alignment: .center){
            Image(systemName: (systemIcon))
                .foregroundColor(.gray)
                .font(.body)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            if isSecureField {
                SecureField(placeHolder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeHolder, text: $text)
                    .font(.system(size: 14))
            }
        }
        .frame(height: 48)
        .background(
            RoundedRectangle(cornerRadius: 10)
            
                .stroke(Color("mainColor"), lineWidth: 2)
        )
        .padding(.top, 10)
    }

}


struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text:.constant(""), systemIcon: "envelope", placeHolder: "Email")
    }
}
