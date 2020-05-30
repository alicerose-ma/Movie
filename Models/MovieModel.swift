//
//  MovieModel.swift
//  Movie
//
//  Created by Ma Alice on 5/28/20.
//  Copyright © 2020 Ma Alice. All rights reserved.
//

import Foundation

struct MovieFeedResult: Decodable {
    let results: [Movie]
}


struct Movie: Decodable {
    let poster_path: String?
    let backdrop_path: String?
    let title: String?
    let overview: String?
    let release_date: String?
    
}
