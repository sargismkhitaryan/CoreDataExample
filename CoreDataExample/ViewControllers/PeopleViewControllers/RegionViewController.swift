//
//  RegionViewController.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/16/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit
import CoreData

class RegionViewController: UIViewController {

    // MARK: - Properties

    static let addRegion = "AddRegionSegue"
    static let regionCell = "RegionCell"

    var managedObjectContext: NSManagedObjectContext!

    fileprivate var dataSource: CoreDataTableViewDataSource<RegionViewController>!

    // MARK: - IBOutlet Variables

    @IBOutlet var tableView: UITableView!

    // MARK: - Overriden Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRegions()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == RegionViewController.addRegion {
            guard let destinationVC = segue.destination as? AddRegionViewController else {
                fatalError("The type of View Controller is false.")
            }
            destinationVC.delegate = self
        }
    }

    // MARK: - Private Methods

    fileprivate func setupRegions() {
        createPeopleContainer { [weak self] container in
            self?.managedObjectContext = container.viewContext
            self?.setupTableView()
        }
    }

    fileprivate func setupTableView() {
        let request = Region.sortedFetchRequest
        request.fetchLimit = 20

        let frc = NSFetchedResultsController<Region>(fetchRequest: request,
                                             managedObjectContext: managedObjectContext,
                                             sectionNameKeyPath: nil,
                                             cacheName: nil)

        dataSource = CoreDataTableViewDataSource(tableView: tableView,
                                                 cellId: RegionViewController.regionCell,
                                                 resultsController: frc,
                                                 delegate: self)
    }

}

extension RegionViewController: CoreDataTableViewDataSourceDelegate {
    func configure(_ cell: UITableViewCell, for object: Region) {
        cell.textLabel?.text = object.name
//        let viewModel = PersonViewModel(person: object)
//        cell.personViewModel = viewModel
    }
}

extension RegionViewController: AddRegionViewControllerDelegate {
    func addRegion(_ name: String) {
        managedObjectContext.performChanges {
            _ = Country.insert(context: self.managedObjectContext, name: name)
        }
    }
}
