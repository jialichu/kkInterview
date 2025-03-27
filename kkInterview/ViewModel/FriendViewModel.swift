//
//  FriendViewModel.swift
//  kkInterview
//
//  Created by Apple on 2025/3/25.
//

import Foundation

class FriendViewModel {
    
    enum Stauts {
        case noFriend
        case combineFriends
        case friendWithInvite
    }
    
    /// 頁面顯示的狀態
    var staus = Stauts.noFriend
    
    /// 沒有朋友
    var isEmpty: Observable<Bool> = Observable(false)
    
    /// 使用者資料
    var man: Observable<Man> = Observable(nil)
    
    /// 朋友列表(原始)
    var friendList = [Friend]()
    
    /// 朋友列表(view)
    var friendViewList: Observable<[Friend]> = Observable([])
    ///  邀請送出的朋友列表
    var invitingFriendList: Observable<[String]> = Observable([])
    
    
    lazy var repository = {
       FriendRepository()
    }()
    
    /// 取得合併後的好友列表
    func getCombineFriendList() async {
        let friendList_1: [Friend] = await repository.getFriendList_1()
        let friendList_2: [Friend] = await repository.getFriendList_2()
        
        let mergedDict = (friendList_1 + friendList_2).reduce(into: [String: Friend]()) { dict, friend in
            if let repeatFriend = dict[friend.fid] {
                if friend.compareDate! > repeatFriend.compareDate! {
                    dict[friend.fid] = friend
                }
            } else {
                dict[friend.fid] = friend
            }
        }
        
        friendList = Array(mergedDict.values)
        friendViewList.value = friendList
    }

    /// 取得使用者資料
    func getMan() async {
        man.value = await repository.getMan()
    }
    
    /// 好友列表含邀請列表
    func getInvitingFriendList() async {
        var friendList = await repository.getInvitingFriendList()
        
        // 好友邀請列表
        let invitingFriendList = friendList.filter { $0.status == 0 }
        self.invitingFriendList.value = invitingFriendList.map({ $0.name })
        
        // 好友列表
        friendList = friendList.filter { $0.status != 0 }
        self.friendList = friendList
        self.friendViewList.value = friendList
    }
    
    /// 好友列表為空
    func getEmptyFriendList() async {
        friendViewList.value = await repository.getEmptyList()
        isEmpty.value = friendViewList.value?.isEmpty
    }
    
    /// 篩選朋友
    func filterFriend(searchText: String) {
        if searchText.isEmpty {
            friendViewList.value = friendList
        } else {
            friendViewList.value =  friendList.filter({ $0.name.localizedStandardContains(searchText)
            })
        }
    }
}
