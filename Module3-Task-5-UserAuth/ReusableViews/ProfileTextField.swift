import SwiftUI

struct ProfileTextField: View {
    var profileTextFieldPlaceholder: String = ""
    @Binding var profiletextFieldValue: String

    var body: some View {
        TextField(profileTextFieldPlaceholder, text: $profiletextFieldValue)
            .padding()
            .frame(height: 48)
            .background(Color(.systemGray6)) 
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            .font(.system(size: 16))
            .foregroundColor(.primary)
            .accentColor(.blue)
            .padding(.horizontal)
            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}
