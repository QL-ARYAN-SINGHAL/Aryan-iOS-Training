import SwiftUI

struct OptionView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer(minLength: 20)

            Image("AuthImage")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.top , 5)

            Text("QuickAuth ensures secure and seamless authentication for users, prioritizing speed and reliability.")
                .foregroundColor(.black)
                .font(.custom("Poppins-Medium", size: 16))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)

            VStack(spacing: 12) {
                Button(action: {
                
                }) {
                    Text("Sign In")
                        .font(.custom("Poppins-Medium", size: 18))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .frame(width: 300 )

                Button(action: {
                  
                }) {
                    Text("Log In")
                        .font(.custom("Poppins-Medium", size: 18))
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .frame(width: 300 )
            }
            .padding(.horizontal, 32)

            Spacer(minLength: 20)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding(.horizontal, 16)
    }
}

#Preview {
    OptionView()
}
