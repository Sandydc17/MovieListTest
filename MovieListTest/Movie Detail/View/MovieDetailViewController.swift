//
//  MovieDetailViewController.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 04/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var popularityTitle: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var releaseTitle: UILabel!
    @IBOutlet weak var overviewField: UITextView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var reviewButton: UIButton!
    
    var presenter: MovieDetailViewToPresenter?
    
    var movie: Movie?
    var dataTrailer: TrailerModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getTrailer()
        print(movie?.id)
    }
    
    @IBAction func playPressed(_ sender: Any) {
        presenter?.presentTrailer(key: dataTrailer?.listTrailer[0].key ?? "")
    }
    
    @IBAction func reviewPressed(_ sender: Any) {
        
    }
}


extension MovieDetailViewController: MovieDetailPresenterToView {
    func setTrailer(trailer: TrailerModel) {
        dataTrailer = trailer
    }
    
    
    func setupView() {
        let posterPath = movie?.posterPath
        let moviePath = Constant.imageHost + posterPath!
        movieImage.sd_setImage(with: URL(string: moviePath))
        
        movieTitle.text = movie?.originalTitle
        starImage.image = UIImage(named: "Star")
        ratingLabel.text = "\(movie?.voteAverage ?? 0)"
        popularityTitle.text = Constant.popularityLabel
        popularityLabel.text = ": \(movie?.popularity ?? 0)"
        releaseTitle.text = Constant.releaseDateLabel
        releaseDateLabel.text = ": \(movie?.releaseDate ?? "")"
        overviewField.text = movie?.overview
        
    }
    
    func getTrailer() {
        presenter?.getDataTrailer(movieID: movie?.id ?? 0)
    }
    
    
}
