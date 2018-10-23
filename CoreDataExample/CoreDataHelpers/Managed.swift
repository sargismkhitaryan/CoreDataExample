//
//  Managed.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/3/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import CoreData

protocol Managed: class, NSFetchRequestResult {
    static var entityName: String { get }
    static var defaultSortDescriptor: [NSSortDescriptor] { get }
}

extension Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        return []
    }

    static var sortedFetchRequest: NSFetchRequest<Self> {
        let request = NSFetchRequest<Self>(entityName: entityName)
        request.sortDescriptors = defaultSortDescriptors
        return request
    }
}

extension Managed where Self: NSManagedObject {
    static var entityName: String {
        return entity().name!
    }

    static func fetch(in context: NSManagedObjectContext,
                      configurationBlock: ((NSFetchRequest<Self>) -> Void)? = nil) -> Self? {
        let request = NSFetchRequest<Self>(entityName: Self.entityName)
        configurationBlock?(request)
        do {
            let result = try context.fetch(request).first
            return result
        } catch {
            fatalError("The Fetch request is throw error!")
        }
    }

    static func materializedObject(in context: NSManagedObjectContext, matching predicate: NSPredicate) -> Self? {
        for object in context.registeredObjects where !object.isFault {
            if let result = object as? Self, predicate.evaluate(with: object) {
                return result
            }
        }
        return nil
    }

    static func findOrFetch(in context: NSManagedObjectContext, matching predicate: NSPredicate) -> Self? {
        if let object = materializedObject(in: context, matching: predicate) {
            return object
        }
        let result = fetch(in: context) {
            $0.predicate = predicate
            $0.returnsObjectsAsFaults = false
            $0.fetchLimit = 1
        }
        return result
    }

    static func findOrCreate(in context: NSManagedObjectContext,
                             matching predicate: NSPredicate,
                             configureBlock: (Self) -> Void) -> Self {
        if let result = findOrFetch(in: context, matching: predicate) {
            return result
        }
        let object: Self = context.insertObject()
        configureBlock(object)
        return object
    }
}
