//
//  SignInView.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 05/04/25.
//

import SwiftUI

struct SignInView: View {
    @State private var progressPercentage : Int = 30
    @StateObject var signUpViewModal : LogInValidation
  
    var body: some View {
       
            
            VStack{
                Text("SignUp")
                    .font(Font.custom("Poppins-Medium", size: 25))
                    .frame(width: 100 , height: 120)
                    .padding(.leading,-150)
                    .padding(.top,-20)
                SignInFields(signUpValidation:signUpViewModal)
                    .padding(.top,-30)
                
                //MARK: Implementation of progress bar to track the field precentage
                Divider()
                    .background(.black)
                    
                Text("Progress : \(signUpViewModal.progressValue())%")
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading,20)
                HStack{
                  Text("0%")
                    ProgressView(value: Double(signUpViewModal.progressValue())/100,total: 100.0)
                        .frame(width: 200, height: 20)
                       
                    Text("100%")
                }
            }
        
        
        
    }
      
}

#Preview {
  //  SignInView()
}
