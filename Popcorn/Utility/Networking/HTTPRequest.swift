//
//  HTTPRequest.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 19/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]
typealias Headers = [String: String]
typealias QueryItems = [String: String]

/// HTTP request.
struct HTTPRequest {
    
    /// HTTP method.
    let method: HTTPMethod
    
    /// HTTP request base URL.
    let baseURL: URL
    
    /// HTTP request path.
    let path: String
    
    /// HTTP Query items.
    let queryItems: QueryItems?
    
    /// HTTP request parameters.
    let parameters: Parameters?
    
    /// HTTP request headers.
    let headers: Headers?
    
    /// HTTP endpoint. Combines the base URL and the path to be used for a HTTP call.
    var endpoint: URL {
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            return baseURL.appendingPathComponent(path)
        }
        
        components.path.append(path)
        let query = queryItems?.map { URLQueryItem(name: $0.key, value: $0.value) }
        components.queryItems = query
        return components.url ?? baseURL.appendingPathComponent(path)
    }
    
    /// Initializes a HTTP request.
    ///
    /// - Parameters:
    ///   - method: The HTTP method to use.
    ///   - baseURL: The HTTP base URL to use.
    ///   - path: The HTTP path to use.
    ///   - query: The HTTP query items to use.
    ///   - parameters: The HTTP parameters to use.
    ///   - headers: The HTTP headers to use.
    init(method: HTTPMethod,
         baseURL: URL,
         path: String,
         queryItems: QueryItems?,
         parameters: Parameters?,
         headers: Headers?) {
        self.method = method
        self.baseURL = baseURL
        self.path = path
        self.queryItems = queryItems
        self.parameters = parameters
        self.headers = headers
    }
    
}

extension HTTPRequest {
    
    /// Adds API key to HTTP request given an Environment.
    ///
    /// - Parameter environment: Environment determining API key.
    /// - Returns: HTTP Request.
    func withAPIKey(_ key: String) -> HTTPRequest {
        let apiKey = ["api_key": key]
        return self.withAdditionalQueryItems(apiKey)
    }
    
    func withAdditionalQueryItems(_ newQueryItems: QueryItems) -> HTTPRequest {
        let originalQueryItems = (queryItems == nil) ? [:] : queryItems!
        let finalQueryItems = originalQueryItems.combineWith(newQueryItems)
        
        
        return HTTPRequest(method: method,
                           baseURL: baseURL,
                           path: path,
                           queryItems: finalQueryItems,
                           parameters: parameters,
                           headers: headers)
    }
}

extension Dictionary {

    /// Adds elements of self to the passed-in dictionary and returns the result
    ///
    /// - Parameters:
    /// - dict: Dictionary to add
    /// - Returns: Result of adding dict's (key, value) pairs to self
    func combineWith<Key: Hashable, Value>(_ dict: [Key: Value]) -> [Key: Value] {
        var result = dict

        for (key, value) in self {
            if let key = key as? Key {
                result[key] = value as? Value
            }
        }

        return result
    }

}
