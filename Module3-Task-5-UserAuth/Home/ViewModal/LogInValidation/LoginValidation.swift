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
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var showAlert = false
    
    @Published  var value:Double = 0.0
    @Published  var firstName : String = ""
   
    @Published  var lastName : String = ""
    
    @Published  var selectedGender : String = "Select a gender"
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
    
    func progressValue()->Double{
        
        
        // if score is given for a particular attribute/ fiekd then it should not give again.
        
        
        // done , early exit to avoid re-computations
        guard value <= 100 else {
            return value
        }
    
   
    
            print("------")
            switch (self.firstName, self.email, self.lastName, self.password, self.confirmPassword, self.selectedGender) {
               case let (fn, _, _, _, _, _) where !fn.isEmpty:
                self.value += 14.3
               case let (_, e, _, _, _, _) where !e.isEmpty:
                self.value += 14.3
               case let (_, _, l, _, _, _) where !l.isEmpty:
                self.value += 14.3
               case let (_, _, _, p, cp, _) where !p.isEmpty && !cp.isEmpty:
                self.value += 14.3
               case let (_, _, _, _, _, g) where !g.isEmpty:
                self.value += 14.3
          
               default:
                   break
               }
    
        return value
//        print("progress vvbjvbkbjv-0--------------------")
//            if !firstName.isEmpty{
//                DispatchQueue.main.async {
//                    self.value+=14.3
//                }
//            }
//            if !email.isEmpty{
//                DispatchQueue.main.async {
//                    self.value+=14.3
//                }
//                
//            }
//            if !lastName.isEmpty{
//                DispatchQueue.main.async {
//                    self.value+=14.3
//                }
//            }
//            if !password.isEmpty && !confirmPassword.isEmpty{
//                DispatchQueue.main.async {
//                    self.value+=14.3
//                }
//            }
//            if !gender.isEmpty{
//                DispatchQueue.main.async {
//                    self.value+=14.3
//                }
//            }
//      
//        return value
    }
    
}

//MARK: Password regex meaning
////^                         Start anchor
//(?=.*[A-Z].*[A-Z])        Ensure string has two uppercase letters.
//(?=.*[!@#$&*])            Ensure string has one special case letter.
//(?=.*[0-9].*[0-9])        Ensure string has two digits.
//(?=.*[a-z].*[a-z].*[a-z]) Ensure string has three lowercase letters.
//.{8}                      Ensure string is of length 8.
//$                         End anchor.


