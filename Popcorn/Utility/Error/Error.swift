//
//  Error.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

protocol APIError: LocalizedError {

    /// An error identifier used for API error.
    var statusCode: Int { get }

    /// A human (end user friendly) readable/comprehensible description of the error.
    var statusMessage: String { get }

}
