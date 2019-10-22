//
//  TrendingMoviesBuilder.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 21/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import UIKit

final class TrendingMoviesBuilder: TrendingMoviesBuildable {
    // MARK: - Properties

    /// Dependency manager.
    let dependencyManager: DependencyManager

    // MARK: - Init/Deinit

    init(dependencyManager: DependencyManager) {
        self.dependencyManager = dependencyManager
    }
    
    // MARK: - Protocol conformance

    // MARK: TrendingMoviesBuildable

    func build() -> UIViewController {
        let view = buildView()
        let interactor = buildInteractor()
        let presenter = buildPresenter()
        let router = buildRouter()

        view.interactor = interactor
        view.router = router
        interactor.presenter = presenter
        presenter.view = view

        return UINavigationController(rootViewController: view)
    }
    
    // MARK: Private instance functions

    private func buildView() -> TrendingMoviesViewController {
        return TrendingMoviesViewController()
    }

    private func buildInteractor() -> TrendingMoviesInteractor {
        return TrendingMoviesInteractor(service: dependencyManager.requestManager())
    }

    private func buildPresenter() -> TrendingMoviesPresenter {
        return TrendingMoviesPresenter()
    }

    private func buildRouter() -> TrendingMoviesRouter {
        return TrendingMoviesRouter(dependencyManager: dependencyManager)
    }
}
