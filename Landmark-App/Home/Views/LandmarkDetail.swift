//
//  LandmarkDetail.swift
//  Landmark-App
//
//  Created by ARYAN SINGHAL on 01/04/25.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    var body: some View {
        ScrollView{
            MapView(coordinate: landmark.locationCoordinates)
                .frame(width:400 ,height:300 )
            
            Circular_Image(image: landmark.image)
                .padding(.bottom, -130)
                .offset(y: -100)
                
            VStack(alignment: .leading) {
                
                Text(landmark.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                        .multilineTextAlignment(.center)
                        .padding(.top,30)
                        .padding(.leading,20)
                  
                    
                HStack {
                    Text(landmark.category)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color.green)
                        .multilineTextAlignment(.leading)
                        .padding(.leading,20)
                    Spacer()
                    
                    Text(landmark.city)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 20)
                }
                
                    
                }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            Divider()
            Text("About \(landmark.name)")
                .font(.title2)
                .fontWeight(.bold)
                .padding( 20)
                .lineLimit(0)
            Text(landmark.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding( 10)
                
            
            
        }
        
        .padding()
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    
    
    }
}

#Preview {
    LandmarkDetail(landmark: landmarks[1])
}
