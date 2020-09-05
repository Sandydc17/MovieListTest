//
//  MovieProtocol.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 03/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import UIKit

protocol MoviePresenterToView: class {
    func showMovie(movies: MovieModel)
    func showError()
}

protocol MovieInteractorToPresenter: class {
    func movieFetchSuccess(movies: MovieModel)
    func movieFetchFailed()
}

protocol MoviePresenterToInteractor: class {
    var presenter: MovieInteractorToPresenter? {get set}
    func fetchMovie(idGenre: Int, page: Int)
    
}

protocol MovieViewToPresenter: class {
    var view: MoviePresenterToView? {get set}
    var interactor: MoviePresenterToInteractor? {get set}
    var router: MoviePresenterToRouter? {get set}
    
    func updateView(idGenre: Int, page: Int)
    func movieSelected(movie: Movie, index: Int)
}

protocol MoviePresenterToRouter: class {
    func createMoviePage(genre: GenreModel) -> UIViewController
    func presentDetailMoviePage(view: MoviePresenterToView, movie: Movie, index: Int)
}
