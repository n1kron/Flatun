//
//  MenuListTableViewController.swift
//  FlatunTask
//
//  Created by  Kostantin Zarubin on 18.08.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit
import SideMenu
import Kingfisher

class MenuListTableViewController: UITableViewController {

    @IBOutlet var providerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataProvider.shared.getData()
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor.clear
        NotificationCenter.default.addObserver(forName: .provider, object: nil, queue: nil) { [weak self] (notification) in
            self?.providerTableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataProvider.shared.providers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuListCell", for: indexPath) as! MenuListCell
        let provider = DataProvider.shared.providers[indexPath.row]
        cell.menuLabel.text = provider.name
        cell.menuImageView.kf.setImage(with: URL(string: provider.image), completionHandler: { (image, error, cacheType, imageUrl) in
        })
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height * 0.08995502249
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
