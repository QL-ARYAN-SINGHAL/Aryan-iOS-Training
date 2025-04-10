//
//  SegmentedView.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 07/04/25.
//

import SwiftUI

struct SegmentedView: View {
    
    @State private var currentView = 0
    @StateObject private var formValidation = LogInValidation()
    @State private var shouldNavigate = false
    
    private var signInButtonText: String {
        currentView == 0 ? "Log In" : "Sign Up"
    }
    
    private var loginDot: String {
        currentView == 0 ? "circle.fill" : "circle"
    }
    
    private var signinDot: String {
        currentView == 1 ? "circle.fill" : "circle"
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    HStack(spacing: 10) {
                        Image(systemName: loginDot)
                        Image(systemName: signinDot)
                    }
                    .frame(maxWidth: .greatestFiniteMagnitude, alignment: .trailing)
                    .padding(.trailing, 15)
                    
                    Picker("Currently on", selection: $currentView) {
                        Text("LogIn").tag(0)
                        Text("SignUp").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 20)
                    
                    if currentView == 0 {
                        LoginView(loginViewModel: formValidation)
                            .padding(.top, 50)
                            .navigationBarBackButtonHidden()
                    } else if currentView == 1 {
                        SignInView(signUpViewModal:formValidation)
                            .navigationBarBackButtonHidden()
                    }
                }
                
                VStack {
                    Button(action: {
                        if currentView == 0 {
                            let isValid = formValidation.isEmailValid()
                            let isPasswordValid = formValidation.isPasswordValid()
                            if isValid && isPasswordValid {
                                shouldNavigate = true
                            }
                        } else {
                            let isValid = formValidation.isSignUpEmailValid()
                            let isPasswordValid = formValidation.isSignUpPasswordValid()
                            let confirmPassword = formValidation.isPasswordConfirmValid()
                            if isValid && isPasswordValid && confirmPassword {
                                shouldNavigate = true
                            }
                          
                        }
                    },label: {
                        Text(signInButtonText)
                            .font(.custom("Poppins-Medium", size: 18))
                            .frame(maxWidth: 300)
                            .frame(height: 48)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    })
                    .alert(isPresented: $formValidation.showAlert) {
                        Alert(
                            title: Text("Invalid Credentials"),
                            message: Text("Either email or password is incorrect!"),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    
                    NavigationLink(destination: HomeView(), isActive: $shouldNavigate) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
            .padding(.top, 20)
            
            .navigationTitle("QuickAuth")
            .navigationBarTitleDisplayMode(.large)
          
           
           
        }
       
        
    }
}

#Preview {
    SegmentedView()
}
