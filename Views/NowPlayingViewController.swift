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
    let fecthMovieVM = FetchMovieViewModel()
    let spinnerMV = SpinnerViewModel()
    var refreshControl = UIRefreshControl()
    var list = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadNowplayingMovies(movieFeed: .nowPlaying)

        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }

    func loadNowplayingMovies(movieFeed: MovieFeed){
        spinnerMV.createSpinner(view: self.view, "Loading..")
        
        NetWork.shared.fetchMovies(movieFeed: movieFeed, completion: { (isErr, movies) in
            if isErr == nil {
                self.list = movies
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.spinnerMV.removeSpinner()
                    self.refreshControl.endRefreshing()
                }
            } else {
                self.list = movies // empty array
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.spinnerMV.removeSpinner()
                    self.refreshControl.endRefreshing()
                    let alert = UIAlertController(title: "Loading Error", message: isErr, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        })
            
    }

    @objc func refresh(_ sender: AnyObject) {
        loadNowplayingMovies(movieFeed: .nowPlaying)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nowPlayingCell") as! MovieTableViewCell
        fecthMovieVM.downloadMovieImage(poster_Path: list[indexPath.row].poster_path, completion: {
            imgValue in
            cell.img.image = imgValue
        })
        cell.title.text = list[indexPath.row].title
        cell.overview.text = list[indexPath.row].overview
        return cell
    }
    


}

