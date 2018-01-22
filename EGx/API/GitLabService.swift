//
//  GitLabService.swift
//  EGx
//
//  Created by 少 on 2018/1/22.
//  Copyright © 2018年 少. All rights reserved.
//

import Moya

enum GitLabService {
    case userProfile(id: Int)
    case accout
}

extension GitLabService: TargetType {
    var baseURL: URL { return "https://cichang8.com/api/v4".url! }
    
    var path: String {
        switch self {
        case .accout:
            return "/user"
        case .userProfile(id: let id):
            return "/users/\(id)"
        }
    }
    
    var method: Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .accout, .userProfile:
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        return "{}".data(using: .utf8)!
    }

    var headers: [String : String]? {
        return ["Content-type": "application/json",
                "Private-Token": "xCdp7Hk8m1pxBEsF8emB"]
    }
}
