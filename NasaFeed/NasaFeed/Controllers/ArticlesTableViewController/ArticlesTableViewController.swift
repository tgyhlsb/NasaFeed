//
//  ArticlesTableViewController.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import UIKit

class ArticlesTableViewController: UITableViewController {
    
    // MARK: - PUBLIC -
    
    public var delegate: ArticlesTableViewControllerDelegate?
    
    public init() {
        super.init(style: .plain)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
    }
    
}
