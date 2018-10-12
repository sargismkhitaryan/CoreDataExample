//
//  Country+Extensions.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/12/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import CoreData
import Foundation

extension Country: Managed {

    static var defaultSortDescriptor: [NSSortDescriptor] {
        return [NSSortDescriptor(key: #keyPath(name), ascending: true)]
    }

}
