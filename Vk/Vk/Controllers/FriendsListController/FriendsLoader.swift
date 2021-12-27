//
//  FriendsLoader.swift
//  Vk
//
//  Created by Александр Чигрин on 09.12.2021.
//

class FriendsLoader {
    
    static var user =
    [UserModel(name: "Kostya", surname: "Vlasov", avatar: "f1", storedImages: ["st1", "st2", "st3", "st4"]),
     UserModel(name: "Andrew", surname: "Chumachenko", avatar: "f2", storedImages: ["st1", "st2", "st3", "st4"]),
     UserModel(name: "Lola", surname: "Dola", avatar: "f3", storedImages: ["st1", "st2", "st3", "st4"]),
     UserModel(name: "Dmitriy", surname: "Yarosh", avatar: "f4", storedImages: ["st1", "st2", "st3", "st4"]),
     UserModel(name: "Julia", surname: "Kanchikova", avatar: "f5", storedImages: ["st1", "st2", "st3", "st4"]),
     UserModel(name: "Aleksey", surname: "Demchenko", avatar: "f6", storedImages: ["st1", "st2", "st3", "st4"])]
    
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



