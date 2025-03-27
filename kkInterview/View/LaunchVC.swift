//
//  LaunchVC.swift
//  kkInterview
//
//  Created by Apple on 2025/3/27.
//

import UIKit

class LaunchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showFriendVC(_ sender: UIButton) {
        let tabBarC = storyboard?.instantiateViewController(withIdentifier: "TabBarC") as! TabBarC
        tabBarC.modalPresentationStyle = .fullScreen
        _ = tabBarC.view // 加載viewControllers
        let nc = tabBarC.viewControllers![1] as! FriendNC
        let friendVC = nc.viewControllers.first as! FriendVC
        
        switch sender.tag {
        case 0:
            friendVC.viewModel.staus = .noFriend
        case 1:
            friendVC.viewModel.staus = .combineFriends
        case 2:
            friendVC.viewModel.staus = .friendWithInvite
        default:
            break
        }
        present(tabBarC, animated: true)
    }
    
}
