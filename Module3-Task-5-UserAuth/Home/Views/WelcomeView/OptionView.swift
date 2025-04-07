import SwiftUI

struct OptionView: View {
    var body: some View {
        NavigationStack {
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

            

       
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    OptionView()
}
