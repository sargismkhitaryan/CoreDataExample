//
//  Region+Extension.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/16/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import CoreData
import Foundation

extension Region: Managed {
    static var defaultSortDescriptor: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(name), ascending: false)]
    }

    static func insert(context: NSManagedObjectContext, name: String) -> Region {
        let region: Region = context.insertObject()
        region.name = name
        return region
    }
}
