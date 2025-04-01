//
//  Circular-Image.swift
//  Landmark-App
//
//  Created by ARYAN SINGHAL on 01/04/25.
//

import SwiftUI

struct Circular_Image: View {
    var image :Image
    var body: some View {
        image
            .clipShape(Circle())
                .overlay{
                    Circle().stroke(Color.purple, lineWidth: 3)
                    
                }
                .shadow(radius: 4)
        
                }
}

#Preview {
    Circular_Image(image: Image("QL"))
}
