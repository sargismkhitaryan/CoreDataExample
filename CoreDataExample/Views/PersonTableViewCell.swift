//
//  PersonTableViewCell.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/4/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    var personViewModel: PersonViewModel! {
        didSet {
            textLabel?.text = personViewModel.name
            detailTextLabel?.text = personViewModel.day
        }
    }

}
