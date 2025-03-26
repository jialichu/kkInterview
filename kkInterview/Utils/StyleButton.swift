//
//  StyleButton.swift
//  kkInterview
//
//  Created by Apple on 2025/3/25.
//

import UIKit

class StyleButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                if let color = normalColor{
                    titleLabel?.textColor = color
                    layer.borderWidth = 1
                    layer.borderColor = color.cgColor
                }
            } else {
                if let color = disableColor {
                    titleLabel?.textColor = color
                    layer.borderWidth = 1
                    layer.borderColor = color.cgColor
                }
            }
        }
    }

    private var disableColor: UIColor?
    private var normalColor: UIColor? {
        didSet {
            titleLabel?.textColor = normalColor
            layer.borderWidth = 1
            layer.borderColor = normalColor!.cgColor
        }
    }
    
    private func setView() {
        normalColor = ColorGuide.hotPink
        disableColor = ColorGuide.lightGrey
        let normalAttributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .medium),
            .foregroundColor: ColorGuide.hotPink
        ]
        let disabledAttributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .medium),
            .foregroundColor: ColorGuide.lightGrey
        ]
        let normalString = NSAttributedString(string: titleLabel?.text ?? "", attributes: normalAttributes)
        let disabledString = NSAttributedString(string: titleLabel?.text ?? "", attributes: disabledAttributes)
        
        setAttributedTitle(normalString, for: .normal)
        setAttributedTitle(disabledString, for: .disabled)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
}
