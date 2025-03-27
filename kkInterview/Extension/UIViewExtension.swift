//
//  UIViewExtension.swift
//  kkInterview
//
//  Created by Apple on 2025/3/26.
//

import UIKit

extension UIView {
    
    /**awakeFromNib**/
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    func cornerWithShadow(cornerRadius: CGFloat, shadowColor: UIColor = .black, shadowOpacity: Float = 0.3, shadowOffset: CGSize = CGSize(width: 2, height: 2)) {
        layoutSubviews()
        
        // 設定陰影
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = UIColor.white.cgColor
        shadowLayer.shadowOffset = shadowOffset
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = cornerRadius
        
        // 把陰影 layer 放到底層
        self.layer.insertSublayer(shadowLayer, at: 0)
    }
    
    func applyGradient(colours: [UIColor], buttonSize: CGSize) {
        self.applyGradient(colours: colours, locations: nil, buttonSize: buttonSize)
    }
        
    private func applyGradient(colours: [UIColor], locations: [NSNumber]?, buttonSize: CGSize) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = buttonSize.height / 2
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}
