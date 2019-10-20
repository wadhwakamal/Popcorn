//
//  Constants.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 19/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

enum API {
    static let baseURL = URL(string: "http://api.themoviedb.org/3")!
    static let key = "8eac22f4c24d01c480e4d99fef2edfc3"
    
    enum Movie {
        static let trending = "/trending/movie/week"
        static let movie = "/movie/"
    }
}
