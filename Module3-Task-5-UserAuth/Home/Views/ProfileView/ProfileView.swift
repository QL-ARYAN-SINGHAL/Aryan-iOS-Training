import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile Details !")
                .font(Font.custom("Poppins-Medium", size: 25))
                .underline()
                .frame(maxWidth: .infinity)
                .padding(.top , 70)
                .padding(.leading, -120)
            
            ProfileFields()
                .padding(.top , -60)
                .background(.white)
                .opacity(0.95)
                .border(.gray)
                .cornerRadius(20)
                .shadow(radius: 5, x: 0, y: 0)
            
            Button(action: {
                
            }) {
                Text("Log Out")
                    .font(Font.custom("Poppins-Medium", size: 20))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red.opacity(0.85))
                    .cornerRadius(12)
                    .padding(.horizontal, 40)
            }
            
        }
    
    }
}

#Preview {
    ProfileView()
}
