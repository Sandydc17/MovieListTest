//
//  GenreProtocol.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 03/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import UIKit

protocol GenrePresenterToView: class {
    func showGenre(genres: [GenreModel])
    func showError()
}

protocol GenreInteractorToPresenter: class {
    func genreFetchSuccess(genre: [GenreModel])
    func genreFetchFailed()
}

protocol GenrePresenterToInteractor: class {
    var presenter: GenreInteractorToPresenter? {get set}
    
    func fetchGenre()
}

protocol GenreViewToPresenter: class {
    var view: GenrePresenterToView? {get set}
    var interactor: GenrePresenterToInteractor? {get set}
    var router: GenrePresenterToRouter? {get set}
    
    func updateView()
    func selectedGenre(genre: GenreModel)
}

protocol GenrePresenterToRouter: class {
    func createGenrePage() -> UIViewController
    func presentMovieList(view: GenrePresenterToView, genre: GenreModel)
}
