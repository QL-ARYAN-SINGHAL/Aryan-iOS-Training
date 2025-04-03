import SwiftUI

struct ContentView: View {
    var mentorsList = ["Abhishek Choudhary", "Himanshu Kesharwani", "Himanshu Patil", "Aryan Singhal"]
   
    
    var body: some View {
        VStack{
            NavigationStack {
                VStack {
                    FirstScreen(items: SampleData.firstScreenData, selectedItem: "First Screen")
                    List {
                        ForEach(mentorsList, id: \.self) { mentor in
                            NavigationLink(value: mentor) {
                                Text(mentor)
                            }
                        }
                    }
                }
                .navigationDestination(for: DataModel.self) { item in
                    SecondScreen(items: SampleData.secondScreenData, selectedItem: item.text)
                }
                .navigationDestination(for: String.self) { item in
                    Text(item)
                }
            }
        }
        
        
       
        .padding()
    }
    
}

#Preview {
    ContentView()
}
