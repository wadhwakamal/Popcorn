//
//  TrendingMoviesPresenter.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

/// Trending movies presenter
final class TrendingMoviesPresenter: TrendingMoviesInteractorOutput {
    // MARK: Properties
    
    /// Trending movies view
    var view: TrendingMoviesView!
    
    // MARK: Private Properties
    
    /// Trending movies display model
    private var lastDisplayModel: TrendingMoviesDisplayModel!
    
    // MARK: TrendingMoviesInteractorOutput protocol conformance
    
    func didLoadTrendingMovies(trending: Trending) {
        if let displayModel = lastDisplayModel {
            lastDisplayModel = displayModel.with(trending: trending)
        } else {
            lastDisplayModel = TrendingMoviesDisplayModel(trending: trending)
        }
        view.updateDisplay(lastDisplayModel!)
    }
}
