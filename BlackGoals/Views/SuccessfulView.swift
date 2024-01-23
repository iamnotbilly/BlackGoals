import SwiftUI

struct SuccessfulView: View {
    @EnvironmentObject var vm: GoalsViewModel
    var body: some View {
        NavigationStack {
            ZStack {
                if(vm.isLoading) {
                    ProgressView()
                } else {
                    List(vm.items) { item in
                        if item.isSuccessful {
                            HStack {
                            Image(systemName: item.isSuccessful ? "checkmark.circle" : "circle")
                                .foregroundStyle(item.isSuccessful ? Color.green : Color.red)
                            Text(item.nameGoals)
                                .foregroundStyle(.white)
                        }
                            .onTapGesture {
                                vm.updateItem(item: item)
                            }
                    }
                    }
                }
            } .navigationTitle("Successful Goals")
        } .preferredColorScheme(.dark)
    }
}

#Preview {
        SuccessfulView()
            .environmentObject(GoalsViewModel())
}
