import SwiftUI


struct LandmarkRow: View {
    var landmark: Landmark


    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 100, height: 60)
                .padding(.leading)
                .clipShape(Circle())
                .overlay{Circle().stroke(.gray , lineWidth: 2)}
                
            Text(landmark.name)
                .font(.title2)
                .multilineTextAlignment(.leading)
            

            Spacer()
        }
    }
}


#Preview {
    LandmarkRow(landmark: landmarks[0])
}

#Preview{
    LandmarkRow(landmark: landmarks[1])
}
