import SwiftUI

@main
struct BlackGoalsApp: App {
    @StateObject var vm: GoalsViewModel = GoalsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
