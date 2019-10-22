//
//  TrendingMoviesBaseLayoutViewController.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import UIKit

class TrendingMoviesBaseLayoutViewController: UIViewController {
    
    private struct Constants {
        static let defaultSpacing: CGFloat = 10.0
        static let doubleLayoutCellHeightInset: CGFloat = 49.0
        static let headerIdentifier = "MoviesListHeaderIdentifier"
    }
    
    /// The collection view.
    var collectionView: UICollectionView?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let flowLayout = collectionViewFlowLayout(frame: view.frame)
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)

        guard let collectionView = collectionView else { return }

        collectionView.backgroundColor = .white

        collectionView.registerCellFromNib(cellIdentifier: MovieListCollectionViewCell.reuseIdentifier)
        collectionView.register(UICollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: Constants.headerIdentifier)
        
        let loadingFooterNib = UINib(nibName: LoadingCollectionReusableView.nibName, bundle: Bundle.main)
        
        collectionView.register(loadingFooterNib,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: LoadingCollectionReusableView.reuseIdentifier)
        
        collectionView.alwaysBounceVertical = true
        view.addSubview(collectionView)
        view.snap(to: collectionView)
    }
    
    private func collectionViewFlowLayout(frame: CGRect) -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        let spacing = Constants.defaultSpacing

        let width = frame.width / 2
        flowLayout.itemSize = CGSize(width: width, height: width + Constants.doubleLayoutCellHeightInset)
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: spacing, right: 0.0)

        return flowLayout
    }
}
