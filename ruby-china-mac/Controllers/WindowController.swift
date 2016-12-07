//
//  WindowController.swift
//  ruby-china-mac
//
//  Created by peterfei on 2016/12/7.
//  Copyright © 2016年 peterfei. All rights reserved.
//

import Cocoa

import Cocoa

class WindowController: NSWindowController {
    
    private var _splitViewController: NSSplitViewController?
    var splitViewController: NSSplitViewController? {
        get {
            return _splitViewController
        }
    }
    
    // MARK: - Lifecycle
    
    override func windowDidLoad() {
        super.windowDidLoad()
        _splitViewController = window?.contentViewController as? NSSplitViewController
        window?.title = "RUBY-China"
        window?.isRestorable = false
        window?.setFrame(NSRect(x: 0.0, y: 0.0, width: 750.0, height: 600.0), display: true)
        window?.minSize = NSSize(width: 750.0, height: 600.0)
        window?.center()
    }
    
    
    // MARK: - Public
    
    /// 获取TabViewController
    ///
    /// - returns: TabViewController
    func tabViewController() -> TabViewController? {
        guard let splitViewController = _splitViewController else {
            return nil
        }
        for vc in splitViewController.childViewControllers {
            if vc is TabViewController {
                let tabVc = vc as! TabViewController
                return tabVc
            }
        }
        return nil
    }
    
}
