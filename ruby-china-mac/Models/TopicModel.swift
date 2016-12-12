//
//  TopicModel.swift
//  ruby-china-mac
//
//  Created by peterfei on 2016/12/9.
//  Copyright © 2016年 peterfei. All rights reserved.
//

import Cocoa
import SwiftyJSON

class TopicModel: NSObject {
    var imageUrl: String    = ""
    var title: String       = ""
    var id: Int      = 0
    class func mapping(_ json:JSON) -> TopicModel{
        let article = TopicModel()
//        let createDate = json["createDate"].doubleValue
//        let viewCount = json["viewCount"].int64!
        article.id = json["id"].intValue
        article.title = json["title"].stringValue
//        article.source = json["sourceName"].stringValue
//        article.viewCount = viewCount
//        article.createDate = createDate
        article.imageUrl = json["imageUrl"].stringValue
//        article.url = ServiceApi.getArticlShowDetailUrl(article.articleId)
        return article
    }

}
