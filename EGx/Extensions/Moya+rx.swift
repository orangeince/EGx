//
//  Moya+rx.swift
//  EGx
//
//  Created by 少 on 2018/1/22.
//  Copyright © 2018年 少. All rights reserved.
//

import Foundation
import Cocoa
import Moya
import RxSwift
import SwiftyJSON
import ObjectMapper

enum RequestError: Error, LocalizedError {
    case invalidData
    
    var localizedDescription: String {
        return "未识别的数据"
    }
}

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    public func json() -> Single<JSON> {
        return mapJSON().map(JSON.init)
    }
    
    public func model<ModelType: Mappable>(_ type: ModelType.Type) -> Single<ModelType> {
        return json().map { json in
            guard let model = ModelType(json: json) else {
                throw RequestError.invalidData
            }
            return model
        }
    }
}

