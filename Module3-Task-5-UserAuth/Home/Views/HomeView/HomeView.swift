import SwiftUI

struct HomeView: View {
    @State private var showLogoutAlert = false
    @State private var isLoggedOut = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Home")
                        .font(Font.custom("Poppins-Medium", size: 30))
                        .foregroundColor(.black)
                        .bold()
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Image("LogOut")
                        .frame(width: 2, height: 2)
                      
                        .onTapGesture {
                            showLogoutAlert = true
                        }
                }
                
                Divider()
                    .padding(.top, 3)
                    .background(.black)
                
                Spacer()
                
                // Navigation to WelcomePage when logged out
                NavigationLink(destination: WelcomePage(), isActive: $isLoggedOut) {
                    EmptyView()
                }
            }
            .navigationBarHidden(true)
            .alert("Log Out", isPresented: $showLogoutAlert) {
                Button("Yes") {
                    isLoggedOut = true // Handle logout logic here
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Are you sure you want to log out?")
            }
        }
    }
}


#Preview {
    HomeView()
}
