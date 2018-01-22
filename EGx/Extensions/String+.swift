//
//  String+.swift
//  EGx
//
//  Created by 少 on 2018/1/22.
//  Copyright © 2018年 少. All rights reserved.
//

import Foundation

extension String {
    var url: URL? {
        return URL(string: self)
    }
}
