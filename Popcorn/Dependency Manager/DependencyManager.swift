//
//  DependencyManager.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

protocol DependencyManager: UtilityFactory {
    
}

protocol UtilityFactory {
    func httpClient() -> HTTPClient
    func requestManager() -> RequestManager
}
