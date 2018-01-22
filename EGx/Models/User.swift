//
//  User.swift
//  EGx
//
//  Created by 少 on 2018/1/22.
//  Copyright © 2018年 少. All rights reserved.
//

import Foundation
import ObjectMapper

class User: ProfileBaseModel {
    var username: String = ""
    
    override func mapping(map: Map) {
        username <- map["username"]
        super.mapping(map: map)
    }
}
