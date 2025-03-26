//
//  BadgeView.swift
//  kkInterview
//
//  Created by Apple on 2025/3/25.
//

import UIKit

class BadgeView: UILabel {
    
    var topInset: CGFloat = 2
    var leftInset: CGFloat = 2
    var bottomInset: CGFloat = 2
    var rightInset: CGFloat = 2
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height = 22
        contentSize.width = contentSize.width + 12
        return contentSize
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
        super.drawText(in: rect.inset(by: insets))
    }
        
    
    private func setView() {
        backgroundColor = ColorGuide.veryLightPink
        textColor = .white
        font = .systemFont(ofSize: 12, weight: .medium)
        textAlignment = .center
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
