//
//  FriendsLoader.swift
//  Vk
//
//  Created by Александр Чигрин on 09.12.2021.
//

class FriendsLoader {
    
    static var user =
    [UserModel(avatar: "f1", name: "Kostya", surname: "Vlasov"),
     UserModel(avatar: "f2", name: "Andrew", surname: "Chumachenko"),
     UserModel(avatar: "f3", name: "Lola", surname: "Dola"),
     UserModel(avatar: "f4", name: "Dmitriy", surname: "Yarosh"),
     UserModel(avatar: "f5", name: "Julia", surname: "Kanchikova")]
    
    static func iNeedFriends() -> [FriendsSection] {
        let sortedArray = sortFriends(array: user)
        let sectionsArray = formFriendsSection(array: sortedArray)
        return sectionsArray
    }
    
    static func sortFriends(array: [UserModel]) -> [Character: [UserModel]] {
        var newArray: [Character: [UserModel]] = [:]
        for friend in array {
            guard let firstChar = friend.surname.first else {
                continue
            }
            
            guard var array = newArray[firstChar] else {
                let newValue = [friend]
                newArray.updateValue(newValue, forKey: firstChar)
                continue
            }
            
            array.append(friend)
            newArray.updateValue(array, forKey: firstChar)
        }
        return newArray
    }
    
    static func formFriendsSection(array: [Character: [UserModel]]) -> [FriendsSection] {
        var sectionArray: [FriendsSection] = []
        for (key, array) in array {
            sectionArray.append(FriendsSection(key: key, data: array))
        }
        sectionArray.sort { $0 < $1 }
        
        return sectionArray
    }
}
