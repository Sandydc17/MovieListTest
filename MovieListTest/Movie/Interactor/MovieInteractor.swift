//
//  MovieInteractor.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 03/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import Alamofire
import Moya

class MovieInteractor: MoviePresenterToInteractor {
    var presenter: MovieInteractorToPresenter?
    
    var provider = MoyaProvider<MovieService>()
    
    func fetchMovie(idGenre: Int, page: Int) {
        
        provider.request(.movie(idGenre: idGenre, page: page)) { result in
            switch result {
            case let .success(moyaResponse) :
                let data = moyaResponse.data
                do {
                    let decoder = JSONDecoder()
                    let movies = try decoder.decode(MovieModel.self, from: data)
                    self.presenter?.movieFetchSuccess(movies: movies)
                    
                } catch let error {
                    print(error)
                    self.presenter?.movieFetchFailed()
                }
            case let .failure(error):
                print(error)
                self.presenter?.movieFetchFailed()
            }
        }
    }
}
