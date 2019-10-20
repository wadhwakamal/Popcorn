//
//  HTTPRequestFactory.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

struct HTTPRequestFactory {
    
    // MARK: - Instance functions
    
    /// Base URL used for all requests.
    ///
    /// - Returns: Base URL.
    func baseURL() -> URL {
        return API.baseURL
    }
    
    func request(ofType requestType: HTTPRequestType) -> HTTPRequest {
        switch requestType {
        case .trending(let page):
            return trendingRequest(page: page)
        case .movie(let movieID):
            return movieRequest(movieID: movieID)
        }
    }
    
    private func trendingRequest(page: Int) -> HTTPRequest {
        let path = API.Movie.trending
        let queryItems: QueryItems = ["page": "\(page)"]
        
        return HTTPRequest(method: .get,
                           baseURL: baseURL(),
                           path: path,
                           queryItems: queryItems,
                           parameters: nil,
                           headers: nil)
    }
    
    private func movieRequest(movieID: Int) -> HTTPRequest {
        let path = API.Movie.movie + "\(movieID)"
        
        return HTTPRequest(method: .get,
                           baseURL: baseURL(),
                           path: path,
                           queryItems: nil,
                           parameters: nil,
                           headers: nil)
    }
}
