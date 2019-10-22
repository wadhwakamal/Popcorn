//
//  ReusableView.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

/// Defines a reusable table view or collection view cell.
protocol ReusableView: class {

    /// Default reuse identifier is set with the class name.
    static var reuseIdentifier: String { get }

}

extension ReusableView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }

}

