//
//  ArticlesTableViewControllerDelegate.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import UIKit

protocol ArticlesTableViewControllerDelegate {
    
    // MARK: Mandatory
    
    // MARK: Optional
    
    func articlesTableViewController(_ controller: ArticlesTableViewController, didSelect article: AnyObject)
    
}

extension ArticlesTableViewControllerDelegate {
    
    // MARK: Optional
    
    func articlesTableViewController(_ controller: ArticlesTableViewController, didSelect article: AnyObject) {}
    
}
