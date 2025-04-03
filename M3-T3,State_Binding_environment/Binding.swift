//
//  Binding.swift
//  M3-T3,State_Binding_environment
//
//  Created by ARYAN SINGHAL on 03/04/25.
//

import SwiftUI

struct ParentView: View {
    @State private var toggleState = false
    
    var body: some View {
        VStack {
            ChildView(isToggled: $toggleState)
            Text("Toggle State: \(toggleState.description)")
        }
    }
}


struct ChildView: View {
    @Binding var isToggled: Bool
    
    var body: some View {
        Toggle("", isOn: $isToggled)
    }
}

#Preview {
    ParentView()
}
