//
//  MovieListCollectionViewCell.swift
//  Popcorn
//
//  Created by Kamal Wadhwa on 20/10/19.
//  Copyright © 2019 Kamal Wadhwa. All rights reserved.
//

import UIKit

class MovieListCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var movieNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(displayModel: MovieDisplayModel?) {
        posterImageView.image = #imageLiteral(resourceName: "spiderman-poster")
        movieNameLabel.text = displayModel?.title
    }

}
