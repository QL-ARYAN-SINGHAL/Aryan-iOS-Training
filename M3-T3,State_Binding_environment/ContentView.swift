//
//  ContentView.swift
//  M3-T3,State_Binding_environment
//
//  Created by ARYAN SINGHAL on 03/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack {
            Text("Count: \(count)")
            Button("Increment") {
                count += 1 
            }
        }
    }
}

#Preview {
    ContentView()
}
