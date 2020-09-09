//
//  ReviewInteractor.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 05/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import Alamofire
import Moya

class ReviewInteractor: ReviewPresenterToInteractor {
    
    var presenter: ReviewInteractorToPresenter?
    
    var provider = MoyaProvider<ReviewService>()
    
    func getDataReview(movieId: Int, page: Int) {
        
        provider.request(.review(movieID: movieId, page: page)) { result in
           switch result {
           case let .success(moyaResponse) :
               let data = moyaResponse.data
               do {
                   let decoder = JSONDecoder()
                   let reviewData = try decoder.decode(ReviewModel.self, from: data)
                
                self.presenter?.reviewFetchSuccess(review: reviewData)

               } catch let error {
                   print(error)
                   self.presenter?.reviewFetchFailed()
               }
           case let .failure(error):
               print(error)
               self.presenter?.reviewFetchFailed()
           }
       }
    }
}
