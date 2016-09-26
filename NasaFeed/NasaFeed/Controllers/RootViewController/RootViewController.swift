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
    
    init(model: ModelManager) {
        self.model = model
        super.init(nibName: "RootViewController", bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - INTERNAL -
    
    // MARK: ArticlesTableViewControllerDelegate
    
    internal func articlesTableViewController(_ controller: ArticlesTableViewController, didSelect article: Article) {
        let destination = ArticleViewController(article: article)
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: - PRIVATE -
    
    private let model: ModelManager
    
    private var articlesViewController: ArticlesTableViewController!
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeArticlesViewController()
    }
    
    // MARK: Initialization
    
    private func initializeArticlesViewController() {
        let fetchedResultsController = self.model.store.fetchedResultsControllerForArticles()
        let controller = ArticlesTableViewController(fetchedResultsController: fetchedResultsController)
        
        controller.willMove(toParentViewController: self)
        self.view.addSubview(controller.view)
        controller.view.layoutToFillSuperView()
        self.addChildViewController(controller)
        
        controller.delegate = self
        
        self.articlesViewController = controller
    }

}
