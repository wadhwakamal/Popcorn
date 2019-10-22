//
//  RequestManager.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 19/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

final class RequestManager {
    /// HTTP Request factory.
    let httpRequestFactory: HTTPRequestFactory
    
    /// HTTP Client
    let httpClient: HTTPClient
    
    /// JSON decoder
    let decoder: JSONDecoder
    
    init(httpRequestFactory: HTTPRequestFactory,
         httpClient: HTTPClient,
         decoder: JSONDecoder = JSONDecoder()) {
        self.httpRequestFactory = httpRequestFactory
        self.httpClient = httpClient
        self.decoder = decoder
    }
    
    // MARK: - Instance functions

    /// Performs HTTP Request along with other behaviors specific to Hibbett requests.
    ///
    /// - Parameters:
    ///   - request: Request.
    ///   - completion: Completion with model when successful, error otherwise.
    private func perform<T: Decodable>(requestType: HTTPRequestType, completion: @escaping (T?, Error?) -> Void) {
        
        let request = httpRequestFactory.request(ofType: requestType)
            .withAPIKey(API.key)
        httpClient.perform(request: request) { (data, error) in
            if let error = error {
                completion(nil, error)
                return
            } else {
                self.decodeData(data, completion: completion)
            }
            
        }
    }
    
    private func decodeData<T: Decodable>(_ data: Any?, completion: @escaping (T?, Error?) -> Void) {
        guard let data = data as? Data else {            
            completion(nil, PopcornError.invalidJSON)
            return
        }

        do {
            let model = try decoder.decode(T.self, from: data)
            completion(model, nil)
        } catch {
            completion(nil, PopcornError.invalidJSON)
        }
    }
}

extension RequestManager: TrendingMoviesService {
    func getTrendingMovies(page: Int,
                           completion: @escaping (Trending?, Error?) -> Void) {
        perform(requestType: .trending(page: page), completion: completion)
    }
}
