//
//  MovieDetailProtocol.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 04/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import UIKit

protocol MovieDetailPresenterToView: class {
    func setupView()
    func getTrailer()
    func setTrailer(trailer: TrailerModel)
}

protocol MovieDetailInteractorToPresenter: class {
    func trailerFetchSuccess(trailer: TrailerModel)
    func trailerFetchFailed()
}

protocol MovieDetailPresenterToInteractor: class {
    var presenter: MovieDetailInteractorToPresenter? {get set}
    
    func getDataTrailer(movieID: Int)
}

protocol MovieDetailViewToPresenter: class {
    var view: MovieDetailPresenterToView? {get set}
    var interactor: MovieDetailPresenterToInteractor? {get set}
    var router: MovieDetailPresenterToRouter? {get set}
    
    func presentTrailer(key: String)
    func getDataTrailer(movieID: Int)
    
}

protocol MovieDetailPresenterToRouter: class {
    func createDetailMoviePage(movie: Movie) -> UIViewController
    func playTrailer(view: MovieDetailPresenterToView, key: String)
}
