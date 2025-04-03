import SwiftUI

struct FourthScreen: View {
    let items: [DataModel]
    let selectedItem: String
    @State private var path = [DataModel]()
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                List {
                    ForEach(items) { item in
                        Text(item.text)
                    }
                }
            }
            HStack{
                Button("Jump to specific"){
                    specifficJump()
                }
                .padding()
                Button("Pop to root"){
                    popToRoot()
                }
            }
            .padding()
           
            .navigationTitle(selectedItem)
        }
        
        
    }
    func specifficJump(){
        path = [
            SampleData.fourthScreenData[1],
            SampleData.secondScreenData[1]
        ]
    }
    func popToRoot(){
        path.removeAll()
    }
}

#Preview {
    FourthScreen(items: SampleData.fourthScreenData, selectedItem: "")
}
