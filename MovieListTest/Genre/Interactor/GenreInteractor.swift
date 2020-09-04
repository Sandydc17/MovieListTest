//
//  GenreInteractor.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 03/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import Alamofire

class GenreInteractor: GenrePresenterToInteractor {
    
     var presenter: GenreInteractorToPresenter?
    
    func fetchGenre() {
        AF.request(Constant.host + "genre/movie/list?api_key=" + Constant.apiKey + "&language=en-US").response {
            response in
            if(response.response?.statusCode == 200) {
                guard let data = response.data else { return }
                do {
                    let decoder = JSONDecoder()
                    let genreResponse = try decoder.decode(GenreResponse.self, from: data)
                    guard let genreItems = genreResponse.genres else{return}
                    self.presenter?.genreFetchSuccess(genre: genreItems)
                    
                } catch let error {
                    print(error)
                }
            } else {
                self.presenter?.genreFetchFailed()
            }
        }
    }
    
}
