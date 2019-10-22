//
//  TrendingMoviesBuildable.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 21/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import UIKit

protocol TrendingMoviesBuildable {
    /// Builds Trending movies feature injected with dependencies.
    ///
    /// - Returns: Trending movies view.
    func build() -> UIViewController
}
