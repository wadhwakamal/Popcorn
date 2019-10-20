//
//  PopcornDependencyManager.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import UIKit

class PopcornDependencyManager: DependencyManager {
    
    
    // MARK: - Properties

    /// Shared instance.
    static let shared = PopcornDependencyManager()
    
    // MARK: Private properties
    private var _sharedRequestManager: RequestManager?
    
    // MARK: - Init Functions

    init() {
        _sharedRequestManager = nil
    }
    
    // MARK: - Protocol conformance

    // MARK: UtilityFactory
    
    func httpClient() -> HTTPClient {
        return AlamofireHTTPClient()
    }
    
    func requestManager() -> RequestManager {
        if _sharedRequestManager == nil {
            let requestManager = RequestManager(httpRequestFactory: HTTPRequestFactory(),
                                                httpClient: httpClient())
            _sharedRequestManager = requestManager
        }
        return _sharedRequestManager!
    }
}
