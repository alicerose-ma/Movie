//
//  MovieData.swift
//  Movie
//
//  Created by Ma Alice on 5/24/20.
//  Copyright © 2020 Ma Alice. All rights reserved.
//

import Foundation

struct Movies: Codable{
    let results: [MovieData]
}

struct MovieData: Codable {
 
    var popularity: Double
    var vote_count: Int
    var video: Bool
    var poster_path: String
    var id: Int
    var adult: Bool
    var backdrop_path: String
    var original_language: String
    var original_title: String
    var vote_averages: [Int]
    var title: String
    var vote_average: Double
    var overview: String
    var release_date: String
    
//
//    init(movie: [String: Any]) {
//        self.popularity = movie["popularity"] as? Double ?? 0.0
//        self.vote_count = movie["vote_count"] as? Int ?? 0
//        self.video = movie["video"] as? Bool ?? false
//        self.poster_path = movie["poster_path"] as? String ?? ""
//        self.id = movie["id"] as? Int ?? 0
//        self.adult = movie["adult"] as? Bool ?? false
//        self.backdrop_path = movie["backdrop_path"] as? String ?? ""
//        self.original_language = movie["original_language"] as? String ?? ""
//        self.original_title = movie["original_title"] as? String ?? ""
//        self.vote_averages = movie["vote_average"] as? [Int] ?? []
//        self.title = movie["title"] as? String ?? ""
//        self.vote_average = movie["vote_average"] as? Double ?? 0.0
//        self.overview = movie["overview"] as? String ?? ""
//        self.release_date = movie["release_date"] as? String ?? ""
//    }
}
