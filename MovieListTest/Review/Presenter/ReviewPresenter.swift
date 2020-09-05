//
//  ReviewPresenter.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 05/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation

class ReviewPresenter: ReviewViewToPresenter {
    
    var view: ReviewPresenterToView?
    var interactor: ReviewPresenterToInteractor?
    var router: ReviewPresenterToRouter?
    
    func getReview(movieID: Int, page: Int) {
        interactor?.getDataReview(movieId: movieID, page: page)
    }
}

extension ReviewPresenter: ReviewInteractorToPresenter {
    
    func reviewFetchSuccess(review: ReviewModel) {
        view?.showReview(review: review)
    }
    
    func reviewFetchFailed() {
        
    }
    
    
}
