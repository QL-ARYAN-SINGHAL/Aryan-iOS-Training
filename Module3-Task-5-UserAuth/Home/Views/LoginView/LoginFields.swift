//
//  LoginFields.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 04/04/25.
//

import SwiftUI

struct ForSecureField: View{
    @Binding var text : String
    @State private  var isSecure : Bool = true
    var body : some View{
        HStack{
            if isSecure{
                SecureField("Password" , text: $text)
           }
           else{
               TextField(text , text : $text)
           }
        }
        .overlay(alignment:.trailing){
            Image(systemName: isSecure ? "eye.slash" : "eye")
                .onTapGesture{
                    isSecure.toggle()
                }
        }
        .padding(.trailing , 15)
    }
}


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
            
            
            
            ForSecureField(text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundStyle(.black)
                .background(Color.white)
                .accentColor(.black)
                .frame(width: 300, height: 35)
                .border(.black)
                .padding(.bottom , 8)
            
            
            
            Button(action : {
                
            }, label : {
              Text(" Log In ")
                    .font(.custom("Poppins-Medium", size: 18))
                    .frame(maxWidth: 300)
                    .frame(height: 48)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    
                   
            })
            
            Button("Forgot Password?"){
                
            }
            .padding(.top , 5)
        }
        .padding()
       
    }
}

#Preview {
    LoginFields()
}
