//
//  TrendingMoviesViewController.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import UIKit

final class TrendingMoviesViewController: TrendingMoviesBaseLayoutViewController, TrendingMoviesView {
    // MARK: - Properties

    /// Interactor.
    var interactor: TrendingMoviesViewOutput!

    /// Router.
    var router: TrendingMoviesRouter!
    
    private var displayModel: TrendingMoviesDisplayModel? {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    private let paginationOffset: CGFloat = 2
    
    func updateDisplay(_ displayModel: TrendingMoviesDisplayModel) {
        self.displayModel = displayModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Trending"
        
        collectionView?.dataSource = self
        interactor.getTrendingMovies(page: 1)
    }
}

extension TrendingMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayModel?.movies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieListCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        let movie = displayModel?.movies[indexPath.item]
        cell.setup(displayModel: movie)
        return cell
    }
}

extension TrendingMoviesViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if shouldGetTrendingMoviesNextPage() {
            print(scrollView.contentOffset)
            interactor.getTrendingMovies(page: 2)
            collectionView?.collectionViewLayout.invalidateLayout()
        }
    }
    
    private func shouldGetTrendingMoviesNextPage() -> Bool {
        let scrollableHeight = collectionView?.contentSize.height ?? 0.0
        let currentScrollOffset = collectionView?.contentOffset.y ?? 0.0
        let viewHeight = collectionView?.frame.size.height ?? 0.0
        return currentScrollOffset > 0 && scrollableHeight - currentScrollOffset < paginationOffset * viewHeight
    }
}
