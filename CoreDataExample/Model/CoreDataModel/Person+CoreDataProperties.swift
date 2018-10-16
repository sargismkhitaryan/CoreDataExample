//
//  Person+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/16/18.
//  Copyright © 2018 Sargis. All rights reserved.
//
//

import Foundation
import CoreData

extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var birthday: Date?
    @NSManaged public var name: String?

}
