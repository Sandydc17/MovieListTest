//
//  ReviewService.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 09/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import Moya


enum ReviewService {
    case review(movieID: Int, page : Int)
}

extension ReviewService: TargetType {
    var baseURL: URL {
        return URL(string: Constant.host)!
    }
    
    var path: String {
        switch self {
        case .review(let movieID, _):
            return "movie/\(movieID)/reviews"
        }
    }
        
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .review( _ ,let page):
            return .requestParameters(parameters: ["api_key" : Constant.apiKey, "language" : "en-US", "page" : page], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
}
