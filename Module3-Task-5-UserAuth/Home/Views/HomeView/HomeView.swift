import SwiftUI

struct HomeView: View {
    @State private var showLogoutAlert = false
    @State private var isLoggedOut = false
    @State private var showProfile = false

    var body: some View {
        NavigationStack{
            VStack {
                ZStack {
                    HStack {
                        
                        Image("profileIcon")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .scaledToFit()
                            .onTapGesture {
                                showProfile = true
                            }
                            .padding(.leading, 10)
                            .padding(.top, 20)
                        
                        Spacer()
                        
                       
                        Image("LogOut")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .scaledToFit()
                            .onTapGesture {
                                showLogoutAlert = true
                            }
                            .padding(.trailing, 10)
                            .padding(.top, 20)
                    }

                 
                    Text("Home")
                        .font(Font.custom("Poppins-Medium", size: 30))
                        .foregroundColor(.black)
                        .bold()
                        .padding(.top, 20)
                }

                Divider()
                    .padding(.top, 3)
                    .background(.black)

                Spacer()

                NavigationLink(destination: WelcomePage(), isActive: $isLoggedOut) {
                    EmptyView()
                }
                NavigationLink(destination: ProfileView(), isActive: $showProfile) {
                    EmptyView()
                      
                }
               
            }
            .navigationBarHidden(true)
          
            .alert("Log Out", isPresented: $showLogoutAlert) {
                Button("Yes",role: .destructive) {
                    isLoggedOut = true
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Are you sure you want to log out?")
            }
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("Home")
    }
}

#Preview {
    HomeView()
}
