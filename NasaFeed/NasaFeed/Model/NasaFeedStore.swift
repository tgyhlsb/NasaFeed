//
//  NasaFeedStore.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import Foundation
import CoreData

class NasaFeedStore: CoreDataStore {
    
    // MARK: - PUBLIC -
    
    init() {
        super.init(name: "NasaFeed")
    }
    
    // MARK: Request factory
    
    public func requestForArticles() -> NSFetchRequest<Article> {
        let request = Article.fetchRequest() as NSFetchRequest<Article>
        request.sortDescriptors = [NSSortDescriptor(key: "sDate", ascending: false)]
        return request
    }
    
    public func fetchedResultsControllerForArticles() -> NSFetchedResultsController<Article> {
        let controller = NSFetchedResultsController(fetchRequest: self.requestForArticles(), managedObjectContext: self.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: "allArticles")
        return controller
    }
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    

}
