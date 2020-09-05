//
//  GenreCell.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 03/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import UIKit

class GenreCell: UICollectionViewCell {

    @IBOutlet weak var genreView: UIView!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(genre: GenreModel, index: Int) {
        genreView.layer.cornerRadius = 10
        genreLabel.text = genre.name
        genreLabel.textColor = UIColor.white
        genreView.backgroundColor = UIColor(rgb: Constant.movieCellBg[index % Constant.movieCellBg.count])
    }

}
