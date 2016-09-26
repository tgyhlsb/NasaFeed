//
//  ModelManager.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import Foundation

class ModelManager {
    
    // MARK: - PUBLIC -
    
    public let store = NasaFeedStore()
    
    public func loadFeed(completion: (_ success: Bool) -> Void) {
        self.backend.loadFeed(url: ModelManager.feedUrl) { (result) in
            print(result)
        }
    }
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    private static let feedUrl = "http://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss"
    
    private let backend = BackendManager()

}
