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
                debugPrint(reviewData)
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
        
//        AF.request(Constant.host+"movie/\(movieId)/reviews?api_key=" + Constant.apiKey+"&language=en-US&page=\(page)").responseDecodable(of: ReviewModel.self) {
//            response in
//            guard let review = response.value else { return }
//            if(response.response?.statusCode == 200) {
//
//                do {
//                    self.presenter?.reviewFetchSuccess(review: review)
//                } catch let error {
//                    print(error)
//                    self.presenter?.reviewFetchFailed()
//                }
//            } else {
//                print("failed")
//                self.presenter?.reviewFetchFailed()
//            }
//        }
    }
}
