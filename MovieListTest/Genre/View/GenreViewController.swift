//
//  GenreViewController.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 03/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController {

    @IBOutlet weak var titleViewGenre: UILabel!
    @IBOutlet weak var genreListCV: UICollectionView!
    
    private var dataGenres: [GenreModel]?
    
    var presenter: GenreViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        presenter?.updateView()
    }
    
}

extension GenreViewController: GenrePresenterToView {
    func showGenre(genres: [GenreModel]) {
        dataGenres = genres
        genreListCV.reloadData()
    }
    
    
    func showError() {
        
    }
    
}

extension GenreViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataGenres?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "genreCell", for: indexPath) as? GenreCell else { fatalError() }
        
        guard let genre = dataGenres?[indexPath.item] else { fatalError() }
        cell.setupCell(genre: genre, index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width * 0.4), height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedGenre = dataGenres?[indexPath.item] {
            presenter?.selectedGenre(genre: selectedGenre)
        }
    }
}

//MARK: Setup View
extension GenreViewController {
    func setupView() {
        titleViewGenre.text = Constant.titleViewGenre
        
        let nib = UINib(nibName: "GenreCell", bundle: nil)
        self.genreListCV.register(nib, forCellWithReuseIdentifier: "genreCell")
    }
}
