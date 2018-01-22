//
//  Mapper+.swift
//  EGx
//
//  Created by 少 on 2018/1/22.
//  Copyright © 2018年 少. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

extension Mappable {
    public init?(json: JSON) {
        self.init(JSON: json.dictionaryObject ?? [:])
    }
}

open class DateTransform: TransformType {
    public typealias Object = Date
    public typealias JSON = String
    
    public enum DateFormat: String {
        case yyyyMMddTHHmmssZZZZZ = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        case yyyyMMddTHHmmssSSSZ = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        case yyyyMMddTHHmmssZ = "yyyy-MM-dd'T'HH:mm:ssZ"
        case yyyyMMdd = "yyyy-MM-dd"
        case automatically
    }
    
    private let dateFormat: DateFormat
    private let formatter: DateFormatter
    
    public init(dateFormat: DateFormat = .automatically) {
        self.formatter = DateFormatter()
        self.dateFormat = dateFormat
        formatter.timeZone = TimeZone.current
    }
    
    open func transformFromJSON(_ value: Any?) -> Date? {
        guard let dateString = value as? DateTransform.JSON, !dateString.isEmpty else {
            return nil
        }
        
        if case .automatically = self.dateFormat {
            var result: Date?
            transform: for format in [DateFormat.yyyyMMddTHHmmssZZZZZ, DateFormat.yyyyMMddTHHmmssSSSZ, DateFormat.yyyyMMddTHHmmssZ, DateFormat.yyyyMMdd] {
                formatter.dateFormat = format.rawValue
                guard let date = formatter.date(from: dateString) else { continue }
                result = date
                break transform
            }
            return result
        } else {
            formatter.dateFormat = dateFormat.rawValue
            return formatter.date(from: dateString)
        }
    }
    
    open func transformToJSON(_ value: Date?) -> String? {
        if let date = value {
            return formatter.string(from: date)
        }
        return nil
    }
}
