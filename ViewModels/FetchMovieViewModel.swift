//
//  NowPlayingViewModel.swift
//  Movie
//
//  Created by Ma Alice on 5/28/20.
//  Copyright © 2020 Ma Alice. All rights reserved.
//

import Foundation
import UIKit

class FetchMovieViewModel {
    
    func downloadMovieImage(poster_Path: String?, completion: @escaping (UIImage?) -> Void) {
        if poster_Path == nil {
            completion(UIImage(named: "no_image")!)
        } else {
            let imageLink = "http://image.tmdb.org/t/p/w500" + poster_Path!
            let url = URL(string: imageLink)!
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url) {(data, response, error) in
                DispatchQueue.main.async {
                    if error != nil {
                        completion(nil)
                    } else {
                        completion(UIImage(data: data!)!)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    
}
