//
//  SegmentedView.swift
//  Module3-Task-5-UserAuth
//
//  Created by ARYAN SINGHAL on 07/04/25.
//

import SwiftUI

struct SegmentedView: View {
    
    @State private var currentView = 0
   
   
    private var loginDot: String {
        currentView == 0 ? "circle.fill" : "circle"
    }
    
    private var signinDot: String {
        currentView == 1 ? "circle.fill" : "circle"
    }

    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: loginDot)
                Image(systemName: signinDot)
            }

            Picker("Currently on", selection: $currentView) {
                Text("LogIn").tag(0)
                Text("SignUp").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 20)

            if currentView == 0 {
                LoginView()
                    .padding(.top, 50)

                Button(action: {
                  
                }, label: {
                    Text(" LogIn ")
                        .font(.custom("Poppins-Medium", size: 18))
                        .frame(maxWidth: 300)
                        .frame(height: 48)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                })
            } else if currentView == 1 {
                SignInView()

                Button(action: {
                    // Handle sign-in action
                }, label: {
                    Text(" Sign In ")
                        .font(.custom("Poppins-Medium", size: 18))
                        .frame(maxWidth: 300)
                        .frame(height: 48)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.top, -52)
                })
            }
        }
        .padding(.top, 50)
    }
}

#Preview {
    SegmentedView()
}
