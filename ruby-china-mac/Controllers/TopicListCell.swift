//
//  TopicListCell.swift
//  ruby-china-mac
//
//  Created by peterfei on 2016/12/9.
//  Copyright © 2016年 peterfei. All rights reserved.
//

import Cocoa

class TopicListCell: NSTableCellView {

    @IBOutlet weak var wrapView: NSView!
    
    @IBOutlet weak var iconImageView: NSImageView!
    
    
    @IBOutlet weak var titleField: NSTextField!
    @IBOutlet weak var secondField: NSTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        wrapView.layer?.backgroundColor = NSColor.gray.cgColor
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    func configureCell(_ topic:TopicModel) {
        titleField.stringValue = topic.title
        
       
//        iconImageView.setImage(article.imageUrl, placeholder: NSImage(named: "placeholder-image"))
    }
}
