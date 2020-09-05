//
//  MovieCell.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 04/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var movieCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(movie: Movie, index: Int) {
        movieCellView.layer.cornerRadius = 10
        
        movieTitle.text = movie.originalTitle
        movieTitle.textColor = UIColor.white
        
        movieCellView.backgroundColor = UIColor(rgb: Constant.movieCellBg[index % Constant.movieCellBg.count])
        
        starImage.image = UIImage(named: "Star")
        ratingLabel.text = "\(movie.voteAverage!)"
        ratingLabel.textColor = UIColor.white
        
        let posterPath = ((movie.posterPath ?? "").isEmpty ? "/default" : movie.posterPath) ?? "/default"
        let moviePath = Constant.imageHost + posterPath
        
        movieImage.layer.cornerRadius = 10
        movieImage.sd_setImage(with: URL(string: moviePath))
        
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
