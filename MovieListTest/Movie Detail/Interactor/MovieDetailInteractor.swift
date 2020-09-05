//
//  MovieDetailInteractor.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 04/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import Alamofire

class MovieDetailInteractor: MovieDetailPresenterToInteractor {
    
    var presenter: MovieDetailInteractorToPresenter?
    
    func getDataTrailer(movieID: Int) {
//        print("movie ID \(movieID)")
        AF.request(Constant.host+"movie/\(movieID)/videos?api_key=" + Constant.apiKey+"&language=en-US").responseDecodable(of: TrailerModel.self) {
            response in
            guard let trailers = response.value else { return }
            if(response.response?.statusCode == 200) {
                do {
//                    print(trailers.listTrailer[0].key)
                    self.presenter?.trailerFetchSuccess(trailer: trailers )
                } catch let error {
                    print(error)
                    self.presenter?.trailerFetchFailed()
                }
            } else {
                print("failed")
                self.presenter?.trailerFetchFailed()
            }
        }
    }
    
}
