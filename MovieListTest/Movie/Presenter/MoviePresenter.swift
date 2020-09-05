//
//  MoviePresenter.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 03/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation

class MoviePresenter: MovieViewToPresenter {
   
    var view: MoviePresenterToView?
    var interactor: MoviePresenterToInteractor?
    var router: MoviePresenterToRouter?
    
    func updateView(idGenre: Int, page: Int) {
        interactor?.fetchMovie(idGenre: idGenre, page: page)
    }
    
    func movieSelected(movie: Movie, index: Int) {
        router?.presentDetailMoviePage(view: view!, movie: movie, index: index)
    }
    
}

extension MoviePresenter: MovieInteractorToPresenter {
    
    func movieFetchSuccess(movies: MovieModel) {
        view?.showMovie(movies: movies)
    }
    
    func movieFetchFailed() {
        view?.showError()
    }
    
    
}
