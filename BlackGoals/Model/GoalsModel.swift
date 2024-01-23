import Foundation

struct GoalsModel: Identifiable, Codable {
    let id: String
    let nameGoals: String
    let isSuccessful: Bool
    
    init(id: String = UUID().uuidString, nameGoals: String, isSuccessful: Bool) {
        self.id = id
        self.nameGoals = nameGoals
        self.isSuccessful = isSuccessful
    }
    
    func update() -> GoalsModel {
        return GoalsModel(id: id, nameGoals: nameGoals, isSuccessful: !isSuccessful)
    }
}
