//
//  ViewController.swift
//  Movie
//
//  Created by Ma Alice on 5/24/20.
//  Copyright © 2020 Ma Alice. All rights reserved.
//

import Foundation
import UIKit

class NowPlayingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let nowPlayingVM = NowPlayingViewModel()
    var list = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadNowplayingMovies()
    }
    
    func loadNowplayingMovies(){
        NetWork.shared.fetchMovies(movieFeed: .nowPlaying, completion: { movies in
            self.list = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MovieTableViewCell
        cell.img.image = nowPlayingVM.convertImageURLToUIImage(poster_Path: list[indexPath.row].poster_path)
        cell.title.text = list[indexPath.row].title
        cell.overview.text = list[indexPath.row].overview
        return cell
    }
    

}

