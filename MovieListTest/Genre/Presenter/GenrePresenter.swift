//
//  GenrePresenter.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 03/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation

class GenrePresenter: GenreViewToPresenter {
    
    var view: GenrePresenterToView?
    var interactor: GenrePresenterToInteractor?
    var router: GenrePresenterToRouter?
    
    func updateView() {
        interactor?.fetchGenre()
    }
    
    func selectedGenre(genre: GenreModel) {
        router?.presentMovieList(view: view!, genre: genre)
    }
}

extension GenrePresenter: GenreInteractorToPresenter {
    
    func genreFetchSuccess(genre: [GenreModel]) {
        view?.showGenre(genres: genre)
    }
    
    func genreFetchFailed() {
        view?.showError()
    }
    
    
    
}
