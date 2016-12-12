//
//  NSImageView+Ext.swift
//  ruby-china-mac
//
//  Created by peterfei on 2016/12/12.
//  Copyright © 2016年 peterfei. All rights reserved.
//

import Cocoa
import Kingfisher

extension NSImageView {
    
    func setImage(_ url: String, placeholder: NSImage?) {
        self.kf.setImage(with: URL(string: url), placeholder: placeholder, options: nil, progressBlock: nil, completionHandler: nil)
    }
    
}
