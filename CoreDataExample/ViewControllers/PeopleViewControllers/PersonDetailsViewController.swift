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
            observer = ManagedObjectObserver(object: person, handler: { [weak self] type in
                switch type {
                case .delete:
                    _ = self?.navigationController?.popViewController(animated: true)
                case .update:
                    break
                }
            })
        }
    }

    var personViewModel: PersonViewModel! {
        didSet {
            updateView()
        }
    }

    fileprivate var observer: ManagedObjectObserver?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!

    // MARK: - Overriden Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    // MARK: - Action Methods

    @IBAction func deleteButtonPressed(_ sender: Any) {
        let context = person.managedObjectContext
        context?.performChanges {
            context?.delete(self.person)
        }
    }
    // MARK: - Private Methods

    fileprivate func updateView() {
        nameLabel?.text = "Name: \(personViewModel.name ?? "")"
        birthdayLabel?.text = "Birthday: \(personViewModel.day ?? "")"
    }

}
