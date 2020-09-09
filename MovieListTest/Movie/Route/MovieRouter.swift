//
//  MovieRoute.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 03/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import UIKit

class MovieRouter: MoviePresenterToRouter {
    
    func createMoviePage(genre: GenreModel) -> UIViewController {
        let view = MovieViewController()
        let presenter: MovieViewToPresenter & MovieInteractorToPresenter = MoviePresenter()
        let interactor: MoviePresenterToInteractor = MovieInteractor()
        let router: MoviePresenterToRouter = MovieRouter()
        
        view.genreId = genre.id
        view.genreName = genre.name
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func presentDetailMoviePage(view: MoviePresenterToView, movie: Movie, index: Int) {
        let movieDetailRouter = MovieDetailRouter()
        let movieDetailView = movieDetailRouter.createDetailMoviePage(movie: movie, index: index)
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
        viewVC.present(movieDetailView, animated: true)
    }
    
}
