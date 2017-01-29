import Foundation
import CoreData


class CoreDataStack
{
    private let modelName: String
    init(modelName: String)
    {
        self.modelName = modelName
    }
    private lazy var storeContainer: NSPersistentContainer =
        {
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores {
            (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
}
