//
//  HTTPRequestType.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

enum HTTPRequestType {
    case trending(page: Int)
    case movie(movieID: Int)
}
