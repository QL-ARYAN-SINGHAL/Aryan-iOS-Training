//
//  SignInValidation.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 07/04/25.

import SwiftUI
import Combine

class SignInValidation: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var showAlert = false

    //MARK: EMAIL VALIDATION
    func isEmailValid() {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailTest.evaluate(with: email) {
            showAlert = true
         
        }
  
    }
    
    
    //Password validation
    func isPassword(){
        let passwordRegex = "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        if !passwordTest.evaluate(with: password) {
            showAlert = true
        }
    }
    
}
