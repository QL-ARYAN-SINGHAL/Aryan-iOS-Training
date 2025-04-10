//
//  AppTextField.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 09/04/25.
//

import SwiftUI

struct AppTextField: View {
    
    var textFieldPlaceholder : String = ""
    @Binding var textFieldValue : String
    
    var body: some View {
        TextField(textFieldPlaceholder, text: $textFieldValue)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .foregroundStyle(.black)
            .background(Color.white)
            .accentColor(.black)
            .frame(width: 300, height: 35)
            .border(.black)
            .padding(.bottom, 15)
            
        
  
        
    }
}

