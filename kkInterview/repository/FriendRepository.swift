//
//  FriendRepository.swift
//  kkInterview
//
//  Created by Apple on 2025/3/26.
//

import Foundation

class FriendRepository {
    
    /// 取得好友列表1
    func getFriendList_1() async -> [Friend] {
        let url = API.friend_1
        return await HttpRequest.shared.fetch(url: url, type: Friend.self)
    }
    
    /// 取得好友列表2
    func getFriendList_2() async -> [Friend] {
        let url = API.friend_2
        return await HttpRequest.shared.fetch(url: url, type: Friend.self)
    }
    
    
    /// 取得使用者資料
    func getMan() async -> Man {
        let url = API.man
        return await HttpRequest.shared.fetch(url: url, type: Man.self)[0]
    }
    
    /// 好友列表含邀請列表
    func getInvitingFriendList() async -> [Friend] {
        let url = API.friend_invite
        return await HttpRequest.shared.fetch(url: url, type: Friend.self)
    }
}
