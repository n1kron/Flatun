//
//  FetchData.swift
//  FlatunTask
//
//  Created by  Kostantin Zarubin on 19.08.2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit
import Alamofire

class DataProvider {
    var providers: [Provider] = []
    static let shared = DataProvider()
    
    func getData() {
        Alamofire.request("http://www.flatun.com/api/provider/").responseJSON { (response) in
            if let unparsedProviders = response.result.value as? [[String: Any]] {
                self.providers.removeAll()
                unparsedProviders.forEach {
                    let provider: Provider = Provider(dict: $0)
                    self.providers.append(provider)
                }
                NotificationCenter.default.post(name: .provider, object: nil)
            }
        }
    }
}

class NewsData {
    var news: [FeedItem] = []
    static let shared = NewsData()
    
    func getData(id:Int) {
        Alamofire.request("http://www.flatun.com/api/feed_item/?provider\(id)").responseJSON { (response) in
            if let JSON = response.result.value {
                let json = JSON as! [String: Any]
                if let unparsedProviders = json["results"] as? [[String: Any]] {
                    self.news.removeAll()
                    for key in unparsedProviders {
                        print(key)
                        let item: FeedItem = FeedItem(dict: key)
                        self.news.append(item)
                    }
                    NotificationCenter.default.post(name: .news, object: nil)
                }
            }
        }
    }
}

extension Notification.Name {
    static let provider = Notification.Name("provider")
    static let news = Notification.Name("news")
}
