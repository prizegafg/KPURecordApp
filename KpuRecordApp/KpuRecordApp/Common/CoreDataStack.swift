//
//  CoreDataStack.swift
//  KpuRecordApp
//
//  Created by Prizega  on 26/08/23.
//

import Foundation

import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "KPURecordData")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var managedContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
