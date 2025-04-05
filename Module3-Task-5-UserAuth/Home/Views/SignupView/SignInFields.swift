import SwiftUI

struct SignInFields: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var confirmPassword: String = ""
    @State private var age: String = "12"
    @State private var gender: String = ""
    @State private var ageValue: Double = 12
    
    var body: some View {
        VStack {
            
            TextField("Username", text: $username)
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
            
            TextField("Password", text: $password)
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
                .onChange(of: ageValue) {
                    age = "Age : \(Int($0))"
                }
            
            TextField("Gender", text: $gender)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundStyle(.black)
                .background(Color.white)
                .accentColor(.black)
                .frame(width: 300, height: 35)
                .border(.black)
                .padding(.bottom, 15)
            
            Button(action: {
               
                
                
            }, label: {
                Text(" Sign In ")
                    .font(.custom("Poppins-Medium", size: 18))
                    .frame(maxWidth: 300)
                    .frame(height: 48)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            })
        }
    }
}
