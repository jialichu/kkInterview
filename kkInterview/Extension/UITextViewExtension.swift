//
//  UITextViewExtension.swift
//  kkInterview
//
//  Created by Apple on 2025/3/27.
//

import UIKit

extension UITextView {
    /**設定部分超連結文字*/
    func setApartLinkStyle(_ text: String, findTextAsLink: String, linkURL: String, alignment: NSTextAlignment) {
        let attri: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: 14.0, weight: .semibold),
            .foregroundColor: ColorGuide.lightGrey
        ]
        let linkAttri: [NSAttributedString.Key : Any] = [
            .foregroundColor: ColorGuide.hotPink,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        let mutableAttriString = NSMutableAttributedString(string: text, attributes: attri)
        mutableAttriString.setAsLink(textToFind: findTextAsLink, linkURL: linkURL)
        self.attributedText = mutableAttriString
        self.textAlignment = alignment
        self.linkTextAttributes = linkAttri
    }
}
