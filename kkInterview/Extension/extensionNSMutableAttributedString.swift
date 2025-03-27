//
//  extensionNSMutableAttributedString.swift
//  kkInterview
//
//  Created by Apple on 2025/3/27.
//

import Foundation

extension NSMutableAttributedString {
    /**文字設定超連結*/
    func setAsLink(textToFind:String, linkURL:String) {
        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(.link, value: linkURL, range: foundRange)
        }
    }
}
