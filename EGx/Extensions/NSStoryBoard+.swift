//
//  NSStoryBoard+.swift
//  EGx
//
//  Created by 少 on 2018/1/22.
//  Copyright © 2018年 少. All rights reserved.
//

import Foundation
import Cocoa

extension NSStoryboard {
    func instantiateViewController<T>(ofType type: T.Type) -> T {
        return instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(String(describing: type))) as! T
    }
}
