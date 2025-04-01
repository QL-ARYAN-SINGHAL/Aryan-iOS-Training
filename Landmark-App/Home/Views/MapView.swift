//
//  MapView.swift
//  Landmark-App
//
//  Created by ARYAN SINGHAL on 01/04/25.
//

import SwiftUI
import MapKit


struct MapView: View {
    var coordinate : CLLocationCoordinate2D
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    
    private var region : MKCoordinateRegion{
        MKCoordinateRegion(
            center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
            
        )
        
    }
 
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 28.495420345118006, longitude: 77.40469913479744))
}
