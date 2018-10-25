//
//  Array+Extensions.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/25/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

extension UIColor {
    fileprivate var rgb: [UInt8] {
        let red = UInt8(CIColor(color: self).red)
        let green = UInt8(CIColor(color: self).green)
        let blue = UInt8(CIColor(color: self).blue)
        return [red, green, blue]
    }
}

extension Sequence where Iterator.Element == UIColor {
    public var colorDataArray: [Data] {
        return map { Data($0.rgb) }
    }
}
