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
            /* Fetch People from the persistent store.
            let request = Person.sortedFetchRequest
            request.fetchBatchSize = 20
            let frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: peopleContext!, sectionNameKeyPath: nil, cacheName: nil)
            frc.delegate = self
            try? frc.performFetch()
            let person = frc.object(at: IndexPath(row: 0, section: 0))
            print("persons: \(frc.fetchedObjects?.count)")
            */
            
            /* Insert the person to the persistent store
            peopleContext?.performChanges {
                _ = Person.insert(into: self.peopleContext!, name: "Sargis", birthdate: Date())
            }
             */
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

/* The Fetch Result Controller Delegate
extension ViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("controller will change context")
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        print("controller did change value")
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("controller did change content")
    }
}
 */
