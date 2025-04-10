//
//  LoginFields.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 04/04/25.
//

import SwiftUI



struct LoginFields: View {
    
    @ObservedObject var logInValidation : LogInValidation
    
    var body: some View {
        VStack(spacing: 20) {
            
            
            TextField("Enter your Email", text: $logInValidation.loginEmail)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.1))
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .medium))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                .cornerRadius(10)
                .frame(width: 320, height: 45)
                .shadow(color: Color.black.opacity(0.06), radius: 3, x: 0, y: 2)
                .padding(.bottom, 18)
            
            
            
            ForSecureField(text: $logInValidation.loginPassword)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.1))
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .medium))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                .cornerRadius(10)
                .frame(width: 320, height: 45)
                .shadow(color: Color.black.opacity(0.06), radius: 3, x: 0, y: 2)
                .padding(.bottom, 18)
            
        }
        .padding()
       
    }
}

struct ForSecureField: View{
    @Binding var text : String
    @State private  var isSecure : Bool = true
   
    
    var body : some View{
        HStack{
            if isSecure{
                SecureField("Password" , text: $text)
           }
           else{
               TextField("Password" , text : $text)
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


#Preview {

}
