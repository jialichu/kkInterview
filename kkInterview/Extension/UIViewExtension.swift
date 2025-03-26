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
}
