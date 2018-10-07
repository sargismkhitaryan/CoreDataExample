//
//  Region.swift
//  CoreDataExample
//
//  Created by Sargis on 10/7/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import CoreData
import Foundation

final class Region: NSManagedObject {
    @NSManaged fileprivate var iso3166: Int16
}
