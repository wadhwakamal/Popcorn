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
    
    // MARK: - Private Properties
    
    private var displayModel: TrendingMoviesDisplayModel? {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    private let paginationOffset: CGFloat = 2
    
    // MARK: - Lifecycle method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Trending"
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        interactor.getTrendingMovies()
    }
    
    // MARK: - TrendingMoviesView protocol conformance
    
    func updateDisplay(_ displayModel: TrendingMoviesDisplayModel) {
        self.displayModel = displayModel
    }
}

//MARK: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

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
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let reuseIdentifier = LoadingCollectionReusableView.reuseIdentifier
            let loadingFooterView = collectionView
                .dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                                                  withReuseIdentifier: reuseIdentifier,
                                                  for: indexPath)
            loadingFooterView.backgroundColor = UIColor.clear
            return loadingFooterView
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        let loadingFooterHeight: CGFloat = interactor.isLoading ? 44.0 : 0.0
        return CGSize(width: collectionView.frame.width, height: loadingFooterHeight)
    }
}

//MARK: UIScrollViewDelegate

extension TrendingMoviesViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if shouldGetTrendingMoviesNextPage() {            
            interactor.getTrendingMoviesNextPage()
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
