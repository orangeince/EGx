//
//  Date+.swift
//  EGx
//
//  Created by 少 on 2018/1/22.
//  Copyright © 2018年 少. All rights reserved.
//

import Foundation

extension Date {
    func dateString(with format: String) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = format
        dateFormater.locale = Locale.current
        return dateFormater.string(from: self)
    }
    var MdHm: String {
        return dateString(with: "MM-dd HH:mm")
    }
    
    var passedTimeDescription: String {
        let calendar = Calendar.current
        let now = Date()
        if self.compare(now) == .orderedDescending {
            return MdHm
        }
        
        let diff = (calendar as NSCalendar).components([.day, .hour, .minute, .second], from: self, to: now, options: .matchStrictly)
        if diff.day! > 0 {
            if diff.day! <= 30 {
                return String(format: "%d天前", diff.day!)
            } else {
                return self.dateString(with: "MM-dd")
            }
        }
        if diff.hour! > 0 {
            return String(format: "%d小时前", diff.hour!)
        }
        if diff.minute! > 0 {
            return String(format: "%d分钟前", diff.minute!)
        }
        return String(format: "%d秒前", diff.second!)
    }
}
