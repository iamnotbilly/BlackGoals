import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: GoalsViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                if(vm.isLoading) {
                    ProgressView()
                }
                    else {
                        if(vm.items.isEmpty) {
                            Text("Empty...")
                                .foregroundStyle(.white)
                        } else {
                            List {
                                ForEach(vm.items) { item in
                                    HStack{
                                        Image(systemName: item.isSuccessful ? "checkmark.circle.fill" : "circle")
                                            .foregroundStyle(item.isSuccessful ? Color.green : Color.red)
                                        Text(item.nameGoals)
                                            .foregroundStyle(.white)
                                    }
                                    .onTapGesture {
                                        vm.updateItem(item: item)
                                    }
                                }
                                .onDelete(perform: vm.delItem)
                                .onMove(perform: vm.moveItem)
                            }
                        }
                    }
                
            }
            .navigationTitle("Black Goals")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .foregroundStyle(.white)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack{
                        NavigationLink {
                            SuccessfulView()
                        } label: {
                            Image(systemName: "checkmark.rectangle.fill")
                                .foregroundStyle(.green)
                        }
                        NavigationLink {
                            AddView()
                        } label: {
                            Text("Add")
                                .foregroundStyle(.white)
                        }
                    }
                }
            })
        .fontWeight(.bold)
        }
        .preferredColorScheme(.dark)
    }
}
#Preview {
        ContentView()
            .environmentObject(GoalsViewModel())
}
