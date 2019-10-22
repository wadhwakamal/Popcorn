//
//  TrendingMoviesInteractorOutput.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

protocol TrendingMoviesInteractorOutput {
    
    /// Indicates trending movies were loaded successfully
    /// - Parameter trending: Trending
    func didLoadTrendingMovies(trending: Trending)
}
