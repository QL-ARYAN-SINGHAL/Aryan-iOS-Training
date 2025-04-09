import SwiftUI

struct SignInFields: View {
    
    // After finishing : Do read difference between StateObject and ObservedObjects
    /// When you own the data use StateObject and if you want to pass data to other view use ObservedObject
    /// @stateObject = Login()
    /// Login : @obsevedc d,
    
    
    @StateObject var signUpValidation : LogInValidation
   
   
    @State private var isFemale = false
    @State private var isMale = false
    @State private var isNonBinary = false
    @State private var isGender = false
   
    var body: some View {
      
            
            
            NavigationStack{
                VStack {
                    
                    AppTextField(textFieldPlaceholder: "Email", textFieldValue: $signUpValidation.email)
                        .onSubmit {
                            signUpValidation.progressValue()
                        }
                    
                    
                    AppTextField(textFieldPlaceholder: "First Name ", textFieldValue: $signUpValidation.firstName)
                        .onSubmit {
                            signUpValidation.progressValue()
                        }
                    
                    AppTextField(textFieldPlaceholder: "LastName", textFieldValue: $signUpValidation.lastName)
                        .onSubmit {
                            signUpValidation.progressValue()
                        }
                    
                    AppTextField(textFieldPlaceholder: "Password", textFieldValue: $signUpValidation.password)
                        .onSubmit {
                            signUpValidation.progressValue()
                        }
                    
                    AppTextField(textFieldPlaceholder: "Confirm Password", textFieldValue: $signUpValidation.confirmPassword)
                        
                    
                    AppTextField(textFieldPlaceholder: "Age", textFieldValue: $signUpValidation.age)
                        .accentColor(.black)
                       
                        
                    
                    Slider(value: $signUpValidation.ageValue, in: 12...70, step: 1)
                        .padding(.horizontal,30)
                        .accentColor(.red)
                        .onChange(of: signUpValidation.ageValue) {
                            signUpValidation.age = "Age : \(Int($0))"
                            signUpValidation.progressValue()
                        }
                        .frame(width : UIScreen.main.bounds.width*0.6)
                        .padding(.leading,-128)
                    
                    
                    VStack {
                        Text("Gender: \(signUpValidation.selectedGender)")
                            .foregroundStyle(.black)
                            .font(.system(size: 18, weight: .bold))
                            .frame(width: 300, alignment: .leading)
                            .padding(.top, 10)
                            .onChange(of: signUpValidation.selectedGender) {
                              
                                    signUpValidation.progressValue()
                                
                            }
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("Female")
                                Spacer()
                                Toggle("", isOn: Binding(
                                    get: { isFemale },
                                    set: { newValue in
                                        isFemale = newValue
                                        if newValue {
                                            isMale = false
                                            isNonBinary = false
                                            signUpValidation.selectedGender = "Female"
                                        } else if !isMale && !isNonBinary {
                                            signUpValidation.selectedGender = "Select a gender"
                                        }
                                    }
                                ))
                                .labelsHidden()
                            }

                            HStack {
                                Text("Male")
                                Spacer()
                                Toggle("", isOn: Binding(
                                    get: { isMale },
                                    set: { newValue in
                                        isMale = newValue
                                        if newValue {
                                            isFemale = false
                                            isNonBinary = false
                                            signUpValidation.selectedGender = "Male"
                                        } else if !isFemale && !isNonBinary {
                                            signUpValidation.selectedGender = "Select a gender"
                                        }
                                    }
                                ))
                                .labelsHidden()
                            }

                            HStack {
                                Text("Non-Binary")
                                Spacer()
                                Toggle("", isOn: Binding(
                                    get: { isNonBinary },
                                    set: { newValue in
                                        isNonBinary = newValue
                                        if newValue {
                                            isFemale = false
                                            isMale = false
                                            signUpValidation.selectedGender = "Non-Binary"
                                        } else if !isFemale && !isMale {
                                            signUpValidation.selectedGender = "Select a gender"
                                        }
                                    }
                                ))
                                .labelsHidden()
                            }
                        }
                        .padding(.top, 10)
                    }
                    .frame(width: 300)
                    .padding()
                    
                    
                }
            }
         
    }
    
}


#Preview{
  //  SignInFields()
}
