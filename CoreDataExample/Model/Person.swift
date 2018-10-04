//
//  Person.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/4/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import Foundation
import CoreData

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
