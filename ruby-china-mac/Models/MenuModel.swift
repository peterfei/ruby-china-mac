//
//  MenuModel.swift
//  ruby-china-mac
//
//  Created by peterfei on 2016/12/7.
//  Copyright © 2016年 peterfei. All rights reserved.
//

import Cocoa

class MenuModel: NSObject {
    var title = ""
    var imageName = ""
    
    init(title: String , imageName: String) {
        super.init()
        self.title = title
        self.imageName = imageName
    }

}
