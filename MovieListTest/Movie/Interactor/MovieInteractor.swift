//
//  MovieInteractor.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 03/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import Alamofire

class MovieInteractor: MoviePresenterToInteractor {
    var presenter: MovieInteractorToPresenter?
    
    func fetchMovie(idGenre: Int, page: Int) {
        
        AF.request(Constant.host+"discover/movie?api_key=" + Constant.apiKey+"&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=\(page)&with_genres=\(idGenre)").responseDecodable(of: MovieModel.self) {
            response in
            guard let movies = response.value else { return }
            if(response.response?.statusCode == 200) {
                do {
                    self.presenter?.movieFetchSuccess(movies: movies)
                } catch let error {
                    print(error)
                    self.presenter?.movieFetchFailed()
                }
            } else {
                print("failed")
                self.presenter?.movieFetchFailed()
            }
        }
    }
}
