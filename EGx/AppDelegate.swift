//
//  AppDelegate.swift
//  EGx
//
//  Created by 少 on 2018/1/20.
//  Copyright © 2018年 少. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
         let mainWindows = NSApp.windows.first
        mainWindows?.titleVisibility = .hidden
        mainWindows?.titlebarAppearsTransparent = true
        mainWindows?.styleMask.insert(.fullSizeContentView)
        

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

