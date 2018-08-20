//
//  Cells.swift
//  FlatunTask
//
//  Created by  Kostantin Zarubin on 19.08.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class NewsListCell: UITableViewCell {
    @IBOutlet weak var newsImageView: UIImageView!
    
}

class MenuListCell: UITableViewCell {
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    
    override func awakeFromNib() {
        menuImageView.layer.cornerRadius = 19.0
    }
}
