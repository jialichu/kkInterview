//
//  StringExtension.swift
//  kkInterview
//
//  Created by Apple on 2025/3/26.
//

import Foundation

extension String {
    /**字串轉布林*/
    func toBool() -> Bool {
        switch self {
        case "True", "true", "T", "yes", "1":
            return true
        case "False", "false", "F", "no", "0":
            return false
        default:
            return false
        }
    }
}
