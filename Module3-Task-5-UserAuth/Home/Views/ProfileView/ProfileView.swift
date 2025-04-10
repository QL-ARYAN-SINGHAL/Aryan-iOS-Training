import SwiftUI

struct ProfileView: View {
    @State private var showLogoutAlert = false
    @State private var isLoggedOut = false

    var body: some View {
        NavigationStack {
      
                Image("ProfileBackground")
                .frame(width: 200,height: 100)
                .padding(.top,-300)
            
                    
            VStack {
                    
                    ProfileImage()
                    .offset(y:-20)

                    ProfileFields()
                        .padding(.top, 20)
                        .background(Color.white)
                        .opacity(0.95)
                        .cornerRadius(20)
                        .shadow(radius: 5)

                }
                .frame(maxWidth: UIScreen.main.bounds.width*0.8,alignment: .center)
                .padding(.top,100)
            }
  
    }
}

#Preview {
    ProfileView()
}
