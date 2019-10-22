//
//  TrendingMoviesInteractor.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

/// Trending movies interactor
class TrendingMoviesInteractor: TrendingMoviesViewOutput {
    
    /// Presenter.
    var presenter: TrendingMoviesInteractorOutput!

    /// Trending movies service.
    let service: TrendingMoviesService
    
    // MARK: Private properties
    
    /// Page number for current page in pagination
    private var pageNumber = 1
    
    /// Indicates if user reached at the last page
    private var didReachLastPage = false
    
    /// Page is loding
    private(set) var isLoading = false
    
    // MARK: Init
    
    /// Initialise trending movies interactor
    /// - Parameter service: Trending movies service.
    init(service: TrendingMoviesService) {
        self.service = service
    }
    
    // MARK: TrendingMoviesViewOutput protocol conformance
    
    func getTrendingMovies() {
        isLoading = true
        service.getTrendingMovies(page: pageNumber) { [weak self] (trending, error) in
            if let error = error {
                print(error)
            }
            
            if let trending = trending {
                if trending.page == trending.totalPages {
                    self?.didReachLastPage = true
                }
                self?.pageNumber = trending.page + 1
                self?.presenter.didLoadTrendingMovies(trending: trending)
            }
            self?.isLoading = false
        }
    }
    
    func getTrendingMoviesNextPage() {
        guard !isLoading && !didReachLastPage else {
            return
        }
        getTrendingMovies()
    }
}
