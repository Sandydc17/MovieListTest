//
//  ReviewModel.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 05/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation

struct ReviewModel: Decodable {
    let id: Int?
    let page: Int?
    let reviews: [Review]?
    let totalPage: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case page
        case reviews = "results"
        case totalPage = "total_pages"
        case totalResults = "total_results"
    }
}

struct Review: Decodable {
    
    let author: String?
    let content: String?
    let id: String?
    let url: String?
}
