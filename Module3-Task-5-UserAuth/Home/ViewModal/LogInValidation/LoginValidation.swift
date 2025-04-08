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
    
    func isEmailValid() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,16}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)

        let isValid = emailTest.evaluate(with: email)
  //      print(isValid)
        if !isValid{
            showAlert=true
        }
        return isValid
    }
    
    func isPasswordVaild() -> Bool {
        let passwordRegex = "[]"
    }

    
}

