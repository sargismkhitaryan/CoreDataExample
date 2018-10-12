//
//  PersonStack.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/3/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import CoreData

func createPeopleContainer(completion: @escaping (NSPersistentContainer) -> Void) {
    let container = NSPersistentContainer(name: "PeopleModel")
    container.loadPersistentStores { (_, error) in
        guard error == nil else {
            fatalError("Failed to load store. Error: \(error!)")
        }
        completion(container)
    }
}
