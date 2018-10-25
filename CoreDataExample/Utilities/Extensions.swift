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
        let green = UInt8(CIColor(color: self).green  * 255)
        let blue = UInt8(CIColor(color: self).blue  * 255)
        return [red, green, blue]
    }

    fileprivate convenience init(colorValues: [UInt8]) {
        let red = CGFloat(colorValues[0])
        let green = CGFloat(colorValues[1])
        let blue = CGFloat(colorValues[2])
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

extension Sequence where Iterator.Element == Data {
    public var colors: [UIColor]? {
        return map { UIColor(colorValues: [UInt8]($0)) }
    }
}

extension Sequence where Iterator.Element == UIColor {
    public var colorDataArray: [Data] {
        return map { Data($0.rgb) }
    }
}
