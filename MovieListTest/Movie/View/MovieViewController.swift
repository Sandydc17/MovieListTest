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
    
    var dataMovie: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.updateView(idGenre: genreId!, page: pageCount)
    }
    
    func addNewPage() {
        presenter?.updateView(idGenre: genreId!, page: pageCount)
    }
}

extension MovieViewController: MoviePresenterToView {
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: Constant.errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func showMovie(movies: MovieModel) {
        dataMovie.append(contentsOf: movies.all)
        movieListCV.reloadData()
        pageCount+=1
       
//        print("pageCount\(pageCount)")
        movieListCV.finishInfiniteScroll()
    }
    
    
}

extension MovieViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as? MovieCell else { fatalError() }
        
        let movie = dataMovie[indexPath.item]
        cell.setupCell(movie: movie, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - 40), height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.movieSelected(movie: dataMovie[indexPath.item], index: indexPath.item)
    }
    
}

extension MovieViewController {
    func setupView() {
        titleViewMovieList.text = Constant.titleViewMovie
        genreTitleLabel.text = genreName
        
        let nib = UINib(nibName: "MovieCell", bundle: nil)
        self.movieListCV.register(nib, forCellWithReuseIdentifier: "movieCell")
        
        movieListCV.infiniteScrollIndicatorMargin = 40
        let frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        movieListCV.infiniteScrollIndicatorView = CustomInfiniteIndicator(frame: frame)
//
        movieListCV.addInfiniteScroll { (collectionView) -> Void in
            self.addNewPage()
            collectionView.finishInfiniteScroll()
        }
//        movieListCV.beginInfiniteScroll(true)
    }
}
