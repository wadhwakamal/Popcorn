//
//  TrendingMoviesService.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

protocol TrendingMoviesService {
    
    /// Get Trending Movies
    /// - Parameter page: Page number
    /// - Parameter completion: Result as Trending or Error
    func getTrendingMovies(page: Int,
                        completion: @escaping (Trending?, Error?) -> Void)

}


