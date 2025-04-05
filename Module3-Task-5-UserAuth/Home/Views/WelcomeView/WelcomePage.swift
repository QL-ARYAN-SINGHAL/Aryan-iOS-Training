import SwiftUI

struct WelcomePage: View {
    var body: some View {
        ZStack {
            Image("Main-Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Spacer(minLength: 100)

                Text("QUICKAUTH")
                    .font(.system(size: 40, weight: .medium))
                    .underline()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .padding(.horizontal)

                Text("Seamless Access at Your Fingertips !")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .minimumScaleFactor(0.5)

                Spacer()

                OptionView()
                    .frame(maxWidth: .infinity)
                    .frame(height: 400)
              
                 
                    
            }
        }
    }
}

#Preview {
    WelcomePage()
}
