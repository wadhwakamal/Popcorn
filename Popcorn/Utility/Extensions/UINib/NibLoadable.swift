//
//  NibLoadable.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import UIKit

/// Indicates an element that is loadable from a nib.
protocol NibLoadable {

    /// Name of nib being loaded from.
    static var nibName: String { get }

}

// MARK: - Default implementations

extension NibLoadable {

    @nonobjc static var nibName: String {
        return String(describing: self)
    }

}

extension UINib {

    /// Instantiate a nib from the main bundle.
    ///
    /// - Warning: The name of the nib file must not have the prefix as a view controller.
    /// If the view has the same prefix, the view controller will try to load using the nib file and the app
    /// will crash with the following error: <VIEW_CONTROLLER> loaded the "<VIEW>" nib but the view outlet was not set.
    ///
    /// Example:
    /// * `MyView` is **NOT** a good name if the view controller is `MyViewController`,
    /// because they share the same prefix.
    /// * `MyOwnView` is a good name if the view controller is `MyViewController`.
    ///
    /// - Parameter type: Nib type.
    /// - Returns: Element instantiated from nib.
    static func instantiateNib<T: NibLoadable>(ofType type: T.Type) -> T {
        guard let nib = UINib(nibName: T.nibName, bundle: Bundle.main)
            .instantiate(withOwner: nil, options: nil)
            .first as? T else {
                fatalError("No nib could be instatiated with name \(T.nibName)")
        }

        return nib
    }

}
