//
//  LoginValidation.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 08/04/25.
//

import SwiftUI


class LogInValidation: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var showAlert = false
    
    @Published  var value:Double = 0.0
    @Published  var firstName : String = ""
   
    @Published  var lastName : String = ""
    @Published  var age: String = "Age: \(0)"
    @Published  var selectedGender : String = ""
    @Published  var ageValue : Double = 12
    
    
   
    
    //MARK: Email VALIDATION CODE
    func isEmailValid() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,16}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)

        let isValid = emailTest.evaluate(with: email)

        if !isValid{
            showAlert=true
        }
        return isValid
    }
    
    
    //MARK: Password regex meaning
    ////^                         Start anchor
    //(?=.*[A-Z].*[A-Z])        Ensure string has two uppercase letters.
    //(?=.*[!@#$&*])            Ensure string has one special case letter.
    //(?=.*[0-9].*[0-9])        Ensure string has two digits.
    //(?=.*[a-z].*[a-z].*[a-z]) Ensure string has three lowercase letters.
    //.{8}                      Ensure string is of length 8.
    //$                         End anchor.
    
    //MARK: PASSWORD VALIDATION CODE
    
    func isPasswordValid() -> Bool {
        let passwordRegex = "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$"
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
            let isPasswordValid =  passwordPredicate.evaluate(with: password)
        if !isPasswordValid{
            showAlert = true
        }
        return isPasswordValid
    }

    
    //MARK: CONFIRM PASSWORD VALIDATION
    func isPasswordConfirmValid() -> Bool {
        if  confirmPassword != password{
            showAlert = true
            return false
        }
        return true
    }
    
    
    // 1) -> during the changes ......property observers - > jb bhi changes hoga, hum progress ko trigger
    // not to use chat gpt -> properties inki values ko bind krde progress values
    /// delegate methods ->> easy + efficient + recommended
    /// 
    
    func progressValue() -> Double {
       
        guard value <= 100 else{
            return value
        }
     
        var newProgress: Double = 0.0
        DispatchQueue.main.async {
            
            if !self.firstName.isEmpty{
                newProgress += 16.6
                
            }
            if !self.email.isEmpty {
                newProgress += 17
                
            }
            if !self.lastName.isEmpty {
                newProgress += 16.6
                
            }
            if !self.password.isEmpty && !self.confirmPassword.isEmpty {
                newProgress += 16.6
                
            }
            if !self.selectedGender.isEmpty {
                newProgress += 16.6
                
            }
            if !self.age.isEmpty {
                newProgress += 16.6
                
            }
            
            
            self.value = newProgress
            
        }
     
        return value
        
    }
      
  

    }
    
 









