//
//  TabBarC.swift
//  kkInterview
//
//  Created by Apple on 2025/3/20.
//

import UIKit

class TabBarC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        creatViewControllers()
        setView()
    }
    
    private func creatViewControllers() {
        
        
        
        // 錢錢
        let moneyVC = UIViewController()
        moneyVC.view.backgroundColor = .white
        let moneyImg = UIImage(named: "icTabbarProductsOff")
        moneyVC.tabBarItem = UITabBarItem(title: nil, image: moneyImg, tag: 0)
        
        // 朋友
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let friendNC = storyboard.instantiateViewController(withIdentifier: "NaviC")
        let friendImg = UIImage(named: "icTabbarFriendsOn")
        friendNC.tabBarItem = UITabBarItem(title: nil, image: friendImg, tag: 1)
        
        // 首頁
        let homeVC = UIViewController()
        homeVC.view.backgroundColor = .white
        let homeImg = UIImage(named: "icTabbarHomeOff")
        homeVC.tabBarItem = UITabBarItem(title: nil, image: homeImg?.withRenderingMode(.alwaysOriginal), tag: 1)
        
        // 記帳
        let accountVC = UIViewController()
        accountVC.view.backgroundColor = .white
        let accountImg = UIImage(named: "icTabbarManageOff")
        accountVC.tabBarItem = UITabBarItem(title: nil, image: accountImg, tag: 2)
        
        // 設定
        let settingVC = UIViewController()
        settingVC.view.backgroundColor = .white
        let settingImg = UIImage(named: "icTabbarSettingOff")
        settingVC.tabBarItem = UITabBarItem(title: nil, image: settingImg, tag: 4)

        
        viewControllers = [moneyVC, friendNC, homeVC, accountVC, settingVC]
        
        guard let viewControllers = viewControllers else {
            return
        }
        
        for vc in viewControllers {
            vc.tabBarItem.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
        }
        
        // 設定homeBarImg
        
        viewControllers[2].tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    private func setView() {
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.normal.iconColor = ColorGuide.lightGrey
        appearance.stackedLayoutAppearance.selected.iconColor = ColorGuide.hotPink
        appearance.backgroundColor = .white
        
        
        if #available(iOS 15.0, *) {
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        } else {
            tabBar.standardAppearance = appearance
        }
        selectedIndex = 1
    }

 

}
