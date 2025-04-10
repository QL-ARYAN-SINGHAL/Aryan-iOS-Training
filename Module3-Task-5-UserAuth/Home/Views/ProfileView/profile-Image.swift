//
//  Circular-Image.swift
//  Landmark-App
//
//  Created by ARYAN SINGHAL on 01/04/25.
//

import SwiftUI

struct ProfileImage: View {
    var body: some View {
        Image("user")
            .resizable()
            .frame(width: 100,height: 100)
            .scaledToFit()
            
            .clipShape(Circle())
                .overlay{
                    Circle().stroke(Color.blue, lineWidth: 3)
                    
                }
                .shadow(radius: 4)
        
                }
}

