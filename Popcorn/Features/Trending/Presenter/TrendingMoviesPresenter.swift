//
//  TrendingMoviesPresenter.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

final class TrendingMoviesPresenter: TrendingMoviesInteractorOutput {
    
    var view: TrendingMoviesView!
    
    private var lastDisplayModel: TrendingMoviesDisplayModel!
    
    func didLoadTrendingMovies(trending: Trending) {
        if let displayModel = lastDisplayModel {
            lastDisplayModel = displayModel.with(trending: trending)
        } else {
            lastDisplayModel = TrendingMoviesDisplayModel(trending: trending)
        }
        view.updateDisplay(lastDisplayModel!)
    }
}
