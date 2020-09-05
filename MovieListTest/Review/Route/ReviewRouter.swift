//
//  ReviewRouter.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 05/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation

class ReviewRouter: ReviewPresenterToRouter {
    
    func createReviewPage(movieID: Int, index: Int) -> UIViewController {
        let view = UIStoryboard(name: "ReviewView", bundle: Bundle.main).instantiateViewController(identifier: "reviewView") as! ReviewViewController
        let presenter: ReviewViewToPresenter & ReviewInteractorToPresenter = ReviewPresenter()
        let interactor: ReviewPresenterToInteractor = ReviewInteractor()
        let router: ReviewPresenterToRouter = ReviewRouter()
        
        view.movieID = movieID
        view.index = index
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
}
