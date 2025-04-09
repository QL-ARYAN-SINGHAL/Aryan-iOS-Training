import SwiftUI

struct SignInView: View{
  
    @StateObject var signUpViewModal: LogInValidation
    @State var progressValue : Double = 0.0


    var body: some View {
        VStack {
            Text("SignUp")
                .font(Font.custom("Poppins-Medium", size: 25))
                .frame(width: 100, height: 120)
                .padding(.leading, -150)
                .padding(.top, -20)
            
            SignInFields(signUpValidation: signUpViewModal)
                .padding(.top, -30)
            
           
            Divider()
                .background(.black)
            
            Text("Progress : \(signUpViewModal.value, specifier: "%.2f")%")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            
            HStack {
                Text("0%")
                ProgressView(value: signUpViewModal.value, total: 100.0)
                    .frame(width: 200, height: 20)
                Text("100%")
            }
        }
       
    }


}


