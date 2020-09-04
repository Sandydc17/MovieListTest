//
//  MovieViewController.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 03/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet weak var titleViewMovieList: UILabel!
    @IBOutlet weak var genreTitleLabel: UILabel!
    @IBOutlet weak var movieListCV: UICollectionView!
    
    var presenter: MovieViewToPresenter?
    
    var genreId: Int?
    var genreName: String?
    var pageCount: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.updateView(idGenre: genreId!, page: pageCount)
    }
    

}

extension MovieViewController: MoviePresenterToView {
    
    func showMovie(movie: MovieModel) {
        
    }
    
    
}

extension MovieViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}

extension MovieViewController {
    func setupView() {
        titleViewMovieList.text = Constant.titleViewMovie
    }
}
