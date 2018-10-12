//
//  SingleSectionTableViewDataSource.swift
//  CoreDataExample
//
//  Created by Sargis Mkhitaryan on 10/4/18.
//  Copyright © 2018 Sargis. All rights reserved.
//

import UIKit
import CoreData

protocol CoreDataTableViewDataSourceDelegate: AnyObject {
    associatedtype Object: NSFetchRequestResult
    associatedtype Cell: UITableViewCell

    func configure(_ cell: Cell, for object: Object)
}

class CoreDataTableViewDataSource<Delegate: CoreDataTableViewDataSourceDelegate>: NSObject,
                                UITableViewDataSource,
                                NSFetchedResultsControllerDelegate {
    typealias Object = Delegate.Object
    typealias Cell = Delegate.Cell

    // MARK: - Properties

    let cellId: String
    let tableView: UITableView
    let fetchedResultsController: NSFetchedResultsController<Object>
    fileprivate weak var delegate: Delegate!

    required init(tableView: UITableView,
                  cellId: String,
                  resultsController: NSFetchedResultsController<Object>,
                  delegate: Delegate) {
        self.tableView = tableView
        self.cellId = cellId
        self.fetchedResultsController = resultsController
        self.delegate = delegate
        super.init()
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Fetch Controller can't perform fetch")
        }

        tableView.dataSource = self
        tableView.reloadData()
    }

    // MARK: - Public Methods

    func object(at indexPath: IndexPath) -> Object {
        return fetchedResultsController.object(at: indexPath)
    }

    // MARK: - NSFetchedResultsControllerDelegate Methods

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let indexPath = newIndexPath else {
                fatalError("IndexPath can't be nil")
            }
            tableView.insertRows(at: [indexPath], with: .automatic)
        case .update:
            guard let indexPath = indexPath else {
                fatalError("IndexPath can't be nil")
            }
            guard let cell = tableView.cellForRow(at: indexPath) as? Cell else {
                break
            }
            let object = fetchedResultsController.object(at: indexPath)
            delegate?.configure(cell, for: object)
        case .move:
            guard let indexPath = indexPath else {
                fatalError("IndexPath can't be nil")
            }
            guard let newIndexPath = newIndexPath else {
                fatalError("New index path can't be nil")
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .delete:
            guard let indexPath = indexPath else {
                fatalError("IndexPath can't be nil")
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }

    // MARK: - UITableViewDataSource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = fetchedResultsController.sections?[section] else {
            return 0
        }
        return section.numberOfObjects
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? Cell else {
            fatalError("Unexpected Cell type at indexPath: \(indexPath)")
        }
        let object = fetchedResultsController.object(at: indexPath)
        delegate?.configure(cell, for: object)
        return cell
    }

}
