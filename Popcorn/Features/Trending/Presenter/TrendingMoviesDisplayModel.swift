//
//  TrendingMoviesDisplayModel.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

struct TrendingMoviesDisplayModel {
    
    // MARK: Properties
    
    /// Page number
    let page: Int
    
    /// Collection of movie display model
    let movies: [MovieDisplayModel]
    
    // MARK: Private Properties
    
    private let totalPages: Int
    
    // MARK: Computed Properties
    
    var isLastPage: Bool {
        return page == totalPages
    }
    
    // MARK: - Init
    
    init(trending: Trending) {
        self.page = trending.page
        self.totalPages = trending.totalPages
        self.movies = trending.results.map { (result) -> MovieDisplayModel in
            return MovieDisplayModel(result: result)
        }
    }

    init(page: Int, totalPages: Int, movies: [MovieDisplayModel]) {
        self.page = page
        self.totalPages = totalPages
        self.movies = movies
    }
    
    // MARK: Factory functions
    
    func with(trending: Trending) -> TrendingMoviesDisplayModel {
        var currentMovies = self.movies
        let updatedMovies = trending.results.map { (result) -> MovieDisplayModel in
            return MovieDisplayModel(result: result)
        }
        
        currentMovies.append(contentsOf: updatedMovies)

        return TrendingMoviesDisplayModel(page: trending.page,
                                          totalPages: trending.totalPages,
                                          movies: currentMovies)
    }
}

struct MovieDisplayModel {
    
    /// Movie ID
    let id: Int
    
    /// Movie title
    let title: String
    
    /// Poster image URL
    let posterImageURL: URL
    
    // MARK: - Init
    
    init(result: TrendingResult) {
        self.id = result.id
        self.title = result.title
        self.posterImageURL = URL(string: API.posterImagePath + result.posterPath)!
    }
}
