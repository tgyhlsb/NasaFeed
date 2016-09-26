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
        return Article.fetchRequest()
    }
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    

}
