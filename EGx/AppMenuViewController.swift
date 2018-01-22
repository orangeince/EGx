//
//  AppMenuViewController.swift
//  EGx
//
//  Created by 少 on 2018/1/20.
//  Copyright © 2018年 少. All rights reserved.
//

import Cocoa

class AppMenuViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView! {
        didSet {
            imageView.wantsLayer = true
            imageView.backgroundColor = .clear
            imageView.layer?.cornerRadius = 30
            imageView.layer?.masksToBounds = true
            imageView.layer?.borderColor = NSColor.white.cgColor
            imageView.layer?.borderWidth = 2
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor(hex: "#FAFAFA").cgColor
    }

}
