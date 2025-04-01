//
//  ModalData.swift
//  Landmark-App
//
//  Created by ARYAN SINGHAL on 01/04/25.
//

// MARK: WE ARE CREATING A LOAD FUNCTION THAT FETCHES THE JSON DATA WITH NAME AND HANDLES ERROR

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

// Creating a generic function that has parameter filename
func load<T: Decodable>(_ fileName: String) -> T {
    
    let data: Data
    // error handling for file name.
    // To read the url in our main app we use Bundle.main.url that fetches the data and returns if present if not then gives nil, meaning that it is optional and we have to unwrap it
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Could not find \(fileName) in bundle")
    }
    
    // checking the Data in the file if present or not
    do {
        data = try Data(contentsOf: file)
    }
    catch {
        fatalError("Could not load file name \(fileName) because of error -> \(error)")
    }
    
    // json decoder to decode the json data into usable format.
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch {
        fatalError("Could not decode the json data \(error)")
    }
}
