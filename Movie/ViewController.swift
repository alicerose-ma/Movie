//
//  ViewController.swift
//  Movie
//
//  Created by Ma Alice on 5/24/20.
//  Copyright © 2020 Ma Alice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let urlBase = "https://api.themoviedb.org/3/"
    let api = "api_key=c6daf34c1130b89e1e7821159af5b818"
    var movies = [MovieData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("aaaa")
        fetchNowPlayingMovie()
    }
    
    
    private func fetchNowPlayingMovie() {
        let query = "movie/now_playing?"
        let request = urlBase + query + api + "&language=en-US&page=1"
        guard let url =  URL(string: request) else {
            return
        }

        print(request)
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(data)
            do {
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
//                    print("found error in fetching data")
//                    return
//                }
//
//                let list = json["results"] as! [NSDictionary]
//
//                for movie in list {
////                    print(movie)
//                    let model = try JSONDecoder().decode(MovieData.self, from: data)
//                    print(model.title)
//
////                    print(movie["title"])
//                }

                guard let json = try? JSONDecoder().decode(Movies.self, from: data) else {
                    print("found error in fetching data")
                    return
                }
                
                self.movies = json.results
                print(self.movies[0].title)
                
            }
            catch let jsonError {
                print(jsonError.localizedDescription)
            }
            catch let parsingError {
                print("Error", parsingError)
            }
            print("found something")
        }
        
        task.resume()
    }
}

