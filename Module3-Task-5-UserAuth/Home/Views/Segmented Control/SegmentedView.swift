//
//  SegmentedView.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 07/04/25.
//

import SwiftUI

struct SegmentedView: View {
    
    @State private var currentView = 0
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
        
        NavigationStack{
       
                VStack {
                    ScrollView(showsIndicators: false){
                        HStack(spacing: 10) {
                            Image(systemName: loginDot)
                            Image(systemName: signinDot)
                        }
                        .frame(maxWidth:.greatestFiniteMagnitude , alignment: .trailing)
                        .padding(.trailing,15)
                    
                        
                        Picker("Currently on", selection: $currentView) {
                            Text("LogIn").tag(0)
                            Text("SignUp").tag(1)
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal, 20)
                        
                        if currentView == 0 {
                            LoginView()
                                .padding(.top, 50)
                                .navigationBarBackButtonHidden()
                            
                            
                            
                        } else if currentView == 1 {
                            SignInView()
                            
                                .navigationBarBackButtonHidden()
                            
                        }
                    }
                    VStack{  NavigationLink(destination: ProfileView(), label: {
                        Text(signInButtonText)
                            .font(.custom("Poppins-Medium", size: 18))
                            .frame(maxWidth: 300)
                            .frame(height: 48)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                        
                    })
                    }
                    
                }
                
                .padding(.top, 20)
                
                
                
            }
            .padding(.top, 50)
            
        }
    }


#Preview {
    SegmentedView()
}
