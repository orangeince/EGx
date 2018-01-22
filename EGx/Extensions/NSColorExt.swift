//
//  NSColorExt.swift
//  EGx
//
//  Created by 少 on 2018/1/20.
//  Copyright © 2018年 少. All rights reserved.
//

import AppKit

extension NSColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    convenience init(hex: String) {
        guard hex.hasPrefix("#") else {
            fatalError("hex string invalied!")
        }
        
        let hexString: String = String(hex[String.Index.init(encodedOffset: 1)...])
        var hexValue:  UInt32 = 0
        
        guard Scanner(string: hexString).scanHexInt32(&hexValue) else {
            fatalError("hex string invalied!")
        }
        
        switch (hexString.count) {
        case 6:
            self.init(rgb: Int(hexValue))
        default:
            fatalError("hex string invalied!")
        }
    }
}
