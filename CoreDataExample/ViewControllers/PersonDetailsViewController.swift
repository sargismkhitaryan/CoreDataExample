//
//  PersonDetailsViewController.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/5/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

class PersonDetailsViewController: UIViewController {

    // MARK: - Properties
    
    var person: Person! {
        didSet {
            personViewModel = PersonViewModel(person: person)
        }
    }
    
    var personViewModel: PersonViewModel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    // MARK: - Private Methods
    
    fileprivate func updateView() {
        nameLabel.text = "Name: \(personViewModel.name ?? "")"
        birthdayLabel.text = "Birthday: \(personViewModel.day ?? "")"
    }

}
