//
//  ReviewCell.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 05/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var reviewView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupCell(review: Review, index :Int) {
        authorLabel.text = review.author
        contentLabel.text = review.content
        
        authorLabel.textColor = UIColor.white
        contentLabel.textColor = UIColor.white
        
        reviewView.backgroundColor = UIColor(rgb: Constant.movieCellBg[index % Constant.movieCellBg.count])
    }
    
}
