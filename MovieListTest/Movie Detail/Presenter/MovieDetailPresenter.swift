//
//  MovieDetailPresenter.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 04/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation

class MovieDetailPresenter: MovieDetailViewToPresenter {
    
    
    var view: MovieDetailPresenterToView?
    var interactor: MovieDetailPresenterToInteractor?
    var router: MovieDetailPresenterToRouter?
    
    func presentTrailer(key: String) {
        router?.playTrailer(view: view!, key: key)
    }
    
    func getDataTrailer(movieID: Int) {
        interactor?.getDataTrailer(movieID: movieID)
    }
    
    
}

extension MovieDetailPresenter: MovieDetailInteractorToPresenter {
    
    func trailerFetchSuccess(trailer: TrailerModel) {
        view?.setTrailer(trailer: trailer)
    }
    
    func trailerFetchFailed() {
        
    }
    
    
}
