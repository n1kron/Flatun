//
//  ViewController.swift
//  FlatunTask
//
//  Created by  Kostantin Zarubin on 18.08.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsData.shared.getData(id: 21)
    }
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsData.shared.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListCell", for: indexPath) as! NewsListCell
        let news = NewsData.shared.news[indexPath.row]
        cell.newsImageView.kf.setImage(with: URL(string: news.image), completionHandler: { (image, error, cacheType, imageUrl) in
        })
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}

