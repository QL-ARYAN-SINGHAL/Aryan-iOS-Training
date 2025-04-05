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
             
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundStyle(.black)
                .background(Color.white)
                .accentColor(.black)
                .frame(width: 300, height: 35)
                .border(.black)
                .padding(.bottom , 8)
            
            
            
            SecureField("Enter your Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundStyle(.black)
                .background(Color.white)
                .accentColor(.black)
                .frame(width: 300, height: 35)
                .border(.black)
            
            
            
            Button(action : {
                
            }, label : {
              Text(" Submit ")
                    .font(.custom("Poppins-Medium", size: 18))
                    .frame(maxWidth: 300)
                    .frame(height: 48)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    
                   
            })
            .padding(.top , 20)
            
            Button("Forgot Password?"){
                
            }
           
            .padding(.top , 17)
        }
        .padding()
       
    }
}

#Preview {
    LoginFields()
}
