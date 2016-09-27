//
//  BackendManager.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import UIKit

enum Resul<T> {
    case success(data: T)
    case failure(message: String)
}

class BackendManager {

    // MARK: - PUBLIC -
    
    typealias FeedResult = Result<[RssParser.Item]>
    typealias FeedResultBlock = (_ result: FeedResult) -> Void
    
    public func loadFeed(url: String, completion: @escaping FeedResultBlock) {
        Alamofire.request(url).responseData { response in
            let result = self.handleFeedResponse(response)
            completion(result)
        }
    }
    
    typealias ImageResult = Result<Data>
    typealias ImageResultBlock = (_ result: ImageResult) -> Void
    
    public func loadImage(url: String, completion: @escaping ImageResultBlock) {
        Alamofire.request(url).responseImage { response in
            let result = self.handleImageResponse(response)
            completion(result)
        }
    }
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    private func handleFeedResponse(_ response: DataResponse<Data>) -> FeedResult {
        switch response.result {
        case .success(let data):
            return FeedResult.success(self.parseFeedData(data))
        case .failure(let error):
            return FeedResult.failure(error.localizedDescription as! Error)
        }
    }
    
    private func parseFeedData(_ data: Data) -> [RssParser.Item] {
        let parser = RssParser()
        parser.parse(data: data)
        return parser.items
    }
    
    private func handleImageResponse(_ response: DataResponse<UIImage>) -> ImageResult {
        switch response.result {
        case .success(let image):
            return ImageResult.success(UIImagePNGRepresentation(image)!)
        case .failure(let error):
            return ImageResult.failure(error.localizedDescription as! Error)
        }
    }
    
}
