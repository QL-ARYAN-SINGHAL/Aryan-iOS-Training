//
//  LoginValidation.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 08/04/25.
//

import SwiftUI


class LogInValidation: ObservableObject {
    
    //MARK: Published properties
    
    @Published var loginEmail = ""
    @Published var signUpEmail = ""
    @Published var loginPassword = ""
    @Published var signUpPassword = ""
    @Published var confirmPassword = ""
    @Published var showAlert = false
    @Published  var value:Int = 0
    @Published  var firstName : String = ""
    @Published  var lastName : String = ""
    @Published  var selectedGender : String = ""
    @Published  var ageValue : Double = 12
    @Published  var age: Int = 0
    
    var ageLabel: String {
        "Age: \(age)"
    }
   
    
    //MARK: Email VALIDATION CODE
    //MARK: email regex ->= 1. (Uppercase allowed , lower case allowed,number allowed special chacrter allowed) + (.necessary uppercase and lower case adn then last string should be bwteen 2 to 16)
    func isEmailValid() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,16}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)

        let isValid = emailTest.evaluate(with: loginEmail)

        if !isValid{
            showAlert=true
        }
        return isValid
    }
    
    func isSignUpEmailValid() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,16}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)

        let isValid = emailTest.evaluate(with: signUpEmail)

        if !isValid{
            showAlert=true
        }
        return isValid
    }
    
    
    
    //MARK: Password regex meaning
//    (?=^.{7,}$) At least 7 characters long
//    (?=^.*[A-Z].*$) At least one uppercase letter
//    (?=^.*\d.*$) At least one number
//    .* Match the string that contains all assertions
    
    //MARK: PASSWORD VALIDATION CODE
    
    func isPasswordValid() -> Bool {
        let passwordRegex = #"(?=^.{7,15}$)(?=^.*[A-Z].*$)(?=^.*\d.*$).*"#
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
            let isPasswordValid =  passwordPredicate.evaluate(with: loginPassword)
        if !isPasswordValid{
            showAlert = true
        }
        return isPasswordValid
    }
    
    func isSignUpPasswordValid() -> Bool {
        let passwordRegex = #"(?=^.{7,}$)(?=^.*[A-Z].*$)(?=^.*\d.*$).*"#
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
            let isPasswordValid =  passwordPredicate.evaluate(with: signUpPassword)
        if !isPasswordValid{
            showAlert = true
        }
        return isPasswordValid
    }

    
    //MARK: CONFIRM PASSWORD VALIDATION
    func isPasswordConfirmValid() -> Bool {
        if  confirmPassword != signUpPassword{
            showAlert = true
            return false
        }
        return true
    }
    
    func progressValue() -> Int {
       
        guard value <= 100 else{
            return value
        }
     
        var newProgress: Int = 0
        DispatchQueue.main.async {
            
            if !self.firstName.isEmpty{
                newProgress += 17
                
            }
            if !self.signUpEmail.isEmpty {
                newProgress += 17
                
            }
            if !self.lastName.isEmpty {
                newProgress += 17
                
            }
            if !self.signUpPassword.isEmpty && !self.confirmPassword.isEmpty {
                newProgress += 17
                
            }
            if !self.selectedGender.isEmpty {
                newProgress += 17
                if self.selectedGender == "Select a gender"{
                    newProgress -= 17
                }
            }
            if self.age != 0 {
                newProgress += 15
                
            }
            
            
            self.value = newProgress
            
        }
     
        return value
        
    }
   
  

    }
    
 









