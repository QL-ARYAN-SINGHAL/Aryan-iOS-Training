//
//  ContentView.swift
//  NavigationStack
//
//  Created by ARYAN SINGHAL on 04/04/25.
//

import SwiftUI
struct View1: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            Button("Go to view 2") {
                path.append("View2")
                print(path)
            }
            .background(Color.red)
            .navigationDestination(for: String.self) { route in
                switch route{
                case "View2":
                    View2(path: $path)
                case "View3":
                    View3(path: $path)
                case "View4":
                    View4(path: $path)
                default : Text("Not Found")
                }
            }
        }
    }
}

struct View2: View {
    @Binding var path: NavigationPath
    
    var body: some View {
        Button("Go to view 3") {
            path.append("View3")
            print(path)
        }
        .background(Color.orange)
    }
}

struct View3: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var path: NavigationPath
    
    var body: some View {
        Button("View4") {
            path.append("View4")
            print(path)
       //     path.removeLast()
          
        }
        .background(Color.yellow)
        Button("Back to previous view"){
            path.removeLast()
            print(path)
        }
        .background(Color.green)
    }
}

struct View4 : View{
    @Binding var path: NavigationPath
    var body: some View{
        Button("Click here to go to root view "){
            path.removeLast(path.count)
            print(path)
        }
        .background(Color.blue)
        .foregroundStyle(.white)
        Button("Click here to go to second view "){
            path.removeLast(path.count-1)
            print(path.count)
        }
    }
}
#Preview {
    View1()
}
