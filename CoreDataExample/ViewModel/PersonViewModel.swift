//
//  PersonViewModel.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/4/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import Foundation

final class PersonViewModel {

    static var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }

    // MARK: - Stored Variables

    var person: Person

    // MARK: - Initialization

    init(person: Person) {
        self.person = person
    }

    // MARK: - Computed Variables

    var name: String? {
        return person.name
    }

    var day: String? {
        guard let date = person.birthday else {
            return nil
        }
        return PersonViewModel.dayFormatter.string(from: date as Date)
    }
}
