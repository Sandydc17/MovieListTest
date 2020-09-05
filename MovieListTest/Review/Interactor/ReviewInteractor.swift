//
//  ReviewInteractor.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 05/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import Alamofire

class ReviewInteractor: ReviewPresenterToInteractor {
    
    var presenter: ReviewInteractorToPresenter?
    
    func getDataReview(movieId: Int, page: Int) {
        AF.request(Constant.host+"movie/\(movieId)/reviews?api_key=" + Constant.apiKey+"&language=en-US&page=\(page)").responseDecodable(of: ReviewModel.self) {
            response in
            guard let review = response.value else { return }
            if(response.response?.statusCode == 200) {
                do {
                    self.presenter?.reviewFetchSuccess(review: review)
                } catch let error {
                    print(error)
                    self.presenter?.reviewFetchFailed()
                }
            } else {
                print("failed")
                self.presenter?.reviewFetchFailed()
            }
        }
    }
    
}

//movie/384018/reviews?api_key=14a2f071edd10dada4f2e33c5586edc2&language=en-US&page=1
