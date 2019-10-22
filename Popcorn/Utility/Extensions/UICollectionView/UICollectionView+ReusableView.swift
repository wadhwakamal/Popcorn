//
//  UICollectionView+ReusableView.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import UIKit

extension UICollectionView {

    /// Dequeues a reusable collection view cell.
    ///
    /// - Parameter indexPath: The index path to use.
    /// - Returns: The collection view cell.
    func dequeueReusableCell<T: ReusableView>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("No collection view cell could be dequeued with identifier \(T.reuseIdentifier)")
        }

        return cell
    }

    /// Registers the collection view cell based on the given identifier when the cell was created from a nib file.
    ///
    /// - Parameter cellIdentifier: The cell identifier to use.
    func registerCellFromNib(cellIdentifier: String) {
        register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }

    /// Registers the collection view cell based on the given identifier when the cell was created from manual layout.
    ///
    /// - Parameters:
    ///   - cellClass: The cell class to use.
    func registerCell<T: ReusableView>(cellClass: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Register a list of nibs containing a cell with the table view under a specified identifier.
    ///
    /// - Parameter:
    ///   - cells: List of UICollectionViewCells cteated using nib.
    func registerNibForCells(_ cells: [UICollectionViewCell.Type]) {
        for cell in cells {
            registerCellFromNib(cellIdentifier: cell.reuseIdentifier)
        }
    }
}

extension UICollectionReusableView: ReusableView { }
