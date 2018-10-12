//
//  ManagedObjectObserver.swift
//  CoreDataExample
//
//  Created by Sargis on 10/5/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import CoreData
import Foundation

final class ManagedObjectObserver {
    enum ChangeType {
        case update
        case delete
    }

    // MARK: - Properties

    fileprivate var objectProtocol: NSObjectProtocol!

    // MARK: - Initialization / Deinitialization Methods

    init?(object: NSManagedObject, handler: @escaping (ChangeType) -> Void) {
        guard let context = object.managedObjectContext else { return nil }
        objectProtocol = context.objectDidChangeNotificationObserver { [weak self] note in
            guard let changeType = self?.changeType(of: object, in: note) else { return }
            handler(changeType)
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(objectProtocol)
    }

    // MARK: - Private Methods

    fileprivate func changeType(of object: NSManagedObject, in note: ObjectsDidChangeNotification) -> ChangeType? {
        let deleted = note.deletedObjects.union(note.invalidatedObjects)
        if note.invalidatedAllObjects || deleted.contains(object) {
            return .delete
        }
        let updated = note.updatedObjects.union(note.refreshedObjects)
        if updated.contains(object) {
            return .update
        }
        return nil
    }

}
