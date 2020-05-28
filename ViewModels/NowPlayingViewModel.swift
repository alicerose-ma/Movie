//
//  NowPlayingViewModel.swift
//  Movie
//
//  Created by Ma Alice on 5/28/20.
//  Copyright © 2020 Ma Alice. All rights reserved.
//

import Foundation
import UIKit

class NowPlayingViewModel {
    
    func convertImageURLToUIImage(poster_Path: String?) -> UIImage {
        if poster_Path == nil {
            return UIImage(systemName: "nosign")!
        } else {
            let imageLink = "http://image.tmdb.org/t/p/w500" + poster_Path!
           let url = URL(string: imageLink)!
            let data = try? Data(contentsOf: url)
            return UIImage(data: data!)!
        }
    }
    
}
