//
//  SignInView.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 05/04/25.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        VStack{
            VStack{
                Image("SignIn")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .padding(.leading,-20)
                    .padding(.top , 100)
                 
                
                Text("SIGN IN")
                    .multilineTextAlignment(.center)
                    .font(Font.custom("Poppins-Medium", size: 30))
                    .frame(width: 300, height : 50)
                    
                    .padding(.leading , -20)
            }
            .padding(.top , -100)
            SignInFields()
        }
      
        
    }
      
}

#Preview {
    SignInView()
}
