//
//  FeedItem.swift
//  FlatunTask
//
//  Created by  Kostantin Zarubin on 18.06.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import Foundation

struct FeedItem: Codable {
    let image: String
    let title: String
    let published: String
    let likes_count: String
    //let provider: Provider
    
    init(dict: [String: Any]) {
        title = dict["title"] as? String ?? ""
        published = dict["published"] as? String ?? ""
        image = dict["image"] as? String ?? ""
        likes_count = dict["likes_count"] as? String ?? ""
        //provider = (dict["provider"] as? Provider)!
    }
}
