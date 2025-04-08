//
//  LoginValidation.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 08/04/25.
//

import SwiftUI

import Combine

class LogInValidation: ObservableObject {
    @Published var email = ""
    
    @Published var showAlert = false
    
    //MARK: EMAIL VALIDATION
    func isEmailValid() {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailTest.evaluate(with: email) {
            showAlert = true
            
        }
        
    }
    
}
