//
//  State.swift
//  M3-T3,State_Binding_environment
//
//  Created by ARYAN SINGHAL on 03/04/25.
//

import SwiftUI

struct StateView: View {
    @State private var count = 0
    var body: some View {
      
        VStack{
            Text("Value f count is \(count)")
            BindingView(countValue : $count)
           
        }
       
    }
}

struct BindingView: View {
    @Binding var countValue : Int
    var body: some View {
        VStack{
            Button("incremented "){
                countValue = countValue + 5
            }
            Text("Value of count is \(countValue)")}
    }
    
    
}

#Preview {
    StateView()
}
