//
//  Friend.swift
//  kkInterview
//
//  Created by Apple on 2025/3/26.
//

import Foundation

struct Friend: Codable {
    let name: String
    let status: Int
    let isTop: String
    let fid: String
    let updateDate: String
    var compareDate: Int? {
        let date = updateDate.replacingOccurrences(of: "/", with: "")
        return Int(date)
    }    
}

