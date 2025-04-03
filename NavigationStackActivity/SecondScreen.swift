import SwiftUI

struct SecondScreen: View {
    let items: [DataModel]
    let selectedItem: String
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(items) { item in
                    NavigationLink(item.text, value: item)
                }
            }
            .navigationTitle(selectedItem)
            .navigationDestination(for: DataModel.self){
                item in
                LastScreen(items: SampleData.lastScreenData, selectedItem: item.text)
            }
        }
       
        
        
    }
}

#Preview {
    SecondScreen(items: SampleData.secondScreenData, selectedItem: "")
}
