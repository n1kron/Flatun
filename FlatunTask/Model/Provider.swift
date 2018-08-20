//
//  Provider.swift
//  FlatunTask
//
//  Created by  Kostantin Zarubin on 18.06.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import Foundation

struct Provider: Codable {
    let name: String
    let id: Int
    let image: String
    
    init(dict: [String: Any]) {
        name = dict["name"] as? String ?? ""
        id = dict["id"] as? Int ?? 0
        image = dict["image"] as? String ?? ""
    }
}
