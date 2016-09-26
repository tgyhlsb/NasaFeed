//
//  BackendManager.swift
//  NasaFeed
//
//  Created by Tanguy Hélesbeux on 26/09/2016.
//  Copyright © 2016 Tanguy Helesbeux. All rights reserved.
//

import Foundation
import Alamofire

class BackendManager {

    // MARK: - PUBLIC -
    
    enum Result {
        case success
        case failure(message: String)
    }
    
    typealias ResultBlock = (_ result: Result) -> Void
    
    public func loadFeed(url: String, completion: @escaping ResultBlock) {
        Alamofire.request(url).responseData { (response) in
            let result = self.handleFeedResponse(response)
            completion(result)
        }
    }
    
    // MARK: - INTERNAL -
    
    // MARK: - PRIVATE -
    
    private func handleFeedResponse(_ response: DataResponse<Data>) -> Result {
        switch response.result {
        case .success(let data):
            self.parseFeedData(data)
            return .success
        case .failure(let error):
            return .failure(message: error.localizedDescription)
        }
    }
    
    private func parseFeedData(_ data: Data) {
        let parser = RssParser()
        parser.parse(data: data)
        print(parser.elements)
    }
    
    
    
}
