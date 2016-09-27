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
    
    public func loadFeed(completion: @escaping BackendManager.FeedResultBlock) {
        self.backend.loadFeed(url: ModelManager.feedUrl) { (result) in
            switch result {
            case .success(let data):
                self.createArticles(from: data)
            default:
                break
            }
            completion(result)
        }
    }
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    private static let feedUrl = "http://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss"
    
    private let backend = BackendManager()
    
    private var newArticles = [Article]()
    
    private func createArticles(from data: [RssParser.Item]) {
        for info in data {
            let article = self.store.createArticle()
            article.title = info.title ?? "No title"
            article.text = info.text ?? "No text"
            article.date = info.formattedDate ?? Date()
            article.imageUrl = info.image
            self.newArticles.append(article)
        }
        self.fetchImageForNewArticles()
    }
    
    
    // Will fetch images one by one, instead of all at once
    private func fetchImageForNewArticles() {
        guard !self.newArticles.isEmpty else { return }
        let article = self.newArticles.removeFirst()
        self.fetchImage(for: article)
    }
    
    // Uses recursive calls with `fetchImageForNewArticles`
    private func fetchImage(for article: Article) {
        guard let url = article.imageUrl else {
            return self.fetchImageForNewArticles()
        }
        self.backend.loadImage(url: url) { result in
            switch result {
            case .success(let data):
                article.image = data.image
                article.thumbnail = data.thumbnail
            case .failure(let message):
                NSLog(message as! String)
            }
            self.fetchImageForNewArticles()
        }
    }

}
