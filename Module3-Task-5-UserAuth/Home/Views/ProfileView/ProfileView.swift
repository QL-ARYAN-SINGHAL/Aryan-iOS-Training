import SwiftUI

struct ProfileView: View {
    @State private var showLogoutAlert = false
    @State private var isLoggedOut = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Profile Details !")
                    .font(Font.custom("Poppins-Medium", size: 25))
                    .underline()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 70)
                    .padding(.leading, 20)

                ProfileFields()
                    .padding(.top, 20)
                    .background(Color.white)
                    .opacity(0.95)
                    .cornerRadius(20)
                    .shadow(radius: 5)

                Spacer()

                Button(action: {
                    showLogoutAlert = true
                }) {
                    Text("Log Out")
                        .font(Font.custom("Poppins-Medium", size: 20))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.85))
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                }
                .alert("Log Out", isPresented: $showLogoutAlert) {
                    Button("Yes") {
                        isLoggedOut = true
                    }
                    Button("Cancel", role: .cancel) {}
                } message: {
                    Text("Are you sure you want to log out?")
                }

               
                NavigationLink(destination: WelcomePage(), isActive: $isLoggedOut) {
                    
                    EmptyView() // it rperesents absence of a view
                }
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
}
