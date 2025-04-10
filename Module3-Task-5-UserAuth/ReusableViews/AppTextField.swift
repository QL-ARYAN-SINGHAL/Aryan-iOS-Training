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



}

