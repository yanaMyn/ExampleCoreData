//
//  CoreDataManager.swift
//  ExampleCoreData
//
//  Created by yana mulyana on 28/01/20.
//  Copyright © 2020 LinkAJa. All rights reserved.
//

import Foundation
import CoreData

public class CoreDatamanager {
    
    static var shared = CoreDatamanager()
    lazy var context = persistentContainer.viewContext
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ExampleCoreData")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    func save() {
        guard context.hasChanges else { return }
        do {
            try context.save()
            print("success saved")
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
    
    func fetch<T: NSManagedObject>(objectType: T.Type) -> [T] {
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let fetchedObjects = try context.fetch(fetchRequest) as? [T]
            return fetchedObjects ?? [T]()
        } catch {
            print(error)
            return [T]()
        }
    }
    
    func delete(object: NSManagedObject) {
        context.delete(object)
        save()
    }
    
}
