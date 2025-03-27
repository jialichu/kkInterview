//
//  AppUtils.swift
//  kkInterview
//
//  Created by Apple on 2025/3/27.
//

import MBProgressHUD
import UIKit

class AppUtils {
    
    static let shared = AppUtils()
    private init() {}
    
    @discardableResult
    func showLoadingView(_ view: UIView, dimBackground: Bool = false) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        return hud
    }
    
    func hideLoadingView(_ view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    func hideLoadingView(_ hud: MBProgressHUD) {
        hud.hide(animated: true)
    }
    
}
