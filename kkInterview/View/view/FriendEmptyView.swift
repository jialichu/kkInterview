//
//  FriendEmptyView.swift
//  kkInterview
//
//  Created by Apple on 2025/3/27.
//

import UIKit

class FriendEmptyView: UIView {

    @IBOutlet weak var addFriendBtn: UIButton!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let frogGreen = UIColor(rgb: 0x56b30b, alpha: 1)
        let booger = UIColor(rgb: 0xa6cc42, alpha: 1)
        addFriendBtn.applyGradient(colours: [frogGreen, booger], buttonSize: CGSize(width: 192, height: 40))
    }
    

}
