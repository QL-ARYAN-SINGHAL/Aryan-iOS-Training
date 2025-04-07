import SwiftUI

struct SignInFields: View {
    
    @StateObject var signInValidation = SignInValidation()
   
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var confirmPassword: String = ""
    @State private var age: String = "Age : 12"

    @State private var ageValue: Double = 12
    @State private var isGender = false
    @State private  var alertValidationType: alertType = .email
    
    enum alertType{
        case email,password
        case logout
    }
    var body: some View {
        
       
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
                .disabled(true) 
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundStyle(.gray)
                .background(Color.white)
                .accentColor(.black)
                .frame(width: 300, height: 35)
                .border(.black)
                .padding(.bottom, 5)
            
            Slider(value: $ageValue, in: 12...70, step: 1)
                .padding(.horizontal,30)
                .accentColor(.red)
                .onChange(of: ageValue) {
                    age = "Age : \(Int($0))"
                }
                .frame(width : UIScreen.main.bounds.width*0.5)
            
            HStack {
                Text("Gender")
                    .foregroundStyle(.black)
                    .background(Color.white)
                    .accentColor(.black)
                    .font(Font.custom("", size: 19))
                    .bold()
                
                Spacer()

                HStack {
                    Text("Female")
                    Toggle(isOn: $isGender) {}
                        .labelsHidden()
                        .accentColor(.blue)
                    Text("Male")
                        
                }
                .frame(width: 180)
                .padding(.trailing,-20)
            }
            .frame(width: 300)
            .padding()

           

            
            Button(action: {
                //MARK: ffuntion calling for validation on clock of the button
                signInValidation.isEmailValid()
                signInValidation.isPassword()
            }, label: {
                Text(" Sign In ")
                    .font(.custom("Poppins-Medium", size: 18))
                    .frame(maxWidth: 300)
                    .frame(height: 48)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            })
//MARK: ALERTS FOR VALIDATION PURPOSE
            .alert(isPresented: $signInValidation.showAlert) {
                
                switch alertValidationType{
                case .email:
                    Alert(title: Text("Invalid Email"),
                          message: Text("Please enter a valid email address."),
                          dismissButton: .default(Text("OK")))
                case .password:
                    Alert(title: Text("Invalid Password"),
                          message: Text("Include at least two uppercase letters (e.g., A, B). \nInclude at least one special character (e.g., @, #, $, etc.). \nInclude at least two digits (e.g., 0, 1, 9).\nInclude at least three lowercase letters (e.g., a, b, c).\nBe exactly 8 characters long."),
                          dismissButton: .default(Text("OK")))
                }
                            
                          }
          
         
            
            
            
            
            
            
        }
    }
}

#Preview{
    SignInFields()
}
