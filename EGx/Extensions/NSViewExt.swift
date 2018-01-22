//
//  NSViewExt.swift
//  EGx
//
//  Created by 少 on 2018/1/20.
//  Copyright © 2018年 少. All rights reserved.
//

import AppKit

extension NSView {
    var backgroundColor: NSColor? {
        get {
            guard let color = layer?.backgroundColor else { return nil }
            return NSColor(cgColor: color)
        }
        set {
            wantsLayer = true
            layer?.backgroundColor = newValue?.cgColor
        }
    }
}
