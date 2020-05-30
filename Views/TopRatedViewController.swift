//
//  TopRatedViewController.swift
//  Movie
//
//  Created by Ma Alice on 5/30/20.
//  Copyright © 2020 Ma Alice. All rights reserved.
//

import UIKit

class TopRatedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let fecthMovieMV = FetchMovieViewModel()
    var list = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadTopRated(movieFeed: .topRated)
    }
    
    func loadTopRated(movieFeed: MovieFeed) {
//        NetWork.shared.fetchMovies(movieFeed: .topRated, completion: { movies,<#arg#>  in
//            self.list = movies
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topRatedCell") as! MovieTableViewCell
        cell.title.text = list[indexPath.row].title
        cell.overview.text = list[indexPath.row].overview
        fecthMovieMV.downloadMovieImage(poster_Path: list[indexPath.row].poster_path, completion: { imgValue in
             cell.img.image = imgValue
        })
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
