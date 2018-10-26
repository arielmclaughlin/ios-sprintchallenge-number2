import Foundation

class ShoppingItem: Codable, Equatable {
    static func == (lhs: ShoppingItem, rhs: ShoppingItem) -> Bool {
        return lhs.name == rhs.name &&
        lhs.inShoppingList == rhs.inShoppingList &&
        lhs.imageData == rhs.imageData
    }
    
    var name: String
    var inShoppingList: Bool
    var imageData: Data
    
    init(name: String, inShoppingList: Bool, imageData: Data) {
        self.name = name
        self.inShoppingList = inShoppingList
        self.imageData = imageData
    }
}
