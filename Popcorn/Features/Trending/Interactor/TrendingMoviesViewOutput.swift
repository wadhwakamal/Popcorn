//
//  TrendingMoviesViewOutput.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

protocol TrendingMoviesViewOutput {
    
    /// Return true if loading the next page.
    var isLoading: Bool { get }
    
    /// Get Trending Movies
    /// - Parameter page: Page number
    func getTrendingMovies()
    
    /// Get trending movies next page
    func getTrendingMoviesNextPage()
}
