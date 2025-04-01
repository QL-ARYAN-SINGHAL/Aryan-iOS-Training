//
//  LandmarkList.swift
//  Landmark-App
//
//  Created by ARYAN SINGHAL on 01/04/25.
//

import SwiftUI


struct LandmarkList: View {
    
    var body: some View {
        
//MARK: Here the list is taking array ladnamrks which was holding the decoded json data , and is made identifiable by passing identifiable protcol in landmark 
        
        NavigationSplitView{
            List(landmarks){
                landmark in
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                }
                label: {
                    LandmarkRow(landmark : landmark)
                }
            }.listStyle(InsetListStyle())
            
                .navigationTitle(Text("Landmarks : "))
                
        } detail:{
            Text("Select a landmark to see more details")
        }
        }
}

#Preview {
    LandmarkList()
}
