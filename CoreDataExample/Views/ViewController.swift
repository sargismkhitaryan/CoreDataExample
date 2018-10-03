//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Sargis on 10/2/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var peopleContext: NSManagedObjectContext? {
        didSet {
            print("people context: \(peopleContext)")
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPeople()
    }
    
    // MARK: - Private Methods
    
    fileprivate func setupPeople() {
        createPeopleContainer { [weak self] container in
            self?.peopleContext = container.viewContext
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}

