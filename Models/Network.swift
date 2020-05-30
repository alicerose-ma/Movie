//
//  Network.swift
//  Movie
//
//  Created by Ma Alice on 5/28/20.
//  Copyright © 2020 Ma Alice. All rights reserved.
//

import Foundation

class NetWork {

    static let shared = NetWork()
    private init() {}
    
    let base = "https://api.themoviedb.org"
    let api_key = "api_key=c6daf34c1130b89e1e7821159af5b818"
    

    func fetchMovies(movieFeed: MovieFeed, completion: @escaping (String?,[Movie]) -> Void) {
        var urlString = ""
        switch movieFeed {
        case .nowPlaying:
            urlString = base + movieFeed.rawValue + api_key
        case .topRated:
            urlString = base + movieFeed.rawValue + api_key
        }
        
        let url = URL(string: urlString)
        let task =  URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data else {
                print("err getting data")
                completion("getting data error", [])
                return
            }
            do {
                let movies = try JSONDecoder().decode(MovieFeedResult.self, from: data)
                completion(nil, movies.results)
            } catch let error {
                print(error)
                completion("decode error", [])
            }
        }
        
        task.resume()
    }
}
