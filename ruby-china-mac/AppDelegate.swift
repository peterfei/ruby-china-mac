//
//  AppDelegate.swift
//  ruby-china-mac
//
//  Created by peterfei on 2016/12/7.
//  Copyright © 2016年 peterfei. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

var windowController: NSWindowController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        windowController = NSApplication.shared().mainWindow?.windowController
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

