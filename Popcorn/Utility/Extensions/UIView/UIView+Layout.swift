//
//  UIView+Layout.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Snaps the given view with the current view on each side (top, bottom, leading, trailing).
    ///
    /// - Parameter view: The view to snap to.
    func snap(to view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    /// Loads a view from the nib. Uses the view class name to determine what nib to load.
    ///
    /// - Returns: The view.
    class func fromNib<T: UIView>() -> T {
        let nibName = String(describing: T.self)
        guard let result = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)!.first as? T else {
            fatalError("Could not load nib \(nibName)")
        }
        
        return result
    }
}

// MARK: - Protocol conformance

// MARK: NibLoadable

extension UIView: NibLoadable {

}
