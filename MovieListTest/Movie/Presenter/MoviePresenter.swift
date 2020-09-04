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
    
}

extension MoviePresenter: MovieInteractorToPresenter {
    
    func movieFetchSuccess(movie: MovieModel) {
        
    }
    
    func movieFetchFailed() {
        
    }
    
    
}
