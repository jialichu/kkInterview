//
//  FriendEmptyView.swift
//  kkInterview
//
//  Created by Apple on 2025/3/27.
//

import UIKit

class FriendEmptyView: UIView {

    @IBOutlet weak var addFriendBtn: UIButton!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func draw(_ rect: CGRect) {
        let frogGreen = UIColor(rgb: 0x56b30b, alpha: 1)
        let booger = UIColor(rgb: 0xa6cc42, alpha: 1)
        addFriendBtn.applyGradient(colours: [frogGreen, booger], buttonSize: CGSize(width: 192, height: 40))
        addFriendBtn.setTitleColor(.white, for: .normal)
        descriptionTextView.setApartLinkStyle("幫助好友更快找到你？設定 KOKO ID", findTextAsLink: "設定 KOKO ID", linkURL: "", alignment: .center)
        descriptionTextView.isScrollEnabled = false
    }
    

}
