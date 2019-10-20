//
//  PopcornError.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 19/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

struct PopcornError: APIError, Decodable {

    /// An error identifier used for API error.
    let statusCode: Int

    /// A human (end user friendly) readable/comprehensible description of the error.
    let statusMessage: String

}

extension PopcornError {
    /// Error for mal-formatted JSON
    public static var invalidJSON: PopcornError {
        return PopcornError(statusCode: -1, statusMessage: "Invalid JSON response")
    }
}
