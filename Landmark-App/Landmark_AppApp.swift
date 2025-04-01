//
//  Landmark_AppApp.swift
//  Landmark-App
//
//  Created by ARYAN SINGHAL on 01/04/25.
//

import SwiftUI

@main //This shows the netry point of your application
struct Landmark_AppApp: App {
    @State private var modelData = ModalData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
