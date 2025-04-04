//
//  ModalPresentation.swift
//  NavigationStack
//
//  Created by ARYAN SINGHAL on 04/04/25.
//

//MARK: to fullscreen presentation of modal we use .fullscreencover and make a state to toggle such that if true then it is presented otherwise its false

//MARK: to make it visible only half of the screen we use .sheet and in .sheet we use presentationdetent to adjust the amount of view visible to us 

import SwiftUI

struct ModalPresentation: View {
    @State private var isPresented = false
    @State private var settingsDetent = PresentationDetent.medium
    var body: some View {
        NavigationStack{
            Button(action :{
                self.isPresented.toggle()
            } , label:
                    { Text("Present Modal")}
            )
            .navigationTitle("Modal presentation")
        }
   //     .fullScreenCover(isPresented: $isPresented, content: {SecondView1(isPresented: $isPresented)})
        .sheet(isPresented: $isPresented, content: {
            SecondView1(isPresented: $isPresented)
                .presentationDetents(
                    [.height(UIScreen.main.bounds.height * 0.65)],
                                    selection: $settingsDetent
                                 )})
       
        
    }
}

struct SecondView1: View {
    @Binding var isPresented : Bool
    var body: some View {
        VStack(spacing : 110){
            Text("Second View")
               .font(.title)
               .foregroundStyle(.white)
               .background(.black)
            
            Button(action : {
                isPresented.toggle()
            },label: {
                Text("Click here to dismiss modal")
            })
        }
        
    }
}

#Preview {
    ModalPresentation()
}
