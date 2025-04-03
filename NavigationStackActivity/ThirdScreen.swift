import SwiftUI

struct LastScreen: View {
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
            .navigationDestination(for: DataModel.self ){
                item in
                FourthScreen(items: SampleData.fourthScreenData, selectedItem: item.text)
            }
        }
       
       
    }
}

#Preview {
    LastScreen(items: SampleData.firstScreenData, selectedItem: "")
}
