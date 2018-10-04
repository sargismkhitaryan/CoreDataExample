//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Sargis on 10/2/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit
import CoreData

class PeopleViewController: UIViewController {
    
    // MARK: - Properties
    
    var peopleContext: NSManagedObjectContext!
    
    @IBOutlet var tableView: UITableView!
    
    fileprivate var dataSource: CoreDataTableViewDataSource<PeopleViewController>!
    
    // MARK: - Overriden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPeople()
    }
    
    // MARK: - Private Methods
    
    fileprivate func setupPeople() {
        createPeopleContainer { [weak self] container in
            self?.peopleContext = container.viewContext
            self?.setupTableView()
        }
    }
    
    fileprivate func setupTableView() {
        let request = Person.sortedFetchRequest
        request.fetchBatchSize = 20
        let frc = NSFetchedResultsController(fetchRequest: request, managedObjectContext: peopleContext, sectionNameKeyPath: nil, cacheName: nil)
        dataSource = CoreDataTableViewDataSource(tableView: tableView, cellId: "PersonCell", resultsController: frc, delegate: self)
    }

}

extension PeopleViewController: UITableViewDelegate {
}

extension PeopleViewController: CoreDataTableViewDataSourceDelegate {
    func configure(_ cell: PersonTableViewCell, for object: Person) {
        let viewModel = PersonViewModel(person: object)
        cell.personViewModel = viewModel
    }
}