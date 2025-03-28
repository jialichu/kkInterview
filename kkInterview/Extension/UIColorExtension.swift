//
//  UIColorExtension.swift
//  kkInterview
//
//  Created by Apple on 2025/3/20.
//

import UIKit

/**色碼轉換器**/
extension UIColor{
    convenience init(rgb: UInt,alpha: CGFloat) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}

