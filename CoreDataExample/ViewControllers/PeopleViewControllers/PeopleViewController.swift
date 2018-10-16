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

    static let addPersonSegue = "AddPersonSegue"
    static let personDetailsSegue = "PersonDetailsSegue"

    var peopleContext: NSManagedObjectContext!

    @IBOutlet var tableView: UITableView!

    fileprivate var dataSource: CoreDataTableViewDataSource<PeopleViewController>!

    // MARK: - Overriden Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPeople()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PeopleViewController.addPersonSegue {
            guard let destinationVC = segue.destination as? AddPersonViewController else {
                fatalError("Wrong type of View Controller")
            }
            destinationVC.delegate = self
        } else if segue.identifier == PeopleViewController.personDetailsSegue {
            guard let person = sender as? Person else {
                fatalError("Wrong sender type")
            }
            guard let destinationVC = segue.destination as? PersonDetailsViewController else {
                fatalError("Wrong type of View Controller")
            }
            destinationVC.person = person
        }
    }

    // MARK: - Action Methods

    @IBAction func addPersonButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: PeopleViewController.addPersonSegue, sender: nil)
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
        let frc = NSFetchedResultsController(fetchRequest: request,
                                             managedObjectContext: peopleContext,
                                             sectionNameKeyPath: nil,
                                             cacheName: nil)
        dataSource = CoreDataTableViewDataSource(tableView: tableView,
                                                 cellId: "PersonCell",
                                                 resultsController: frc,
                                                 delegate: self)
    }

}

extension PeopleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let actions = [UITableViewRowAction(style: .default, title: "Delete", handler: { (_, indexPath) in
            self.peopleContext.performChanges {
                let person = self.dataSource.object(at: indexPath)
                self.peopleContext.delete(person)
            }
        })]
        return actions
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = dataSource.object(at: indexPath)
        performSegue(withIdentifier: PeopleViewController.personDetailsSegue, sender: person)
    }
}

extension PeopleViewController: CoreDataTableViewDataSourceDelegate {
    func configure(_ cell: PersonTableViewCell, for object: Person) {
        let viewModel = PersonViewModel(person: object)
        cell.personViewModel = viewModel
    }
}

extension PeopleViewController: AddPersonViewControllerDelegate {
    func didAdd(name: String, date: Date) {
        peopleContext.performChanges {
            _ = Person.insert(into: self.peopleContext, name: name, birthdate: date)
        }
    }
}
