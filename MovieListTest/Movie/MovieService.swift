//
//  MovieService.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 09/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation
import Moya


enum MovieService {
    case movie(idGenre: Int, page: Int)
}

extension MovieService: TargetType {
    var baseURL: URL {
        return URL(string: Constant.host)!
    }
    
    var path: String {
        return "discover/movie"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .movie(let idGenre, let page):
            return .requestParameters(parameters: ["api_key" : Constant.apiKey, "language" : "en-US", "sort_by" : "popularity.desc", "include_adult" : "false", "page" : page, "with_genres" : idGenre], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
}
