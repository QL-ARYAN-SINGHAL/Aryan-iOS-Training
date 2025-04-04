//
//  LoginFields.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 04/04/25.
//

import SwiftUI

struct LoginFields: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter your Email", text: $email)
             
                .foregroundStyle(.black)
                .background(Color.white)
                
                .accentColor(.black)
                .frame(width: 300, height: 50)
            
            TextField("Enter your Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundStyle(.black)
                .background(Color.white)
                .accentColor(.black)
                .frame(width: 300, height: 50)
        }
        .padding()
       
    }
}

#Preview {
    LoginFields()
}
