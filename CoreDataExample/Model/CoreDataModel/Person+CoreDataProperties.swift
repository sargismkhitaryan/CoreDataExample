//
//  Person+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/25/18.
//  Copyright © 2018 Sargis. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var birthday: Date?
    @NSManaged public var name: String?
    @NSManaged fileprivate var favoriteDataColors: [Data]?
    @NSManaged public var country: Country?

}

extension Person {
    var favoriteColors: [UIColor]? {
        get {
            return favoriteDataColors?.colors
        }
        set {
            favoriteDataColors = newValue?.colorDataArray
        }
    }
}
