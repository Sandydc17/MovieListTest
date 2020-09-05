//
//  MovieDetailDetailRouter.swift
//  MovieDetailListTest
//
//  Created by Sandy Chandra on 04/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation

class MovieDetailRouter: MovieDetailPresenterToRouter {
    
    func playTrailer(view: MovieDetailPresenterToView, key: String) {
        let vc = UIStoryboard(name: "MovieDetailView", bundle: Bundle.main).instantiateViewController(identifier: "trailerView") as! TrailerViewController
        vc.key = key
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
        viewVC.present(vc, animated: true)
    }
    
    
    func createDetailMoviePage(movie: Movie) -> UIViewController {
        let view = UIStoryboard(name: "MovieDetailView", bundle: Bundle.main).instantiateViewController(identifier: "MovieDetailView") as! MovieDetailViewController
        let presenter: MovieDetailViewToPresenter & MovieDetailInteractorToPresenter = MovieDetailPresenter()
        let interactor: MovieDetailPresenterToInteractor = MovieDetailInteractor()
        let router: MovieDetailPresenterToRouter = MovieDetailRouter()
        
        view.movie = movie
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    
}
