import SwiftUI

struct ProfileFields: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var confirmPassword: String = ""
    @State private var age: String = "Age"
    @State private var gender: String = ""
    @State private var ageValue: Double = 12
    
    var body: some View {
        VStack {
            Text("Username")
                .font(Font.custom("Popins-Medium", size: 16))
                .padding(.leading , -152)
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
              
                .foregroundStyle(.black)
                .background(Color.white)
                .accentColor(.black)
                .frame(width: 300, height: 35)
                .border(.black)
                .cornerRadius(10)
                .padding(.bottom, 15)
                
            Text("Firstname")
                .font(Font.custom("Popins-Medium", size: 16))
                .padding(.leading , -152)
            TextField("Firstname", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundStyle(.black)
                .background(Color.white)
                .accentColor(.black)
                .frame(width: 300, height: 35)
                .border(.black)
                .cornerRadius(10)
                .padding(.bottom, 15)
            
            
            Text("Lastname")
                .font(Font.custom("Popins-Medium", size: 16))
                .padding(.leading , -152)
            TextField("Lastname", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundStyle(.black)
                .background(Color.white)
                .accentColor(.black)
                .frame(width: 300, height: 35)
                .border(.black)
                .cornerRadius(10)
                .padding(.bottom, 15)
            
            
            Text("Password")
                .font(Font.custom("Popins-Medium", size: 16))
                .padding(.leading , -152)
            TextField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundStyle(.black)
                .background(Color.white)
                .accentColor(.black)
                .frame(width: 300, height: 35)
                .border(.black)
                .cornerRadius(10)
                .padding(.bottom, 15)
            
           
            
            
            Text("Age")
                .font(Font.custom("Popins-Medium", size: 16))
                .padding(.leading , -152)
            TextField("Age", text: $age)
                .disabled(true)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundStyle(.gray)
                .background(Color.white)
                .accentColor(.black)
                .frame(width: 300, height: 35)
                .border(.black)
                .cornerRadius(10)
                .padding(.bottom, 5)
            
          
            Text("Gender")
                .font(Font.custom("Popins-Medium", size: 16))
                .padding(.leading , -152)
            
                .padding(.top , 10)
            TextField("Gender", text: $gender)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundStyle(.black)
                .background(Color.white)
                .accentColor(.black)
                .frame(width: 300, height: 35)
                .border(.black)
                .cornerRadius(10)
                .padding(.bottom, 15)
            
           
        }
        .frame(width: UIScreen.main.bounds.width*0.9 , height :UIScreen.main.bounds.height*0.6)
       
    }
}
#Preview{
    ProfileFields()
}




