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
            Text("SignUp")
                .font(Font.custom("Poppins-Medium", size: 25))
                .frame(width: 100 , height: 120)
                .padding(.leading,-150)
                .padding(.top,-20)
            SignInFields()
                .padding(.top,-50)
        }
      
        
    }
      
}

#Preview {
    SignInView()
}
