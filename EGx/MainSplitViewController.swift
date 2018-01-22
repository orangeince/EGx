//
//  MainSplitViewController.swift
//  EGx
//
//  Created by 少 on 2018/1/20.
//  Copyright © 2018年 少. All rights reserved.
//

import Cocoa

class MainSplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //splitView.dividerColor = NSColor(hex: "#DDE0E0")
    }
    
    
//    override func splitView(_ splitView: NSSplitView, resizeSubviewsWithOldSize oldSize: NSSize) {
//        let dividerThickness = splitView.dividerThickness
//
//        var leftRect = splitView.subviews[0].frame
//        var rightRect = splitView.subviews[1].frame
//        let newFrame = splitView.frame
//
//        leftRect.size.height = newFrame.size.height
//        leftRect.origin = .zero
//        rightRect.size.width = newFrame.width - leftRect.width
//        rightRect.size.height = newFrame.height
//        rightRect.origin.x = leftRect.width + dividerThickness
//
//        splitView.subviews[0].frame = leftRect
//        splitView.subviews[1].frame = rightRect
//    }
    
}
