//
//  ISO3166.swift
//  CoreDataExample
//
//  Created by Sargis on 10/7/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import Foundation

struct ISO3166 {
    enum Country: Int16 {
        case ala = 248
        case afg = 004
        case alb = 008
        case dza = 012
        case asm = 016
        case and = 020
        case ago = 024
        case arm = 051
        case unknown = 0
    }
    
    enum Continent: String {
        case northAmerica = "NorthAmerica"
        case europe = "Europe"
        case africa = "Africa"
        case asia = "Asia"
        case southAmerica = "SouthAmerica"
        case oceania = "Oceania"
        case antarctica = "Antarctica"
    }
}

private let countriesAndContinents: [(ISO3166.Continent, ISO3166.Country)] = [
    (.europe, .ala),
    (.asia, .afg),
    (.europe, .alb),
    (.africa, .dza),
    (.oceania, .asm),
    (.europe, .and),
    (.africa, .ago),
    (.europe, .arm)
]

extension ISO3166.Continent {
    init?(country: ISO3166.Country) {
        let first = countriesAndContinents.first { $0.1 == country }
        guard let (continent, _) = first else { return nil }
        self = continent
    }
}

extension ISO3166.Country {
    static func fromISO3166(_ name: String) -> ISO3166.Country {
        switch name.lowercased() {
        case "ala": return .ala
        case "afg": return .afg
        case "alb": return .alb
        case "dza": return .dza
        case "asm": return .asm
        case "and": return .and
        case "ago": return .ago
        case "arm": return .arm
        default: return .unknown
        }
    }
}

extension ISO3166.Country {
    var threeLetterName: String {
        switch self {
        case .ala: return "ala"
        case .afg: return "afg"
        case .alb: return "alb"
        case .dza: return "dza"
        case .asm: return "asm"
        case .and: return "and"
        case .ago: return "ago"
        case .arm: return "arm"
        default: return "Unknown"
        }
    }
}

extension ISO3166.Country: CustomStringConvertible {
    var description: String { return threeLetterName }
}
