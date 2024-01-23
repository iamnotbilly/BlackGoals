import SwiftUI

struct AddView: View {
    @EnvironmentObject var vm: GoalsViewModel
    @Environment(\.dismiss) var dm
    @State var showAlert: Bool = false
    @State var txtGoals: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type something...", text: $txtGoals)
                    .padding()
                    .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.secondary)
                    )
                Button(action: save, label: {
                    Text("Done")
                        .foregroundStyle(.white)
                        .bold()
                        .padding(.horizontal, 10)
                        .padding()
                        .background(
                        RoundedRectangle(cornerRadius: 25.0)
                            .fill(Color.red)
                        )
                })
                Spacer()
            }
            .alert(isPresented: $showAlert) {
                alertShowing()
            }
            .navigationTitle("Add Goals")
        .padding()
        }
        .preferredColorScheme(.dark)
    }
    func isVerified() -> Bool {
        if(txtGoals.count < 4) {
            showAlert.toggle()
            return false
        }
        return true
    }
    func save() {
        if isVerified() {
            vm.addItem(name: txtGoals, isSuccessful: false)
            dm()
        }
    }
    func alertShowing() -> Alert {
        return Alert(title: Text("U must type at least 4 characters 😅"))
    }
}

#Preview {
        AddView()
            .environmentObject(GoalsViewModel())
}
