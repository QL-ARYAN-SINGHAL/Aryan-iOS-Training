//
//  Landmark.swift
//  Landmark-App
//
//  Created by ARYAN SINGHAL on 01/04/25.
//

import Foundation
import CoreLocation
import SwiftUI

// MARK: Here we are setting the landmark data model
struct Landmark: Hashable, Codable,Identifiable {
    
    let name, category, city, state: String
    let id: Int
    let isFeatured, isFavorite: Bool
    let park: String
    let description : String
    // creating a variable that is an instance of the modifier Image()
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // here it is the instance of the coordinates from core location that calculates lat and lon and stores into locationCoordinates
    private var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
  
}
struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
