//
//  AddRegionViewController.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/16/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit

protocol AddRegionViewControllerDelegate: class {
    func addRegion(_ name: String)
}

class AddRegionViewController: UIViewController {

    weak var delegate: AddRegionViewControllerDelegate?

    // MARK: - IBOutlet Variables

    @IBOutlet weak var regionTextField: UITextField!

    // MARK: - Overriden Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        regionTextField.becomeFirstResponder()
    }

    // MARK: Action Methods

    @IBAction func doneButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        guard let name = regionTextField.text, !name.isEmpty else {
            return
        }
        delegate?.addRegion(name)
    }

}
