//
//  CardStackView.swift
//  kkInterview
//
//  Created by Apple on 2025/3/26.
//

import UIKit

class CardStackView: UIStackView {
    private var friends: [String]!

    private func setView() {
        friends.forEach {
            let view: FriendCardView = UIView.fromNib()
            view.nameLabel.text = $0
            view.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview(view)
        }
        axis = .vertical
        spacing = 10
        distribution = .equalSpacing
    }
    
    convenience init(frame: CGRect, friends: [String]) {
        self.init(frame: frame)
        self.friends = friends
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setView()
        
    }
}
