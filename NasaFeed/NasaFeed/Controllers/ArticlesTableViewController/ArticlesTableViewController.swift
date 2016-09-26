//
//  ArticlesTableViewController.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import UIKit
import CoreData

class ArticlesTableViewController: CoreDataTableViewController<Article> {
    
    // MARK: - PUBLIC -
    
    public var delegate: ArticlesTableViewControllerDelegate?
    
    public init(fetchedResultsController: NSFetchedResultsController<Article>) {
        super.init(style: .plain, fetchedResultsController: fetchedResultsController)
    }
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
    }
    
}
