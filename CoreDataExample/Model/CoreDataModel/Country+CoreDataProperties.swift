//
//  Country+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/12/18.
//  Copyright © 2018 Sargis. All rights reserved.
//
//

import Foundation
import CoreData

extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var name: String?

}
