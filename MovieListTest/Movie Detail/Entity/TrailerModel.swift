//
//  TrailerModel.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 05/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation

struct TrailerModel: Codable {
    let id: Int
    let listTrailer: [Trailer]

    enum CodingKeys: String, CodingKey {
        case id
        case listTrailer = "results"
    }
}

struct Trailer: Codable {
    let id: String?
    let iso639_1: String?
    let iso3166_1: String?
    let key: String?
    let name: String?
    let site: String?
    let size: Int?
    let type: String?

    enum CodingKeys: String, CodingKey {
       case id
       case iso639_1 = "iso_639_1"
       case iso3166_1 = "iso_3166_1"
       case key
       case name
       case site
       case size
       case type
    }
}
