//
//  LandmarkList.swift
//  Landmark-App
//
//  Created by ARYAN SINGHAL on 01/04/25.
//

import SwiftUI


struct LandmarkList: View {
    @Environment(ModalData.self) var modelData
    @State private var showFavsOnly = false
    
    var filteredList : [Landmark]{
        modelData.landmarks.filter{landmark in
            (!showFavsOnly || landmark.isFavorite)
        }
    }
    
    
    
    var body: some View {
        
        //MARK: Here the list is taking array ladnamrks which was holding the decoded json data , and is made identifiable by passing identifiable protcol in landmark
        
        NavigationSplitView{
            List{
                Toggle(isOn: $showFavsOnly){
           //         navigationTitle(Text("Favorite Landmarks list"))
                    Text("Favorites only ")
                        .offset(x: 130)
                        .font(.title2)
                }
                ForEach(filteredList) {
                    landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    }
                    label: {
                        LandmarkRow(landmark : landmark)
                    }
                }.listStyle(InsetListStyle())
            }
            .animation(.default, value: filteredList)
         
                .navigationTitle(Text("Landmarks : "))
            
            } detail:{
                Text("Select a landmark to see more details")
            }
        }
    }

#Preview {
    LandmarkList()
        .environment(ModalData())
}
