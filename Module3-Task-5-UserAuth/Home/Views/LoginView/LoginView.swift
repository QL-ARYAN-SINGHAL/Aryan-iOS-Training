//
//  LoginView.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 04/04/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
  
            VStack{
                VStack{
                  Image("Login")
                      .resizable()
                      .scaledToFit()
                      .frame(width: 70, height: 70)
                      .multilineTextAlignment(.center)
                  
                  Text("LOGIN")
                      .multilineTextAlignment(.center)
                      .font(Font.custom("Poppins-Medium", size: 30))
                      .frame(width: 300, height : 50)
              }
              LoginFields()
            }
        }
       
    
         
   
}

#Preview {
    LoginView()
}
