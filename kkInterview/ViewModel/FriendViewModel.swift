//
//  FriendViewModel.swift
//  kkInterview
//
//  Created by Apple on 2025/3/25.
//

import Foundation

class FriendViewModel {
    
//    var friendList: Observable<[Friend]> = Observable([])
    var reloadTableView: (()-> Void)?
    var friendList = [Friend]() {
        didSet {
            reloadTableView?()            
        }
    }
    
    lazy var repository = {
       FriendRepository()
    }()
    
    func getFriendList() async {
        friendList = await repository.getFriend()
    }
}
