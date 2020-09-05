//
//  MovieModel.swift
//  MovieListTest
//
//  Created by Sandy Chandra on 03/09/20.
//  Copyright © 2020 Sandy Chandra. All rights reserved.
//

import Foundation

struct MovieModel: Codable {
    var page: Int
    var totalResults: Int
    var totalPages: Int
    var all: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case all = "results"
    }
}

struct Movie: Codable {
    var popularity: Double
    var voteCount: Int
    var video: Bool
    var posterPath: String
    var id: Int
    var adult: Bool
    var backdropPath: String
    var originalTitle: String
    var genreIDS: [Int]
    var title: String
    var voteAverage: Double
    var overview: String
    var releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
}
