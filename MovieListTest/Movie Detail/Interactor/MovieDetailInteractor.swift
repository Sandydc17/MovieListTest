//
//  MovieDetailInteractor.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 04/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import Alamofire
import Moya

class MovieDetailInteractor: MovieDetailPresenterToInteractor {
    
    var presenter: MovieDetailInteractorToPresenter?
    
    var provider = MoyaProvider<TrailerService>()
    
    func getDataTrailer(movieID: Int) {
        
        provider.request(.trailerDetail(movieID: movieID)) { result in
            switch result {
            case let .success(moyaResponse) :
                let data = moyaResponse.data
                do {
                    let decoder = JSONDecoder()
                    let trailerData = try decoder.decode(TrailerModel.self, from: data)
                    self.presenter?.trailerFetchSuccess(trailer: trailerData )
                    
                } catch let error {
                    print(error)
                    self.presenter?.trailerFetchFailed()
                }
            case let .failure(error):
                print(error)
                self.presenter?.trailerFetchFailed()
            }
        }
        
        
//        AF.request(Constant.host+"movie/\(movieID)/videos?api_key=" + Constant.apiKey+"&language=en-US").responseDecodable(of: TrailerModel.self) {
//            response in
//            guard let trailers = response.value else { return }
//            if(response.response?.statusCode == 200) {
//                do {
//                    self.presenter?.trailerFetchSuccess(trailer: trailers )
//                } catch let error {
//                    print(error)
//                    self.presenter?.trailerFetchFailed()
//                }
//            } else {
//                print("failed")
//                self.presenter?.trailerFetchFailed()
//            }
//        }
    }
    
}
