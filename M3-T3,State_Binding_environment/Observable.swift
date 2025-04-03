//
//  Observable.swift
//  M3-T3,State_Binding_environment
//
//  Created by ARYAN SINGHAL on 03/04/25.
//

import SwiftUI
import Combine

@Observable
class Car{
    var name : String = ""
    var needsRepair : Bool = false
    
    init(name : String , needsRepair : Bool){
        self.name = name
        self.needsRepair = needsRepair
    }
}


struct Observable: View {
    
    @State var car = Car(name : "Tesla" , needsRepair: false)
    var body: some View {
        VStack{
            TextField("Enter your car name here", text: $car.name )
            Text("Car name \(car.name)" )
        }
        .padding()
    }
}
func render(cars: [Car]) {
    withObservationTracking {
        for car in cars {
            print(car.name)
        }
    } onChange: {
        print("Schedule renderer.")
    }
}

#Preview {
    Observable()
}
