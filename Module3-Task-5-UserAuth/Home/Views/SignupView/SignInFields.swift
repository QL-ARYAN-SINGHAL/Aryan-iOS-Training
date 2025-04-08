import SwiftUI

struct SignInFields: View {
    
    @StateObject var signInValidation = SignInValidation()
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var confirmPassword: String = ""
    @State private var age: String = "Age : "
    @State private var isFemale = false
    @State private var isMale = false
    @State private var isNonBinary = false
    @State private var selectedGender: String = "Select a gender"
    
    @State private var ageValue: Double = 12
    @State private var isGender = false
    @State private  var alertValidationType: alertType = .email
    
    enum alertType{
        case email,password
        case logout
    }
    var body: some View {
      
            
            
            NavigationStack{
                VStack {
                    
                    TextField("Email", text: $signInValidation.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundStyle(.black)
                        .background(Color.white)
                        .accentColor(.black)
                        .frame(width: 300, height: 35)
                        .border(.black)
                        .padding(.bottom, 15)
                    
                    TextField("Firstname", text: $firstName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundStyle(.black)
                        .background(Color.white)
                        .accentColor(.black)
                        .frame(width: 300, height: 35)
                        .border(.black)
                        .padding(.bottom, 15)
                    
                    TextField("Lastname", text: $lastName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundStyle(.black)
                        .background(Color.white)
                        .accentColor(.black)
                        .frame(width: 300, height: 35)
                        .border(.black)
                        .padding(.bottom, 15)
                    
                    SecureField("Password", text: $signInValidation.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundStyle(.black)
                        .background(Color.white)
                        .accentColor(.black)
                        .frame(width: 300, height: 35)
                        .border(.black)
                        .padding(.bottom, 15)
                    
                    TextField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundStyle(.black)
                        .background(Color.white)
                        .accentColor(.black)
                        .frame(width: 300, height: 35)
                        .border(.black)
                        .padding(.bottom, 15)
                    
                    TextField("Age", text: $age)
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundStyle(.black)
                    
                        .accentColor(.black)
                        .frame(width: 300, height: 35)
                    
                    
                    
                    Slider(value: $ageValue, in: 12...70, step: 1)
                        .padding(.horizontal,30)
                        .accentColor(.red)
                        .onChange(of: ageValue) {
                            age = "Age : \(Int($0))"
                        }
                        .frame(width : UIScreen.main.bounds.width*0.6)
                        .padding(.leading,-128)
                    
                    
                    VStack {
                        Text("Gender: \(selectedGender)")
                            .foregroundStyle(.black)
                            .font(.system(size: 18, weight: .bold))
                            .frame(width: 300, alignment: .leading)
                            .padding(.top, 10)

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
                                            selectedGender = "Female"
                                        } else if !isMale && !isNonBinary {
                                            selectedGender = "Select a gender"
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
                                            selectedGender = "Male"
                                        } else if !isFemale && !isNonBinary {
                                            selectedGender = "Select a gender"
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
                                            selectedGender = "Non-Binary"
                                        } else if !isFemale && !isMale {
                                            selectedGender = "Select a gender"
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
    SignInFields()
}
