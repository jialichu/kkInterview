//
//  FriendCardView.swift
//  kkInterview
//
//  Created by Apple on 2025/3/25.
//

import UIKit

class FriendCardView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
        
    override func draw(_ rect: CGRect) {        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 設定陰影
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 7).cgPath
        shadowLayer.fillColor = UIColor.white.cgColor
        shadowLayer.shadowOffset = CGSize(width: 2, height: 2)
        shadowLayer.shadowOpacity = 0.3
        shadowLayer.shadowRadius = 7
        
        // 把陰影 layer 放到底層
        self.layer.insertSublayer(shadowLayer, at: 0)
        
    }
    

}
