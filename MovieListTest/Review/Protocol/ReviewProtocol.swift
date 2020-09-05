//
//  ReviewProtocol.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 05/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import UIKit

protocol ReviewPresenterToView: class {
    func setupView()
    func showReview(review: ReviewModel)
    func showError()
}

protocol ReviewInteractorToPresenter: class {
    func reviewFetchSuccess(review: ReviewModel)
    func reviewFetchFailed()
}

protocol ReviewPresenterToInteractor: class {
    var presenter: ReviewInteractorToPresenter? {get set}
    
    func getDataReview(movieId: Int, page: Int)
    
}

protocol ReviewViewToPresenter: class {
    var view: ReviewPresenterToView? {get set}
    var interactor: ReviewPresenterToInteractor? {get set}
    var router: ReviewPresenterToRouter? {get set}
    
    func getReview(movieID: Int, page: Int)
}

protocol ReviewPresenterToRouter: class {
    func createReviewPage(movieID: Int, index: Int) -> UIViewController
}
