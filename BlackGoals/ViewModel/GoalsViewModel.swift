import Foundation

class GoalsViewModel: ObservableObject {
    let key: String = "item_key"
    @Published var isLoading: Bool = false
    @Published var items: [GoalsModel] = [] {
        didSet{
            saveData()
        }
    }
    init() {
        getData()
    }
    func getData() {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decodedData = try? JSONDecoder().decode([GoalsModel].self, from: data) else {
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.items = decodedData
            self.isLoading = false
        }
    }
    func delItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func updateItem(item: GoalsModel) {
        if let itemIndex = items.firstIndex(where: {$0.id == item.id}) {
            items[itemIndex] = item.update()
        }
    }
    func addItem(name: String, isSuccessful: Bool) {
        items.append(GoalsModel(nameGoals: name, isSuccessful: isSuccessful))
    }
    func saveData() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }
}
