//
//  TabViewController.swift
//  ruby-china-mac
//
//  Created by peterfei on 2016/12/7.
//  Copyright © 2016年 peterfei. All rights reserved.
//
import Cocoa

class TabViewController: NSTabViewController {
    
    // MARK: - Lifecycle
    
    override init?(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setTheme()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setTheme()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Private
    
    fileprivate func setTheme() {
        self.tabStyle = .unspecified
    }
    
}
