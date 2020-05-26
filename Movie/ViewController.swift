//
//  ViewController.swift
//  Movie
//
//  Created by Ma Alice on 5/24/20.
//  Copyright © 2020 Ma Alice. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNowPlayingMovie()
    }
    
    func fetchNowPlayingMovie() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=c6daf34c1130b89e1e7821159af5b818&language=en-US&page=1")
        let task =  URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data else {
                print("err getting data")
                return
            }
            
            do {
                let movies = try JSONDecoder().decode(MovieFeedResult.self, from: data)
                for movie in movies.results {
                    print(movie.title ?? "Empty title")
                }
            } catch let error {
                print(error)
            }
        }
        
        task.resume()
    }
}

