//
//  TrendingMoviesInteractor.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

class TrendingMoviesInteractor: TrendingMoviesViewOutput {
    
    /// Presenter.
    var presenter: TrendingMoviesInteractorOutput!

    /// Trending movies service.
    let service: TrendingMoviesService
    
    init(service: TrendingMoviesService) {
        self.service = service
    }
    
    func getTrendingMovies(page: Int) {
        service.getTrendingMovies(page: page) { [weak self] (trending, error) in
            if let error = error {
                print(error)
            }
            
            if let trending = trending {
                self?.presenter.didLoadTrendingMovies(trending: trending)
            }
        }
    }
}
