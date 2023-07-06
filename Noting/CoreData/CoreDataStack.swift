//
//  CoreDataStack.swift
//  Noting
//
//  Created by Ethan Huang on 7/4/23.
//

import Foundation
import CoreData

class CoreDataStack {
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    // MARK: - Stack Initialization
    private lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var moc: NSManagedObjectContext = self.persistentContainer.viewContext
    
    // MARK: - Saving support
    
    func saveContext() {
        guard moc.hasChanges else { return }
        do {
            try moc.save()
        } catch let nserror as NSError {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    // MARK: - Retrieving Data
    func getData(entity: String, key: String? = nil, ascending: Bool = false) -> [NSFetchRequestResult]? {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
        if key != nil {
            let sortDescriptor = NSSortDescriptor(key: key, ascending: ascending)
            fetchRequest.sortDescriptors = [sortDescriptor]
        }
        do {
            let fetchedObjects = try moc.fetch(fetchRequest)
            return fetchedObjects
        } catch {
            print("Could not load data", error)
        }
        return nil
    }
    
    
    // MARK: - Entity Setup
    
    private func createFolder(name: String, icon: String, iconColor: String) {
        let f = Folder(context:moc)
        f.name = name
        f.icon = icon // FIXME: change to UIImage(systemName:)
        f.iconColor = iconColor // FIXME: change to UIColor transformative
    }
    
    private func createLabel(name: String, color: String) {
        let l = Label(context: moc)
        l.name = name
        l.color = color // FIXME: change to UIColor transformative
    }
    
    func populateEntities() {
        // check that all things exist. if so, leave
        let entities = [K.CData.labelEntity, K.CData.folderEntity]
        var hasPopulated = false
    
        
        for entity in entities {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entity)
            
            do {
                let fetchedObjects = try moc.fetch(fetchRequest)
                guard fetchedObjects.isEmpty else { continue }
                hasPopulated = true
                
                switch entity {
                case K.CData.labelEntity:
                    createLabel(name: "Important", color: "systemRed")
                case K.CData.folderEntity:
                    createFolder(name: "All Documents", icon: "doc.fill", iconColor: "systemBlue")
                    createFolder(name: "Starred", icon: "star.fill", iconColor: "systemYellow")
                    createFolder(name: "Archived", icon: "archivebox.fill", iconColor: "systemGreen")
                    createFolder(name: "Trash", icon: "trash.fill", iconColor: "systemRed")
                default:
                    break
                }
            } catch {
                print("issue populateEntities", error)
            }
        }
        
        guard hasPopulated else { return }
        guard let saveError = try? moc.save() else { return }
        print("populateEntities saveError", saveError)
    }
}
