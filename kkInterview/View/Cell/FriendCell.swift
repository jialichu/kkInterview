//
//  FriendCell.swift
//  kkInterview
//
//  Created by Apple on 2025/3/25.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var starImgeView: UIImageView!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!    
    
    @IBOutlet weak var transferBtn: UIButton!
    
    @IBOutlet weak var inviteBtn: UIButton!
    
    @IBOutlet weak var moreBtn: UIButton!
    
    var viewModel: Friend? {
        didSet {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.name
            starImgeView.isHidden = viewModel.isTop.toBool()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setView()
    }
    
    private func setView() {
        inviteBtn.isEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
