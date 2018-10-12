//
//  AddPersonViewController.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/4/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

protocol AddPersonViewControllerDelegate: class {
    func didAdd(name: String, date: Date)
}

class AddPersonViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!

    weak var delegate: AddPersonViewControllerDelegate!

    // MARK: - Overriden Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.becomeFirstResponder()
        setupDayPicker()
    }

    // MARK: - Action Methods

    @IBAction func doneButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        delegate.didAdd(name: name, date: Date())
    }

    // MARK: - Private Methods

    fileprivate func setupDayPicker() {
        birthdayDatePicker.maximumDate = Date()
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let day = Date()
        var components = DateComponents()
        components.year = -100
        let minDate = calendar.date(byAdding: components, to: day)
        birthdayDatePicker.minimumDate = minDate
    }
}
