//
//  FriendsSection.swift
//  Vk
//
//  Created by Александр Чигрин on 09.12.2021.
//

import CoreGraphics

struct FriendsSection: Comparable {
    var key: Character
    var data: [UserModel]
    
    static func < (lhs: FriendsSection, rhs: FriendsSection) -> Bool {
        return lhs.key < rhs.key
    }
    
    static func == (lhs: FriendsSection, rhs: FriendsSection) -> Bool {
        return lhs.key == rhs.key
    }
}
