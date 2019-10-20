//
//  HTTPClient.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

protocol HTTPClient {

    /// Performs a HTTP request.
    ///
    /// - Parameters:
    ///   - request: The request to use.
    ///   - completion: The completion block.
    func perform(request: HTTPRequest,
                 completion: @escaping (_ response: Data?, _ error: Error?) -> Void)

}
