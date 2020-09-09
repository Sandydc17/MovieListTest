//
//  GenreRouter.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 03/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import UIKit

class GenreRouter: GenrePresenterToRouter {
    
    func createGenrePage() -> UIViewController {
        let view = GenreViewController()
        let presenter: GenreViewToPresenter & GenreInteractorToPresenter = GenrePresenter()
        let interactor: GenrePresenterToInteractor = GenreInteractor()
        let router: GenrePresenterToRouter = GenreRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func presentMovieList(view: GenrePresenterToView, genre: GenreModel) {
        let movieRouter = MovieRouter()
        let movieView = movieRouter.createMoviePage(genre: genre)
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
        viewVC.present(movieView, animated: true)
        
    }
    
    
}
