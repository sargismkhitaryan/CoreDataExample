//
//  Person+Extensions.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/12/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import CoreData
import Foundation

extension Person: Managed {

    static var defaultSortDescriptor: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(birthday), ascending: false)]
    }

    static func insert(into context: NSManagedObjectContext, name: String, birthdate date: Date) -> Person {
        let person: Person = context.insertObject()
        person.birthday = date
        person.name = name
        return person
    }
}
