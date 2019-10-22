//
//  TrendingMoviesView.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import Foundation

protocol TrendingMoviesView {
    /// Updates display given display model.
    ///
    /// - Parameter displayModel: Display model.
    func updateDisplay(_ displayModel: TrendingMoviesDisplayModel)
}
