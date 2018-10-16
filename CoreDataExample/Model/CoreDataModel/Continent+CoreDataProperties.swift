//
//  Continent+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/16/18.
//  Copyright © 2018 Sargis. All rights reserved.
//
//

import Foundation
import CoreData

extension Continent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Continent> {
        return NSFetchRequest<Continent>(entityName: "Continent")
    }

}
