//
//  NSManagedObjectContext+Observers.swift
//  CoreDataExample
//
//  Created by Sargis on 10/5/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import CoreData
import Foundation

struct ObjectsDidChangeNotification {
    
    typealias Objects = Set<NSManagedObject>
    
    // MARK: - Properties
    
    fileprivate let notification: Notification
    
    // MARK: - Initialization Methods
    
    init(notification: Notification) {
        assert(notification.name == NSNotification.Name.NSManagedObjectContextObjectsDidChange)
        self.notification = notification
    }
    
    // MARK: - Computed Properties
    
    var insertedObjects: Objects {
        return objects(forKey: NSInsertedObjectsKey)
    }
    
    var updatedObjects: Objects {
        return objects(forKey: NSUpdatedObjectsKey)
    }
    
    var deletedObjects: Objects {
        return objects(forKey: NSDeletedObjectsKey)
    }
    
    var refreshedObjects: Objects {
        return objects(forKey: NSRefreshedObjectsKey)
    }
    
    var invalidatedObjects: Objects {
        return objects(forKey: NSInvalidatedObjectsKey)
    }
    
    var invalidatedAllObjects: Bool {
        let value = notification.userInfo?[NSInvalidatedAllObjectsKey]
        return value != nil
    }
    
    // MARK: - Private Methods
    
    fileprivate func objects(forKey key: String) -> Objects {
        let result = notification.userInfo?[key] as? Objects
        return result ?? Set()
    }
    
}

extension NSManagedObjectContext {
    func objectDidChangeNotificationObserver(_ completion: @escaping (ObjectsDidChangeNotification) -> Void) -> NSObjectProtocol {
        return NotificationCenter.default.addObserver(forName: NSNotification.Name.NSManagedObjectContextObjectsDidChange,
                                                      object: self,
                                                      queue: nil,
                                                      using: {
                        let not = ObjectsDidChangeNotification(notification: $0)
                        completion(not)
        })
    }
}
