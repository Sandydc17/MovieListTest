//
//  MovieDetailService.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 09/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import Moya


enum TrailerService {
    case trailerDetail(movieID: Int)
}

extension TrailerService: TargetType {
    var baseURL: URL {
        return URL(string: Constant.host)!
    }
    
    var path: String {
        switch self {
        case .trailerDetail(let movieID):
            return "movie/\(movieID)/videos"
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
        case .trailerDetail( _):
            return .requestParameters(parameters: ["api_key" : Constant.apiKey, "language" : "en-US"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
}
