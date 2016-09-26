//
//  RootViewController.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, ArticlesTableViewControllerDelegate {
    
    // MARK: - PUBLIC -
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    private var articlesViewController: ArticlesTableViewController!
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initializeArticlesViewController()
    }
    
    // MARK: Initialization
    
    private func initializeArticlesViewController() {
        let controller = ArticlesTableViewController()
        
        controller.willMove(toParentViewController: self)
        self.view.addSubview(controller.view)
        controller.view.layoutToFillSuperView()
        self.addChildViewController(controller)
        
        controller.delegate = self
        
        self.articlesViewController = controller
    }

}
