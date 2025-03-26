//
//  FriendRepository.swift
//  kkInterview
//
//  Created by Apple on 2025/3/26.
//

import Foundation

class FriendRepository {
    
    func getFriend() async -> [Friend] {
        let url = API.friend_invite
        return await HttpRequest.shared.fetch(url: url, type: Friend.self)
    }
}
