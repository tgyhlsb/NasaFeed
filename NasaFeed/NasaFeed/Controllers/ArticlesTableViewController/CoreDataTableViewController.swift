// Credits: https://github.com/5amfung/CoreDataTableViewController/blob/master/CoreDataTableViewController.swift

import UIKit
import CoreData


class CoreDataTableViewController<T: NSManagedObject>: UITableViewController, NSFetchedResultsControllerDelegate {
    
    init(style: UITableViewStyle, fetchedResultsController: NSFetchedResultsController<T>) {
        self.fetchedResultsController = fetchedResultsController
        super.init(style: style)
        self.performFetch()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let fetchedResultsController: NSFetchedResultsController<T>
    
    // MARK: - Fetching
    
    func performFetch() {
        try! self.fetchedResultsController.performFetch()
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.fetchedResultsController.sections?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = self.fetchedResultsController.sections else { return 0 }
        return sections.reduce(0) { $0 + $1.numberOfObjects }
    }
    
    // MARK: - NSFetchedResultsControllerDelegate
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>){
        self.tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView.endUpdates()
    }
    
     func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        let indexSet = IndexSet(integer: sectionIndex)
        switch type {
        case .insert: self.tableView.insertSections(indexSet, with: .fade)
        case .delete: self.tableView.deleteSections(indexSet, with: .fade)
        default: break
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?){
        
        switch type {
        case .insert:
            self.tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            self.tableView.deleteRows(at: [indexPath!], with: .fade)
        case .update:
            self.tableView.reloadRows(at: [indexPath!], with: .fade)
        case .move:
            self.tableView.deleteRows(at: [indexPath!], with: .fade)
            self.tableView.insertRows(at: [newIndexPath!], with: .fade)
        }
    }

}
