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
    
    let movies: [MovieDisplayModel]
    
    // MARK: - Init
    
    init(trending: Trending) {
        self.movies = trending.results.map { (result) -> MovieDisplayModel in
            return MovieDisplayModel(result: result)
        }
    }

    init(movies: [MovieDisplayModel]) {
        self.movies = movies
    }
    
    // MARK: Factory functions
    
    func with(trending: Trending) -> TrendingMoviesDisplayModel {
        var currentMovies = self.movies
        let updatedMovies = trending.results.map { (result) -> MovieDisplayModel in
            return MovieDisplayModel(result: result)
        }
        
        currentMovies.append(contentsOf: updatedMovies)

        return TrendingMoviesDisplayModel(movies: currentMovies)
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
