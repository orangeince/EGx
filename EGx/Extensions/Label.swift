//
//  Label.swift
//  EGx
//
//  Created by 少 on 2018/1/24.
//  Copyright © 2018年 少. All rights reserved.
//

import Cocoa

class Label: NSTextField {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setup()
    }
    
    convenience init(size: CGFloat,  color: NSColor? = nil) {
        self.init()
        font = NSFont.systemFont(ofSize: size)
        textColor = color
    }
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        isBezeled = false
        drawsBackground = false
        isEditable = false
        isSelectable = false
    }
    
    var title: String {
        get {
            return stringValue
        }
        set {
            stringValue = newValue
        }
    }
}
