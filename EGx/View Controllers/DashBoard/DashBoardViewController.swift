//
//  DashBoardViewController.swift
//  EGx
//
//  Created by 少 on 2018/1/20.
//  Copyright © 2018年 少. All rights reserved.
//

import Cocoa

class DashBoardViewController: NSViewController {

    @IBOutlet weak var sparatorView: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        sparatorView.backgroundColor = NSColor(hex: "#D3C6E0")
    }
    
}
