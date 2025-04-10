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
        ScrollView{
            VStack {
                Text("User Name")
                    .font(Font.custom("Popins-Medium", size: 16))
                    .foregroundStyle(.blue)
                    .padding(.leading , -152)
                
                ProfileTextField(profileTextFieldPlaceholder: "User Name", profiletextFieldValue: $username)
                    
                Text("First Name")
                    .font(Font.custom("Popins-Medium", size: 16))
                    .foregroundStyle(.blue)
                    .padding(.leading , -152)
                
                ProfileTextField(profileTextFieldPlaceholder: "First Name", profiletextFieldValue: $firstName)
                
                
                Text("Last Name")
                    .font(Font.custom("Popins-Medium", size: 16))
                    .foregroundStyle(.blue)
                    .padding(.leading , -152)
                
                ProfileTextField(profileTextFieldPlaceholder: "Last Name", profiletextFieldValue: $lastName)
                
                
                Text("Password")
                    .font(Font.custom("Popins-Medium", size: 16))
                    .foregroundStyle(.blue)
                    .padding(.leading , -152)
                ProfileTextField(profileTextFieldPlaceholder: "Password", profiletextFieldValue: $password)
                
               
                
                
                Text("Age")
                    .font(Font.custom("Popins-Medium", size: 16))
                    .foregroundStyle(.blue)
                    .padding(.leading , -152)
                ProfileTextField(profileTextFieldPlaceholder: "Age", profiletextFieldValue: $age)
                
              
                Text("Gender")
                    .font(Font.custom("Popins-Medium", size: 16))
                    .foregroundStyle(.blue)
                    .padding(.leading , -152)
                    .padding(.top , 10)
                
                ProfileTextField(profileTextFieldPlaceholder: "Gender", profiletextFieldValue: $gender)
                
               
            }
        }
       
        .frame(width: UIScreen.main.bounds.width*0.9 , height :UIScreen.main.bounds.height*0.6)
       
    }
}
#Preview{
    ProfileFields()
}




